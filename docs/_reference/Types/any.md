---
layout: page
title: Any
category: type
description: |-
  a more informative and type-safe version of `void` pointer.
  Includes a type pointer for the type and a void pointer for the value.

footnotes:
 -
    label: any-demo
    video: demo_20150211
    time:  754
    text:  |-
      `Any` is a more informative and type-safe version of `void` pointer.
 -
    label: any-declaration
    video: demo_20150211
    time:  895
    text:  |-
      `Any` is a type pointer for any type and a void pointer to the value.
---

# `{{ page.title }}`

`Any` is a more informative and type-safe version of `void` pointer. [^any-demo]


## declaration

All value types can be implicitly cast to type `Any`.

```cpp
x : Any = 3.0;
printf("x contains this float: %f\n", *cast(x.value_pointer, ^float));
x = "foo";
printf("now x contains this string: %s\n", *cast(x.value_pointer, ^string));
```


## properties

`Any` is a type pointer for any type and a void pointer to the value. [^any-declaration]

- `type` - pointer to a `Type_Info` struct with specific details about the assigned value type
- `value_pointer` - void pointer to the value


{% include footnotes.liquid references=page.footnotes %}
