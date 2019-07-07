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
 -
    label: using-namespace
    video: demo_20150121
    time:  1392
    text:  |-
      Now that I'm using that, now I can just say `FIRST`, `SECOND`, and `THIRD` down here, without saying `things.whatever`. I'm just importing those into my namespace directly, into this function.
 -
    label: using-namespace-pointer
    video: demo_20150121
    time:  1522
    text:  |-
      Now the difference is, in the previous function, the thing that we were using was all constants. They didn't involve storage or anything, it was just a bunch of enums that expand to constants. But now we're importing a live pointer. [..] We're `using entity`, we don't have to say `entity.position.whatever`, we're just saying `position.x`, `position.y`, `position.z`. But what those mean is dereferencing this live pointer that we're using, rather than constants in some constant namespace.
 -
    label: using-efficient-packing
    video: demo_20150121
    time:  2330
    text:  |-
      Now that we've got our entity in a different place in memory, instead of just new-ing on the heap, which is kind of dumb and doesn't really help you, we're going to store them in a more efficient way.
 -
    label: using-composition
    video: demo_20150121
    time:  2605
    text:  |-
      What I would like to do, is break an entity into a couple of parts. I want to break in into the part that I want to visit really a lot from tight loops all of the time and that needs to be just cranked through as fast as the cpu can. And then I want to split it into the other part [..] that doesn't get used as often, they don't really get used in tight loops, and they're not as performance critical.
 -
    label: using-function
    video: demo_20150121
    time:  4177
    text:  |-
      I'm using a function that unpacks this pointer from this unsigned sixteen bit number.
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

`using` can import a namespace into a struct, and that namespace is addressable: [^using-namespace]

{% include collapsible_example.liquid file='code/door_test.jai' syntax='cpp' %}

`using` can import a _pointer_ to a namespace into a struct: [^using-namespace-pointer]

{% include collapsible_example.liquid file='code/door_test_pointer.jai' syntax='cpp' %}

By `using` pointers to structs, you can control the memory packing of the referenced structs: [^using-efficient-packing]

{% include collapsible_example.liquid file='code/door_test_packed.jai' syntax='cpp' %}

Composition via `using` allows fine-grained control over data packing and visitation: [^using-composition]

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

`using` can import a _function_ to be implicitly invoked when accessing members of a struct:

{% include collapsible_example.liquid file='code/door_test_function.jai' syntax='cpp' %}


{% include footnotes.liquid references=page.footnotes %}
