-- ~/.config/nvim/lua/config/pack-clean.lua (o pegalo en tu init.lua)
--
-- vim.pack no tiene un ":Lazy clean" automático. Este comando encuentra
-- los plugins que quedaron instalados en disco pero ya no están
-- declarados en ningún vim.pack.add() de tu config actual (el campo
-- `active` de vim.pack.get() es exactamente para esto), y los borra con
-- confirmación.

vim.api.nvim_create_user_command("PackClean", function()
    local plugins = vim.pack.get()
    local orphans = vim.tbl_filter(function(p)
        return not p.active
    end, plugins)

    if #orphans == 0 then
        vim.notify("PackClean: no hay plugins huérfanos.", vim.log.levels.INFO)
        return
    end

    local names = {}
    for _, p in ipairs(orphans) do
        table.insert(names, p.spec.name or p.spec.src)
    end

    local msg = "PackClean: se van a borrar estos plugins (no declarados en tu config):\n  - "
        .. table.concat(names, "\n  - ")
        .. "\n\n¿Confirmar? (y/n) "

    vim.ui.input({ prompt = msg }, function(input)
        if input and input:lower() == "y" then
            vim.pack.del(names)
            vim.notify("PackClean: borrados " .. #names .. " plugin(s).", vim.log.levels.INFO)
        else
            vim.notify("PackClean: cancelado.", vim.log.levels.INFO)
        end
    end)
end, { desc = "Borrar plugins de vim.pack que ya no están declarados en la config" })

vim.api.nvim_create_user_command("PackUpdate", function()
    vim.pack.update()
end, { desc = "Chequear y actualizar todos los plugins de vim.pack" })

vim.api.nvim_create_user_command("PackList", function()
    local plugins = vim.pack.get()

    if #plugins == 0 then
        vim.notify("PackList: no hay plugins instalados.", vim.log.levels.INFO)
        return
    end

    -- Ordenar alfabéticamente para que sea fácil de leer.
    table.sort(plugins, function(a, b)
        local name_a = a.spec.name or a.spec.src
        local name_b = b.spec.name or b.spec.src
        return name_a < name_b
    end)

    local lines = {}
    for _, p in ipairs(plugins) do
        local name = p.spec.name or p.spec.src
        local status = p.active and "activo" or "HUÉRFANO"
        local version = p.spec.version and (" @ " .. p.spec.version) or ""
        table.insert(lines, string.format("%-35s %s%s", name, status, version))
    end

    -- Buffer flotante de solo lectura -- más cómodo para leer una lista
    -- larga que amontonar todo en :messages.
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    vim.bo[buf].modifiable = false
    vim.bo[buf].filetype = "packlist"

    local width = 60
    local height = math.min(#lines + 2, 30)
    vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = height,
        row = math.floor((vim.o.lines - height) / 2),
        col = math.floor((vim.o.columns - width) / 2),
        style = "minimal",
        border = "rounded",
        title = " Plugins (vim.pack) ",
        title_pos = "center",
    })

    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = buf, silent = true })
    vim.keymap.set("n", "<Esc>", "<cmd>close<cr>", { buffer = buf, silent = true })
end, { desc = "Listar todos los plugins instalados con vim.pack y su estado" })

vim.api.nvim_create_user_command("PackUpdateLatest", function()
    local plugins = vim.tbl_filter(function(p)
        return p.active
    end, vim.pack.get())

    if #plugins == 0 then
        vim.notify("PackUpdateLatest: no hay plugins activos.", vim.log.levels.INFO)
        return
    end

    local results = {}
    local pending = #plugins
    local TIMEOUT_MS = 8000

    local function show_results()
        table.sort(results, function(a, b)
            return a.name < b.name
        end)

        local lines = {}
        for _, r in ipairs(results) do
            table.insert(lines, string.format("%-30s %s", r.name, r.text))
        end

        local buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
        vim.bo[buf].modifiable = false
        vim.bo[buf].filetype = "packlist"

        local width = 80
        local height = math.min(#lines + 2, 30)
        vim.api.nvim_open_win(buf, true, {
            relative = "editor",
            width = width,
            height = height,
            row = math.floor((vim.o.lines - height) / 2),
            col = math.floor((vim.o.columns - width) / 2),
            style = "minimal",
            border = "rounded",
            title = " Último commit disponible por plugin ",
            title_pos = "center",
        })

        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = buf, silent = true })
        vim.keymap.set("n", "<Esc>", "<cmd>close<cr>", { buffer = buf, silent = true })
        vim.notify("Vista previa nomás -- corré :PackUpdate para aplicar de verdad.", vim.log.levels.INFO)
    end

    vim.notify(string.format("PackUpdateLatest: consultando %d plugin(s)...", #plugins), vim.log.levels.INFO)

    for _, p in ipairs(plugins) do
        local name = p.spec.name or p.spec.src
        local done = false

        local proc = vim.system({ "git", "-C", p.path, "fetch", "--quiet", "origin" }, {}, function(fetch_res)
            if done then
                return
            end
            done = true

            vim.schedule(function()
                if fetch_res.code ~= 0 then
                    table.insert(results, { name = name, text = "(no se pudo hacer fetch)" })
                else
                    local latest = vim.fn
                        .system({ "git", "-C", p.path, "log", "-1", "--oneline", "FETCH_HEAD" })
                        :gsub("\n$", "")
                    local current = vim.fn
                        .system({ "git", "-C", p.path, "rev-parse", "--short", "HEAD" })
                        :gsub("\n$", "")
                    if latest:match("^" .. current) then
                        table.insert(results, { name = name, text = "ya está al día" })
                    else
                        table.insert(results, { name = name, text = latest })
                    end
                end

                pending = pending - 1
                if pending == 0 then
                    show_results()
                end
            end)
        end)

        -- Timeout: si un plugin puntual (dominio inválido, red caída, etc.)
        -- no responde en TIMEOUT_MS, lo marcamos como tal y seguimos con
        -- los demás en vez de esperar indefinidamente.
        vim.defer_fn(function()
            if not done then
                done = true
                pcall(function()
                    proc:kill(9)
                end)
                vim.schedule(function()
                    table.insert(results, { name = name, text = "(timeout -- revisar remote/red)" })
                    pending = pending - 1
                    if pending == 0 then
                        show_results()
                    end
                end)
            end
        end, TIMEOUT_MS)
    end
end, { desc = "Mostrar solo el último commit pendiente de cada plugin, sin aplicar nada (async, con timeout)" })
