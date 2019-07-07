---
layout: page
title: General Syntax
order: 1

footnotes:
 -
    label: arrays-built-in
    video: demo_20141210
    time:  1565
    text:  |-
      i don't think you should build every data type into the compiler. Most data types should be defined by your program to be what they want. But some things are very common, so you want them to be very fast, and you want them to compile quickly because you're going to have them all over your program.
 -
    label: array-declaration
    video: demo_20141210
    time:  1598
    text:  |-
      we have a basic static array (`[N] int`)...dynamic array (`[..] int`)...empty brackets (`array: [] int`) [which is] a pointer to the data `array[]`, and a length value, `array.count`.
 -
    label: array-mistake-in-c
    mla:   C's Biggest Mistake. Walter Bright, Dec 22, 2009
    url:   http://www.drdobbs.com/architecture-and-design/cs-biggest-mistake/228701625
    text:  C's biggest mistake is conflating pointers with arrays.
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
    label: for-remove
    video: demo_20141210
    time:  2106
    text:  |-
      the `remove` primitive removes the current element from the array. is inherent in the loop in the way `break` or `continue` are.
 -
    label: defer
    video: demo_20141031
    time:  1365
    text:  defer is not a macro, it is a core part of the language understood by the compiler and debugger.
 -
    label: default-values
    video: demo_20141211_qa
    time:  232
    text:  default values are always zero. the default value...is the zero value for your type.
 -
    label: default-value-initialization
    video: demo_20141210
    time:  1075
    text:  |-
      every single thing in the language always gets initialized to its default value, which is usually zero unless you specify a different default value. but, for performance reasons, you have the ability to say, "well, actually, let's not initialize this thing."
 -
    label: enum-declaration
    video: demo_20141031
    time:  1058
    text:  enums are typed, can be named or anonymous, and can refer to values declared elsewhere.
 -
    label: enum-introspection
    video: demo_20141210
    time:  2684
    text:  an enum is actually syntactic sugar for a struct that has some elements that tells you things about the enum.
 -
    label: enum-typing
    video: demo_20141210
    time:  2906
    text:  enums are strict types, distinct from all other types declared in the program, and can be treated with strict or loose typing behavior on a per-statement basis.
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
    video: demo_20141210
    time:  1238
    text:  |-
      dash-dash-dash (`---`) means don't initialize this.
 -
    label: pointer-declaration
    video: demo_20141210
    time:  769
    text:  for pointers, use Pascal-style pointy hat (`^`) instead of ampersand (`&`). still use star (`*`) to dereference a pointer.
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
 -
    label: default-arguments
    video: demo_20150310
    time:  156
    text:  like what you would see in C when you delcare a procedure, and it's got an argument `a` that's an integer and now you can say it equals `9`, and `b` is an integer and it equals `9`. So just like in C++, for example, if you don't pass those arguments, then you'll get those default values.
 -
    label: named-arguments
    video: demo_20150310
    time:  212
    text:  named arguments are useful when you have a function with a whole lot of arguments and the arguments are sometimes of the same type as each other, and so the type checker isn't going to catch you if you pass them in the wrong order, or you accidentally forget one, or there's some default arguments at the end. If you don't have default arguments in your language it's less of a problem [..] so if you have default arguments, then I think you want named arguments.
 -
    label: multiple-return-values
    video: demo_20150310
    time:  1539
    text:  |-
      here's what multiple return values are like. I've got some function `foo :: () -> int, int`. It takes no arguments, and it returns, instead of one int, it returns two ints. It returns `int, int`, and I'm going to `return 3, 5;`. I've got an `int x` and an `int y`, and you can take both values by just saying `x, y = foo();`.
 -
    label: default-return-values
    video: demo_20150310
    time:  2940
    text:  you can have default values on your return values, just like with arguments.
 -
    label: comma-separated-declarations
    video: demo_20150310
    time:  2282
    text:  |-
      so ["x comma y equals foo", generalized] gives you comma separated declarations (`x, y, z: float;`).
 -
    label: comma-separated-assignments
    video: demo_20150310
    time:  2356
    text:  |-
      you can do comma-separated expressions on the right-hand side.
 -
    label: individual-assignments
    video: demo_20150310
    time:  2558
    text:  |-
      if it's a single-valued expression on the right-hand side, we individually assign that to all variables.

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

{% assign collection = site.collections | where:'title','Reference' | first %}
{% for d in collection.docs %}
{% unless d.category == 'type' %}{% continue %}{% endunless%}
- [{{ d.title }}]({{site.baseurl}}{{d.url}}#/reference) - {{ d.description }}
{% endfor %}


## Declarations

### Scalars [^scalar-declaration]

> Use `:` to declare, `=` to assign <br>
> `name : type = value`
> `name1, name2 : type = value`

- `f : float;` Declares `f`, explicitly typed to `float` (default value is `0`)[^default-values]
- `x, y, z : float;` Declares `x`, `y`, and `z` explicitly as floats with default value `0`. [^comma-separated-declarations]
- `f : int = 1;` Declares and initializes `f`
- `f, g, h : int = 3;` Assigns `3` to each of `f`, `g`, and `h`. [^individual-assignments]
- `f := 1;` Declares and initializes `f`, implicitly typed
- `f = 1;` Assigns `f` or generates error if not already declared
- `f, g = 1, 2;` Assigns `1` to `f` and `2` to `g` or generates error if either not already declared. [^comma-separated-assignments]
- `c := 'c` - single quote for characters (`u8` literals)  {% comment %} # FIXME: is this still in? see: https://youtu.be/UTqZNujQOlA?t=1936 {% endcomment %}

### Pointers and Addresses

> Use `^` for pointer, `*` for address[^pointer-declaration], `!` for ownership

```cpp
e : Entity;

pointer : ^Entity;
pointer = *e;

owned : node *! = null;
other : node *  = *graph.node;
```

### Arrays

> Provide static size allocations in square brackets[^array-declaration]: `[3]` <br>
> Use two periods to create a dynamically sized array[^array-declaration]: `[..]` <br>
> Array indices are zero-based (the first element is at index `0`). <br>
> _see also: [Iteration](#iteration)_.

```cpp
a: [10] int; // A static array of 10 integers
b: [..] int; // A dynamic array of integers
print("size of array: %", a.count);
```

Arrays are a datatype built into the compiler, to improve performance and avoid some of the errors common in C. [^arrays-built-in] [^array-mistake-in-c]

### Structs

```cpp
Vector3 :: struct {
    x: float; // could also write:  x, y, z: float;
    y: float;
    z: float;
}
```

### Enums

Enum members start at `0` by default, but can be initialized to arbitrary values.[^enum-declaration]

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

Introspection for enums includes count, value range, and names.[^enum-introspection]

```cpp
printf("My_Enum ranges from %d to %d.\n", My_Enum.lowest_value, My_Enum.highest_value);
printf("My_Enum has %d members:\n", My_Enum.count);
for My_Enum.names {
    printf("  name: %s: value: %d\n", My_Enum.names[it_index], My_Enum.values[it_index]);
}
```

Enum values can be treated with strict or loose typing.[^enum-typing]

```cpp
x : My_Enum:strict;
x = My_Enum.VALUE_THREE; // valid
x = 10; // compiler error, even though 10 is a valid u16

y : My_Enum:loose;
y = 10; // valid
y = cast(My_Enum.VALUE_THREE, My_Enum.loose);
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
square :: (x: float) -> float { return x * x; };
     f :: (x: float) -> float [y] { return x * x + y; };

process_array :: (float array[], (x: float) -> float) {
    /* use 2nd arg (proc) to modify 1st (array) */
}
```

Functions also support default arguments [^default-arguments], named arguments [^named-arguments], multiple return values [^multiple-return-values], and default return values [^default-return-values]

#### Default Arguments

```cpp
defaults :: (a: int = 9, b: int = -9) { printf("a is %d;\nb is %d.\n", a, b); };
```

#### Named Arguments

```cpp
{% include code/named_arguments.jai %}
```

#### Multiple Return Values

```cpp
{% include code/multiple_return_values.jai %}
```

#### Default Return Values

```cpp
{% include code/default_return_values.jai %}
```

## Initialization

> variable declarations are automatically initialized to type defaults. <br>
> initialization can be _implicit_ (accept default), _explicit_ (provide value), or _blocked_ (`---`).[^default-value-initialization] [^prevent-initialization] <br>

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
vb: Vector2_blocked;         print("% %\n", vb.x, vb.y); // undefined, possibly zeroes
veb: Vector2_explicit = ---; print("% %\n", ve.x, ve.y); // undefined, possibly zeroes
```


## Iteration

### for [^for-iteration] [^for-statements]

`for` - supports named or implicit (`it`) iterators over ranges or arrays <br>
`break` - exits current scope <br>
`continue` - skips to next iteration <br>
`return` - exits current function with value <br>
`remove <it>` - deletes iterator from array being visited [^for-remove] <br>

```cpp
for n : 1..count {
    printf("n is: %d\n", n);
}

results : int[];
for r : results {
    if r == 3 then remove r;
}
for results printf("results[%d] == %d\n", it_index, it);
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
