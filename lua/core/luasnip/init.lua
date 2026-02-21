local ls = require "luasnip"
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require "luasnip.util.types"
local conds = require "luasnip.extras.conditions"
local conds_expand = require "luasnip.extras.conditions.expand"

-- If you're reading this file for the first time, best skip to around line 190
-- where the actual snippet-definitions start.

-- Every unspecified option will be set to the default.
ls.setup {
    history = true,
    -- Update more often, :h events for more info.
    update_events = "TextChanged,TextChangedI",
    -- Snippets aren't automatically removed if their text is deleted.
    -- `delete_check_events` determines on which events (:h events) a check for
    -- deleted snippets is performed.
    -- This can be especially useful when `history` is enabled.
    delete_check_events = "TextChanged",
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { "choiceNode", "Comment" } },
            },
        },
    },
    -- treesitter-hl has 100, use something higher (default is 200).
    ext_base_prio = 300,
    -- minimal increase in priority.
    ext_prio_increase = 1,
    enable_autosnippets = true,
    -- mapping for cutting selected text so it's usable as SELECT_DEDENT,
    -- SELECT_RAW or TM_SELECTED_TEXT (mapped via xmap).
    store_selection_keys = "<Tab>",
    -- luasnip uses this function to get the currently active filetype. This
    -- is the (rather uninteresting) default, but it's possible to use
    -- eg. treesitter for getting the current filetype by setting ft_func to
    -- require("luasnip.extras.filetype_functions").from_cursor (requires
    -- `nvim-treesitter/nvim-treesitter`). This allows correctly resolving
    -- the current filetype in eg. a markdown-code block or `vim.cmd()`.
    ft_func = function()
        return vim.split(vim.bo.filetype, ".", true)
    end,
}

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
            trig = "paper draft notes",
            name = "Draft Note",
            dscr = "Template draft notes for a research paper",
        },
        fmt(
            [[
            # The proposal

            {}

            ## Use cases or experiment

            {}

            ### Tasks

            {}

            ### Interaction

            {}

            ## References

            {}

            ## Draft Structure

            {}
        ]],
            {
                i(1, "Write a draft with our proposal, try to be short and clear"),
                i(2, "Describe our experiment or use cases and write about that"),
                i(3, "Describe the future tasks that we should implement in the future"),
                i(4, "Describe the interaction that we are going to do"),
                i(5, "Link the references and write about that"),
                i(6, "Describe our paper structure"),
            }
        )
    ),
})

ls.add_snippets("markdown", {
    s(
        {
            trig = "date",
            name = "Date",
            dscr = "Get date",
        },
        fmt(
            [[
            {}
        ]],
            {
                i(1, "Date: " .. os.date "%n"),
            }
        )
    ),
})

ls.add_snippets("markdown", {
    s(
        {
            trig = "book simple metadata",
            name = "Simple Metadata",
            dscr = "get simple metadata",
        },
        fmt(
            [[
            ---
            book title: {}
            language: {}
            author: {}
            ---
            ]],
            {
                i(1, "Book Title"),
                i(2, "Book Language"),
                i(3, "Book Author"),
            }
        )
    ),
})

ls.add_snippets("markdown", {
    s(
        {
            trig = "Zettelkasten",
            name = "Zettelkasten Notes",
            dscr = "Simple note to use get ideas or get information about a specific field. Use it for paper, book, and other source of information",
        },
        fmt(
            [[
            ---
            Title: {}
            Target: {}
            Source: {}
            Tags: {}
            ---

            # The First Pass

            The first pass is adequate for papers that are not in your research area, but may someday prove relevant.

            - [] Read the title, abstract, the introduction, and conclusions.
            - [] Spend at least five minutes reviewing the above sections.
            - [] Read the section and subsection headings, but ignore everything else.

            ## Answers the Following Questions

            ### Category

            - [] What type of paper is this?

            - [] A measurement in the paper?

            - [] An analysis of an existing system?

            - [] A description of research prototype?

            ### Context

            - [] Which other paper is it related to?

            - [] Which theoretical bases were used to analyse the problem?

            ### Correctness

            - [] Do the assumptions appear to be valid?

            ### Contributions

            - [] What are the paper's main contributions?

            # The Second Pass

            This level of detail is appropriate for a paper in which you are interested, but does not lie in
            **your research speciality**

            - [] Mark relevant unread references for further reading.
            - [] Look up the results, understand it, and write the most important parts.
            - [] Summarize the main thrust of the paper.
            - [] Read about an hour.

            ## Summary

            # The Third Pass

            To fully understand a paper

            - [] Read about five hours for beginners, and about an hour for an experienced reader.
            - [] Identify the strengths and weaknesses of the paper.
            - [] Pinpoint implicit assumptions, missing citations to relevant work, and potential issues with
            experimental or analytical techniques.

            ]],
            {
                i(1, "Title of paper, book, or other source of information."),
                i(2, "Where are we use this information?. Example conference, or journal."),
                i(3, "What is the source?. Example ieee, acm, etc."),
                i(4, "What is the fields of research."),
            }
        )
    ),
})
