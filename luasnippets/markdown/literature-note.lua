local ls = require "luasnip"
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
    s(
        {
            trig = "litnote",
            name = "Literature note",
            dscr = "Reference note for a paper: metadata + paraphrased notes",
        },
        fmt(
            [=[
---
type: literature
title: "{}"
aliases: ["{}"]
authors: [{}]
year: {}
tags: [literature-note, paper]
status: unprocessed
project: "[[{}]]"
source: "{}"
publication-type: {}
venue: "{}"
peer-reviewed: true
---

## Margin notes

- {}

## Reference notes

| # | Idea (paraphrased, in your own words) | Location (page/section) |
|---|------------------------------------------|---------------------------|
| 1 | {} | {} |

## Synthesis (optional)

- **Research question:**
- **Method:**
- **Main finding:**
- **Limitations:**
]=],
            {
                i(1, "Paper title"),
                i(2, "Lastname (Year)"),
                i(3, "Lastname, Firstname"),
                i(4, "2024"),
                i(5, "Project or research question"),
                i(6, "Full citation or DOI"),
                i(7, "journal | conference | preprint | workshop | thesis"),
                i(8, "Journal or conference name"),
                i(9, "immediate reaction to something in the text"),
                i(10, "paraphrased idea"),
                i(11, "p. 0"),
            }
        )
    ),
}