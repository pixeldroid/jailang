---
layout: page
title: '@'
category: operator

footnotes:
 -
    label: note-declaration
    video: demo_20150211
    time:  3538
    text:  |-
      Notes aren't just for struct members. They can go on any declarations.
tags:
- { name: see, value: "Basic#Type_Info_Struct_Member" }

---


# `{{ page.title }}`

Notes are declared with an at-sign (`@`) after a declaration. [^note-declaration] Notes can be declared before or after a procedure or struct block.

```cpp
my_const :: 3; @note

my_procedure :: () @note {}
my_procedure :: () {} @note // trailing declaration supported too

my_struct :: struct @note {}
my_struct :: struct {} @note // trailing declaration supported too
```

The note operator signals the compiler to add a string to the notes array of the declared type.


{% include see_also.liquid module_root='/modules' tags=page.tags %}

{% include footnotes.liquid references=page.footnotes %}
