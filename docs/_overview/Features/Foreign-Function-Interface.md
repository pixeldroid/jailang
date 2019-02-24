---
layout: page
title: Foreign Function Interface

footnotes:
 -
    label: ffi-printf
    video: demo_20141031
    time:  1599
    text:  a straight-forward foreign function interface allows things like calling out to C for `printf`.

---


# {{ page.title }}

Jai provides a straight-forward foreign function interface.
{:.larger.text}

For example, `printf()` calls out to C's printf implementation: [^ffi-printf]

```c
printf := (s: string, args: ...) -> int #foreign;
```

See the [#foreign] directive for more details.


{% include footnotes.liquid references=page.footnotes %}


[#foreign]: {{site.baseurl}}/reference/Directives/%23foreign/#/reference/ "the #foreign directive"