---
layout: page
title: General Syntax
---

# {{ page.title }}

- TOC
{::options toc_levels="2,3" /}
{:toc}


## Comments [^syntax-comments]

```
// Comment
/* Block comment */
/* Nested /* block /* comment */ */ */
```


## Atomic Types [^basic-types]


- `---` - uninitialized
- `null` - null pointer, unequal to any pointer to any object or function
- `void` - void pointer, maybe a temporary idea {% comment %} # FIXME: is this still in? see: https://youtu.be/UTqZNujQOlA?t=1780 {% endcomment %}
- `bool` - [`true`, `false`]
- `int` - integer number (thirty-two bit)
- `float` - floating point number
- `string` - string of characters enclosed in double quotes
- `Any` - a type that all others types can be cast to
- `u64` - unsigned sixty-four bit integer number
- `u32` - unsigned thirty-two bit integer number
- `u16` - unsigned sixteen bit integer number
- `u8` - unsigned eight bit integer number
- `s64` - signed sixty-four bit integer number
- `s32` - signed thirty-two bit integer number
- `s16` - signed sixteen bit integer number
- `s8` - signed eight bit integer number
- `float64` - sixty-four bit floating point number
- `float32` - thirty-two bit floating point number


## Declarations

### Scalars [^scalar-declaration]

> Use `:` to declare, `=` to assign <br>
> `name : type = value`

- `f : float;` Declares `f`, explicitly typed to `float`
- `f : float = 1;` Declares and initializes `f`
- `f := 1;` Declares and initializes `f`, implicitly typed
- `f = 1;` Assigns `f`, must already be declared
- `c := 'c` - single quote for characters (`u8` literals)  {% comment %} # FIXME: is this still in? see: https://youtu.be/UTqZNujQOlA?t=1936 {% endcomment %}

### Pointers and Addresses

> Use `*` for pointer, `!` for ownership, `&` for address

```cpp
owned : node *! = null;
other : node *  = &graph.node;
```

### Arrays

> Provide size allocations in square brackets: `[3]` <br>
> Use two periods to create a dynamically sized array: `[..]`

```cpp
a: [10] int; // An array of 10 integers
b: [..] int; // A dynamic array of integers
print("size of array: %", a.count);
```

### Structs

```cpp
Vector3 :: struct {
    x: float;
    y: float;
    z: float;
}
```

### Enums

```cpp
My_Enum :: enum u16 {
    FIRST,
    SECOND,
    THIRD = 80,
    FOURTH,
}
```

### Functions and lambdas [^function-declaration]

> Function declarations follow a style of progressive enhancement that allows for straight-forward maturation of code. <br>
> See also: [Factorability]({{site.baseurl}}/features/Language-Features/#factorability).

#### Anonymous code block (lambda)

```cpp
                              { return x * x; };
```

#### Anonymous code block with captured scope [^scope-capture]

```cpp
                              [y] { return x * x + y; };
```

#### Anonymous function

```cpp
          (x: float) -> float { return x * x; };
          (x: float) -> float [y] { return x * x + y; };
```

#### Named Function

```cpp
square := (x: float) -> float { return x * x; };
     f := (x: float) -> float [y] { return x * x + y; };

process_array := (float array[], (x: float) -> float) {
    /* use 2nd arg (proc) to modify 1st (array) */
}
```

#### Named Arguments

```cpp
some_function(arg1, arg2, x: float) -> float { return x * x; };
```

#### Multiple Return Values

```cpp
answer, error := ???;
```


## Iteration

### for [^for1] [^for2]

`for` - supports named or implicit iterators (`it`) <br>
`break` - exits current scope <br>
`continue` - skips to next iteration <br>
`return` - exits current function with value <br>

```cpp
for n: 1..count {
    printf("n is: %d\n", n);
}

results : int[];
for results printf("Hey: %d\n", it);
```

```cpp
for 1..10 {
    if it == 3 then continue;
    if it == 5 then return;
    if it == 8 then break; // will never reach this code
}
```

### while

```
while i < count {
    if i == 5 then {
        i += 1;
        continue;
    }
    if i == 9 then break;
}
```

## Flow Control

### if

### defer [^defer]

`defer` - any statement can be deferred, which executes after the enclosing scope closes

```cpp
defer delete test_node;

f := fopen("foo", "rb");
defer fclose(f);

main := () {
    printf("One!\n");
    defer printf("Three!\n");
    printf("Two!\n");
}
```

## Allocation / Destruction [^new-delete]

`new` - allocates memory, initializes value, casts for assignment <br>
`delete` - frees memory


---

## footnotes

{% capture external_link %}{% include icon.liquid id='external-link' %}{% endcapture %}
{% capture ideas2_2014 %}A Programming Language for Games, talk #2{% endcapture %}
{% capture demo_2014-10-31 %}Demo: Base language, compile-time execution{% endcapture %}

[^basic-types]: the basic types. [_{{ demo_2014-10-31 }}_ {{ external_link }}](https://youtu.be/UTqZNujQOlA?t=803)
[^for1]: iteration over elements with `for`. [_{{ demo_2014-10-31 }}_ {{ external_link }}](https://youtu.be/UTqZNujQOlA?t=1678)
[^for2]: `for`.. `break`, `continue`, `return`. [](https://youtu.be/UTqZNujQOlA?t=1968)
[^defer]: defer is not a macro, it is a core part of the language understood by the compiler and debugger. [_{{ demo_2014-10-31 }}_ {{ external_link }}](https://youtu.be/UTqZNujQOlA?t=1365)
[^function-declaration]: basic function syntax. [_{{ ideas2_2014 }}_ {{ external_link }}](https://youtu.be/5Nc68IdNKdg?t=2686)
[^new-delete]: `new` and `delete` are cleaner than c++. [_{{ demo_2014-10-31 }}_ {{ external_link }}](https://youtu.be/UTqZNujQOlA?t=1265)
[^scalar-declaration]: declarations and assignment. [_{{ ideas2_2014 }}_ {{ external_link }}](https://youtu.be/5Nc68IdNKdg?t=1666)
[^scope-capture]: capture is a property of the code block and not the function header. [_{{ ideas2_2014 }}_ {{ external_link }}](https://youtu.be/5Nc68IdNKdg?t=3041)
[^syntax-comments]: c-style comments, but with proper nesting support. [_{{ demo_2014-10-31 }}_ {{ external_link }}](https://youtu.be/UTqZNujQOlA?t=705)
