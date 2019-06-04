---
layout: page
title: Varargs

footnotes:
 -
    label: argument-collecting
    video: demo_20150211
    time:  1083
    text:  |-
      Variable argument functions are denoted with two dots: `..`. The vararg collects the last zero or more arguments to the function into an array of type `Any`.
 -
    label: argument-spreading
    video: demo_20150211
    time:  1615
    text:  |-
      Variable argument functions can accept an array as the varargs value, and spread the array elements out as individual arguments.

---

# {{ page.title }} (Variable Arguments)

Varargs in Jai are denoted with two periods (`..`).

When used to declare a function parameter (`foo :: (args : ..) {}`), they collect zero or more arguments into an array of type `Any`. [^argument-collecting]

```cpp
varargs :: (args : ..) {
  // compiler declares args as: [] Any;
  printf("%d arguments.\n", args.count);
}
```

When used to send an array parameter to a function (`foo(..args);`), they spread the array elements out as individual arguments. [^argument-spreading]

```cpp
letters : [] string = ["a", "b", "c"];
varargs(..letters); // prints: "3 arguments"
}
```


{% include footnotes.liquid references=page.footnotes %}
