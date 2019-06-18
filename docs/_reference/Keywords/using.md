---
layout: page
title: using
category: keyword
description: imports namespaces

footnotes:
 -
    label: using-definition
    video: demo_20150121
    time:  1296
    text:  |-
      `using` is a keyword that lets you import other namespaces into your namespace.

---

# `{{ page.title }}`

A keyword that lets you import other namespaces into your namespace [^using-definition]

```cpp
things :: enum {
  FIRST,
  SECOND
}

enum_test :: () {
  printf("things.FIRST is: %d\n", things.FIRST);
  printf("things.SECOND is: %d\n", things.SECOND);

  using things.members;

  printf("FIRST is: %d\n", FIRST);
  printf("SECOND is: %d\n", SECOND);
}
```

Function parameters and nested namespaces can be declared with `using`:

{% include collapsible_example.liquid file='code/print_position_test.jai' syntax='cpp' %}

`using` can import a namespace into a struct, and that namespace is addressable:

{% include collapsible_example.liquid file='code/door_test.jai' syntax='cpp' %}

`using` can import a _pointer_ to a namespace into a struct:

{% include collapsible_example.liquid file='code/door_test_pointer.jai' syntax='cpp' %}

By `using` pointers to structs, you can control the memory packing of the referenced structs:

{% include collapsible_example.liquid file='code/door_test_packed.jai' syntax='cpp' %}

Composition via `using` allows fine-grained control over data packing and visitation:

```cpp
Entity_Hot :: Struct {
  position : Vector3;
  orientation : Quaternion;
  scale : float = 1;
  flags : u32;
}

Entity_Cold :: Struct {
  label : ^ u8;
  group : ^ Group;
  // ...more
}

Entity :: struct {
  using hot : ^ Entity_Hot;
  using cold : ^ Entity_Cold;
}

Door :: struct {
  using entity : Entity;
  openness_current : float = 0;
}
```

{% include footnotes.liquid references=page.footnotes %}
