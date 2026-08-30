-- LuaSnip snippet for the peer review template.
-- Style: s() + fmt() + insert_node, same as the rest of your snippets.
--
-- Location: ~/.config/nvim/luasnippets/markdown/review.lua

local ls = require "luasnip"
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
    s(
        {
            trig = "review",
            name = "Peer review",
            dscr = "Peer review template: metadata, per-criterion evaluation, strengths/weaknesses, recommendation",
        },
        fmt(
            [[
# Peer review template

> Different goal from the Zettelkasten template: here you evaluate the paper
> on its own terms, not connect it to your own thinking. Every objection
> should be anchored in something concrete in the text (section, figure,
> table, line of code).

---

## 0. Metadata

```yaml
---
type: review
title: "{}"
paper-id: "{}"
authors: "blind"
year: {}
venue: "{}"
tags: [review]
recommendation: ""
confidence: ""
reviewer-expertise: ""
deadline: "{}"
status: in-progress
---
```

---

## 1. Summary of the paper (in your own words)

This serves two purposes: confirms you understood the paper before
criticizing it, and is usually required in the review form.

- **Problem addressed:** {}
- **Proposed approach / method:** {}
- **Main results:** {}
- **Contribution the authors claim:** {}

---

## 2. Evaluation by criterion

Note concrete evidence (section/figure/table), not loose impressions.

| Criterion | Score (1-5) | Justification anchored in the text |
|---|---|---|
| Originality / novelty | | |
| Technical soundness / validity of experiments | | |
| Clarity of writing | | |
| Relevance to the venue | | |
| Reproducibility (code, data, hyperparameters) | | |
| Related work coverage | | |

---

## 3. Strengths

Concrete list, each point anchored in something specific in the paper.

1. {}
2.
3.

---

## 4. Weaknesses

Split by type -- helps the authors prioritize what to respond to first.

### Technical (affect the validity of the conclusions)
- {}

### Methodological (experimental design, missing baselines, ablations)
-

### Clarity / presentation
-

### Related work (missing comparisons or citations)
-

---

## 5. Questions for the authors

Phrase as actionable questions, not veiled statements. Authors should be
able to answer each one in the rebuttal.

1. {}
2.
3.

---

## 6. Minor comments

Typos, inconsistent notation, hard-to-read figures, etc. Don't affect the
recommendation but help the authors.

-

---

## 7. Recommendation

- **Decision:** {}
- **Confidence level (1-5):** {}
- **Summary justification** (2-3 sentences connecting the decision to the
  weaknesses in section 4 -- if a weakness is severe enough to justify
  rejection, say so explicitly): {}

---

## 8. What would change my recommendation

Useful for yourself and sometimes explicitly requested: what would the
authors need to do in the rebuttal or revision for you to raise the score?

-

---

*Final check before submitting: does every weakness I listed in section 4
have a concrete counterpart (section/figure/experiment) an author could
locate without having to guess what I mean? If not, it's a vague
criticism -- worth sharpening it or dropping it.*
]],
            {
                i(1, "Paper title"),
                i(2, "1847"),
                i(3, "2024"),
                i(4, "Conference or journal name"),
                i(5, "Deadline"),
                i(6, "problem addressed"),
                i(7, "proposed approach or method"),
                i(8, "main results"),
                i(9, "claimed contribution"),
                i(10, "first strength"),
                i(11, "first technical weakness"),
                i(12, "first question"),
                i(13, "accept / weak accept / weak reject / reject"),
                i(14, "1-5"),
                i(15, "justification"),
            }
        )
    ),
}
