---
layout: page
title: '^'
category: operator

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
---

# `{{ page.title }}`

> Use `^` for pointer, `*` for address[^pointer-declaration], `!` for ownership <br>
> Jai does not use `&` for references; `using` can provide that functionality [^no-references]

```cpp
e : Entity;

pointer : ^Entity;
pointer = *e;

owned : node *! = null;
other : node *  = *graph.node;
```


{% include footnotes.liquid references=page.footnotes %}
