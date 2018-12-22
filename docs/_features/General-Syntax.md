---
layout: page
title: General Syntax

footnotes:
 -
    label: basic-types
    video: demo_20141031
    time:  803
    text:  the basic language types.
 -
    label: for-iteration
    video: demo_20141031
    time:  1678
    text:  iteration over elements with `for`.
 -
    label: for-statements
    video: demo_20141031
    time:  1968
    text:  |-
        `for`.. `break`, `continue`, `return`.
 -
    label: defer
    video: demo_20141031
    time:  1365
    text:  defer is not a macro, it is a core part of the language understood by the compiler and debugger.
 -
    label: enum-declaration
    video: demo_20141031
    time:  1058
    text:  enums are typed, can be named or anonymous, and can refer to values declared elsewhere.
 -
    label: function-declaration
    video: ideas_20140926
    time:  2686
    text:  basic function syntax.
 -
    label: new-delete
    video: demo_20141031
    time:  1265
    text:  |-
        `new` and `delete` are cleaner than c++.
 -
    label: prevent-initialization
    text:  'FIXME: find this video reference'
 -
    label: scalar-declaration
    video: ideas_20140926
    time:  1666
    text:  declarations and assignment.
 -
    label: scope-capture
    video: ideas_20140926
    time:  3041
    text:  capture is a property of the code block and not the function header.
 -
    label: syntax-comments
    video: demo_20141031
    time:  705
    text:  c-style comments, but with proper nesting support.
 -
    label: void-pointer-hack
    video: demo_20141031
    time:  1780
    text:  void pointer may have been removed from language since this video.

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

- `---` - uninitialized [^prevent-initialization]
- `null` - null pointer, unequal to any pointer to any object or function
- `void` - void pointer, maybe a temporary idea [^void-pointer-hack] {% comment %} # FIXME: is this still in? see: https://youtu.be/UTqZNujQOlA?t=1780 {% endcomment %}
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

### Enums [^enum-declaration]

```cpp
My_Enum :: enum u16 {
    VALUE_ZERO = 0,
    VALUE_ONE,
    VALUE_THREE = VALUE_TWO,
    VALUE_FOUR = MIDDLE_VALUE, // declared outside of enum
    VALUE_HIGH,                // trailing comma is fine
}

MIDDLE_VALUE := 8;
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


## Initialization

> variable declarations are automatically initialized to type defaults. <br>
> initialization can be implicit (accept default), explicit (provide value), or blocked (`---`). <br>

[^prevent-initialization]: []()

```cpp
Vector2_implicit :: struct {
    x: float;
    y: float;
}
Vector2_explicit :: struct {
    x: float = 3;
    y: float = 5;
}
Vector2_blocked :: struct {
    x: float = ---;
    y: float = ---;
}

vi: Vector2_implicit;        print("% %\n", vi.x, vi.y); // "0 0"
ve: Vector2_explicit;        print("% %\n", ve.x, ve.y); // "3 5"
vb: Vector2_blocked;         print("% %\n", vb.x, vb.y); // compiler error?
veb: Vector2_explicit = ---; print("% %\n", ve.x, ve.y); // compiler error?
```


## Iteration

### for [^for-iteration] [^for-statements]

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


{% include footnotes.liquid references=page.footnotes %}
