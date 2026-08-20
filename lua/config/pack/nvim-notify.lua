---@diagnostic disable-next-line: missing-fields
require("notify").setup {
    background_colour = "Normal",
    icons = {
        ERROR = " ",
        WARN = " ",
        HINT = "󰠠 ",
        INFO = " ",
        TRACE = "✎",
        DEBUG = "🐛",
    },
    level = "INFO",
    stages = "fade_in_slide_out",
    timeout = 3000,
    top_down = true,
    max_width = 60,
    max_height = 10,
    render = "compact",
}
