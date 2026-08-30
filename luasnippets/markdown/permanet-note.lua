local ls = require "luasnip"
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

local function today()
    return os.date "%Y-%m-%d"
end

return {
    s(
        {
            trig = "permnote",
            name = "Permanent note",
            dscr = "Atomic permanent note: one idea, linked to its source and to other notes",
        },
        fmt(
            [=[
---
type: permanent
tags: [permanent-note]
source: "[[{}]]"
related:
  - "[[{}]]"
created: {}
---

{}

This relates to [[{}]] because {}
]=],
            {
                i(1, "Lastname (Year)"),
                i(2, "Another permanent note"),
                f(today, {}),
                i(3, "Idea developed in your own words, independent of the paper."),
                i(4, "Another permanent note"),
                i(5, "..."),
            }
        )
    ),
}
