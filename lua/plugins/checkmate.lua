return {
    "bngarren/checkmate.nvim",
    ft = "markdown",
    opts = {
        files = {
            "*.todo.md",
        },
        todo_states = {
            -- Built-in states (cannot change markdown or type)
            unchecked = { marker = "□" },
            checked = { marker = "✔" },

            -- Custom states
            in_progress = {
                marker = "◐",
                markdown = ".", -- Saved as `- [.]`
                type = "incomplete", -- Counts as "not done"
                order = 50,
            },
            cancelled = {
                marker = "✗",
                markdown = "c", -- Saved as `- [c]`
                type = "complete", -- Counts as "done"
                order = 2,
            },
            on_hold = {
                marker = "⏸",
                markdown = "/", -- Saved as `- [/]`
                type = "inactive", -- Ignored in counts
                order = 100,
            },
        },
    },
}
