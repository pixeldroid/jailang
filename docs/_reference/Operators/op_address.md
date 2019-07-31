---
layout: page
title: '*'
category: operator
description: get a value by dereferencing a memory address
search_tags: dereference pointer memory star asterisk

footnotes:
 -
    label: no-references
    video: demo_20150121_qa
    time:  840
    text:  references in C++ are just pointers with a different syntax and different defaults, so I would rather have a way to have one thing.
 -
    label: pointer-declaration
    video: demo_20141210
    time:  769
    text:  for pointers, use Pascal-style pointy hat (`^`) instead of ampersand (`&`). still use star (`*`) to dereference a pointer.
 -
    label: toward-away
    video: demo_20141210
    time:  821
    text:  star (`*`) brings us toward the value, and hat (`^`) brings us away from the value.
---

# `{{ page.title }}`

> Use `*` for value, `^` for address[^pointer-declaration] [^toward-away], `!` for ownership <br>
> Jai does not use `&` for references; `using` can provide that functionality [^no-references]

```cpp
{% include code/pointers.jai %}
```


{% include footnotes.liquid references=page.footnotes %}
