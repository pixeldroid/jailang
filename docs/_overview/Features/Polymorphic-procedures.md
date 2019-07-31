---
layout: page
title: Polymorphic procedures

footnotes:
 -
    label: type-variable
    video: demo_20150401
    time:  228
    text:  what the dollar sign indicates is that this is a type variable which means we don't know what type it is at declaration time. the type of this variable will be determined when the function is called.
 -
    label: one-dollar
    video: demo_20150401
    time:  360
    text:  the reason that we only use the dollar sign once is that the dollar sign tells us which argument is authoritative over what the type should be..
 -
    label: using-variable-types
    video: demo_20150401
    time:  1624
    text:  here we've got a function called `using_test`, and we're `using` the first parameter. Remember that using let's us refer to these components; it's like a `this` pointer.
 -
    label: modify
    video: demo_20150401
    time:  2593
    text:  |-
      [..] this thing called a modify directive [..] you can attach it onto a polymorphic procedure, and it supplies code that runs at compile time that maps the types given by the user onto the types of the generated function.
 -
    label: map-function
    mla: Wikipedia contributors. "Map (higher-order function)." Wikipedia, The Free Encyclopedia, 11 Mar. 2019. Web. 31 Jul. 2019.
    url:  https://en.wikipedia.org/w/index.php?title=Map_(higher-order_function)&oldid=887181717
    text:  |-
      In many programming languages, **map** is the name of a higher-order function that applies a given function to each element of a functor, e.g. a list, returning a list of results in the same order.

---


# {{ page.title }}

- TOC
{::options toc_levels="2,3" /}
{:toc}


## Type variables

The dollar sign (`$`) in Jai indicates a type variable. [^type-variable]

Type variables allow for defining a generic form of source code that can work for multiple types. Similar to template metaprogramming in C++, but simpler and cleaner and without any header files.

```cpp
// from https://youtu.be/BwqeFrlSpuI?t=218
print_number :: (number: $T) {
  // pass number as both int and float,
  // one of them will work out..
  printf("print_number: %d %f\n", number, number);
}

n1: int     = 1;
n2: u8      = 2;
n3: s64     = 3;
n4: float32 = 4;
n5: float64 = 5;

print_number(n1); // 1 0.000000
print_number(n2); // 2 0.000000
print_number(n3); // 3 0.000000
print_number(n4); // 0 4.000000
print_number(n5); // 0 5.000000
```


## Authoritative parameters

For procedures with multiple parameters of the same type variable, use only one dollar sign to identify which parameter is authoritative over the error message. [^one-dollar]

```cpp
add :: (p: $T, q: T) -> T {
  x := p + q; // does not handle overflow
  return x;
}

n1: u8      = 254;
n2: float32 = 7.63;
n3: u8      = 1;

add(n1, n2); // type mismatch error will state second parameter must match first
add(n1, n3); // ok, types match
```

{% include collapsible_example.liquid file='code/swap.jai' syntax='cpp' %}

{% include collapsible_example.liquid file='code/find.jai' syntax='cpp' %}

{% include collapsible_example.liquid file='code/do_three_times.jai' syntax='cpp' %}


## `using` with type variables

Variable types will work with `using`: [^using-variable-types]

```cpp
Vector2 :: struct {
  x: float = 2.0;
  y: float = 2.1;
}
Vector3 :: struct {
  z: float = 3.2;
  y: float = 3.1;
  x: float = 3.0;
}

using_test :: (using a: $T) {
  printf("a.x is %f\n", x);
  printf("a.y is %f\n", y);
}

v2: Vector2;
v3: Vector3;

// works with values or pointers
using_test(v2);  // a.x is 2.0; a.y is 2.1
using_test(^v2);

using_test(v3);  // a.x is 3.0; a.y is 3.1
using_test(^v3);
```


## Baking polymorphs

See [#bake] to precompile a polymorphic procedure for a specific type.

```cpp
baked3 := #bake using_test(T = Vector3);
```


## Modifying polymorph types

See [#modify] to inject one or more procedures for inspecting and reacting to type variables being passed to a polymorphic procedure.

{% include collapsible_example.liquid file='code/satisfies_interface.jai' syntax='cpp' %}


## Modifying polymorphic functions

See [#body_text] to generate a string for use as source code of the polymorphic procedure.

{% include collapsible_example.liquid file='code/length_body_text.jai' syntax='cpp' %}


## Baking values

Use [#bake_values] to precompile a regular procedure with specific parameter values:

```cpp
multiplier :: (a: float, b: float) -> float {
  return a * b;
}

printf("multiplier(%f, %f) = %f\n", 3, 5, multiplier(3, 5));
// multiplier(3, 5) = 15

uniplier :: #bake_values multiplier(b = -9);

printf("uniplier(%f) = %f\n", 3, uniplier(3));
printf("uniplier(%f) = %f\n", 5, uniplier(5));
// uniplier(3) = -27
// uniplier(5) = -45
```


## Auto-baking

Use the [auto-baking] operator (`$$`) to ask the compiler to bake functions when specific parameters have values known at compile-time.

{% include collapsible_example.liquid file='code/print_names_and_values_autobake.jai' syntax='cpp' %}


## Implementing map

With polymorphic procedures, higher-order functions like `map` [^map-function] can be implemented, while retaining the speed and type safety of a compiled language.

{% include collapsible_example.liquid file='code/map_test.jai' syntax='cpp' %}


{% include footnotes.liquid references=page.footnotes %}


[auto-baking]: {{site.baseurl}}/reference/Operators/op_autobake/#/reference/ "instruct the compile to bake function when parameter value is known at compile time"
[#bake]: {{site.baseurl}}/reference/Directives/%23bake/#/reference/ "generate a compiled function with predefined values for type variables"
[#bake_values]: {{site.baseurl}}/reference/Directives/%23bake_values/#/reference/ "generate a compiled function with predefined parameter values"
[#body_text]: {{site.baseurl}}/reference/Directives/%23body_text/#/reference/ "generate a string to be used as source code of the polymorphic procedure"
[#modify]: {{site.baseurl}}/reference/Directives/%23modify/#/reference/ "inject a procedure for inspecting and manipulating type variables"
