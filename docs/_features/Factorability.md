---
layout: page
title: Factorability

footnotes:
 -
    label: capture-for-any-block
    video: ideas_20140926
    time:  3344
    text:  i can just apply a capture to any block.
 -
    label: code-maturation
    video: ideas_20140926
    time:  2171
    text:  your programming language should be designed to support the transition from humble beginnings to final product.
 -
    label: factorability-drudge
    video: ideas_20140926
    time:  1837
    text:  we want to avoid meaningless syntactic changes that create drudge work as I gradually factor my program from its beginning state into its final state.
 -
    label: factorability-lift
    video: ideas_20140926
    time:  3549
    text:  we have this whole sequence of stages we can lift a block of code on.

---


# {{ page.title }}

Code has a maturation cycle; you don't just write the final thing initially, because you don't know what it should be. You work your way there. [^code-maturation]
{:.larger.text}

Scalars and functions do not require meaningless syntax changes when changing scope, capturing scope [^capture-for-any-block], or switching between being named or unnamed.[^factorability-drudge]&nbsp;[^factorability-lift]

```cpp
                                 { ... } // Anonymous code block
                       [capture] { ... } // Captured code block
     (i: int) -> float [capture] { ... } // Anonymous function
f :: (i: int) -> float [capture] { ... } // Named function (local or global)
```


{% include footnotes.liquid references=page.footnotes %}
