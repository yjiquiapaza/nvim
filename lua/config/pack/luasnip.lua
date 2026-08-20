local ls = require "luasnip"
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("markdown", {
    s(
        {
            trig = "paper note template",
            name = "Research paper's metadata",
            dscr = "Template of header paper, We use it to get all metadata for research paper.",
        },
        fmt(
            [[
            ---
            Title: {}
            Source (URL or DOI): {}
            Tags: {}
            Event: {}
            Target: {}
            Read: {}
            ---

            # Main Idea


            ## Experiment or Use Cases


            ## Quotes

        ]],
            {
                i(1, "Research paper title"),
                i(2, "URL or DOI"),
                i(3, "Tags, for example Visualization, Data Analysis, AR, VR, Interaction, etc."),
                i(4, "Event, is where the research paper was published"),
                i(5, "Target, is where we want to publish our research paper"),
                i(6, "Read, is the number of times the paper has been read"),
            }
        )
    ),
})

ls.add_snippets("markdown", {
    s(
        {
            trig = "review",
            name = "Peer-review",
            dscr = "Peer-review Template: metadata, criteria-based evaluation, strenghs/weeknesses, and recomendations",
        },
        fmt(
            [[
# Peer-review Template
        ]],
            {}
        )
    ),
})
