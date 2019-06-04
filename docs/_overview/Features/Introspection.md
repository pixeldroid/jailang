---
layout: page
title: Introspection

footnotes:
 -
    label: ast-access
    video: reboot_2017
    time:  2551
    text:  data structures for all the code in the program.
 -
    label: introspection
    video: reboot_2017
    time:  1945
    text:  introspection / reflection.

---


# {{ page.title }}

Jai provides full access to type info (in a compiled language) available at compile time and run time.[^introspection]
{:.larger.text}

Requesting type info returns a pointer to an entry in the type table that is a `TypeInfo` struct. These structs can be printed directly for quick and cheap debugging.

```cpp
for _type_table { // iteration in Jai includes access to two local variables: it, it_index
    // it       - iterator, the current TypeInfo struct
    // it_index - zero-based iteration index, an integer

    print(it);
    // or..
    print("%:\n", it_index);
    print("  name: %\n", it.name);
    print("  type: %\n", it.type);
}
```

Equivalent data structures are provided for the entire text of the program (at compile time only). [^ast-access]


{% include footnotes.liquid references=page.footnotes %}
