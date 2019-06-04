---
layout: page
title: Notes

footnotes:
 -
    label: notes-description
    video: demo_20150211
    time:  3384
    text:  |-
      Notes are purely for you as the user. The compiler has no idea what they mean. It's just an opaque string that you make for your own code to interpret.
 -
    label: notes-useful
    video: demo_20150211
    time:  3503
    text:  |-
      Notes are a completely user-defined thing that you can use to interface your program with other stuff.
 -
    label: note-declaration
    video: demo_20150211
    time:  3538
    text:  |-
      Notes aren't just for struct members. They can go on any declarations.

---

# {{ page.title }}

Jai supports declaration notes that the compiler retains and makes available at compile-time and run-time. [^notes-description] [^notes-useful] [^note-declaration]

```cpp
my_const :: 3; @note
my_procedure :: () @note {}
my_struct :: struct @note {}
```

See the [note operator reference page][op-note] for more details.

{% include collapsible_example.liquid file='code/has_note.jai' syntax='cpp' %}

{% include footnotes.liquid references=page.footnotes %}


[op-note]: {{site.baseurl}}/reference/Operators/op_note/#/reference/ "details for the note operator"
