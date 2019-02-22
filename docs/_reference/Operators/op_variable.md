---
layout: page
title: ':'
category: operator

footnotes:
 -
    label: default-values
    video: demo_20141211_qa
    time:  232
    text:  default values are always zero. the default value...is the zero value for your type.
 -
    label: scalar-declaration
    video: ideas_20140926
    time:  1666
    text:  declarations and assignment.
---

# `{{ page.title }}`

> `name : type = value` [^scalar-declaration]

- `f : float;` Declares `f`, explicitly typed to `float` (default value is `0`)[^default-values]
- `f : float = 1;` Declares and initializes `f`
- `f := 1;` Declares and initializes `f`, implicitly typed
- `f = 1;` Assigns `f`, must already be declared
- `c := 'c` - single quote for characters (`u8` literals)  {% comment %} # FIXME: is this still in? see: https://youtu.be/UTqZNujQOlA?t=1936 {% endcomment %}


{% include footnotes.liquid references=page.footnotes %}
