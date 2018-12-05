---
layout: page
title: General Syntax
---

# {{ page.title }}

- TOC
{::options toc_levels="2,3" /}
{:toc}


## Comments

```
// Comment
/* Block comment */
/* Nested /* block /* comment */ */ */
```


## Atomic Types

single quote for string character?

- `---` - uninitialized
- `null` - ???
- `bool` - [`true`, `false`]
- `int` - Integer number (thirty-two bit)
- `float` - Floating point number
- `string` - String of characters enclosed in double quotes
- `Any` - a type that all others types can be cast to
- `u64` - Unsigned sixty-four bit integer number
- `u32` - Unsigned thirty-two bit integer number
- `u16` - Unsigned sixteen bit integer number
- `u8` - Unsigned eight bit integer number
- `s64` - Signed sixty-four bit integer number
- `s32` - Signed thirty-two bit integer number
- `s16` - Signed sixteen bit integer number
- `s8` - Signed eight bit integer number
- `float64` - Sixty-four bit floating point number
- `float32` - Thirty-two bit floating point number


## Declarations

> Use `:` to declare, `=` to assign <br>
> `name : type = value`

### Scalars

- `f : float;` Declares `f`, explicitly typed to `float`
- `f : float = 1;` Declares and initializes `f`
- `f := 1;` Declares and initializes `f`, implicitly typed
- `f = 1;` Assigns `f`, must already be declared

### Enums

```cpp
My_Enum :: enum u16 {
    FIRST,
    SECOND,
    THIRD = 80,
    FOURTH,
}
```

### Arrays

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

### Pointers and Addresses

> Use `*` for pointer, `!` for ownership, `&` for address

```cpp
owned : node *! = null;
other : node *  = &graph.node;
```

### Functions and Lambdas

#### Factorability for Code Maturation

```cpp
                                 { ... } // Anonymous code block
                       [capture] { ... } // Captured code block
     (i: int) -> float [capture] { ... } // Anonymous function
f :: (i: int) -> float [capture] { ... } // Named local function
f :: (i: int) -> float [capture] { ... } // Named global function
```

#### Anonymous Local Code Block

```cpp
{ return x * x; };
```

#### Basic Function Declaration

```cpp
square := (x: float) -> float { return x * x; };
process_array := (float array[], (x: float) -> float) { }
```

#### Scope Capture

```cpp
f := (x: float) -> float [y] { return x * x + y; };
```

#### Named Arguments

```cpp
some_function(arg1, arg2, x: float) -> float { return x * x; };
```

#### Multiple Return Values

```cpp
answer, error := ???;
```


### Iteration

```cpp
for n: 1..count {
    printf("n is: %d\n", n);
}
```

```cpp
results : int[];
for results printf("element: %d", it);
```

```cpp
while i < count {
    if i == 5 then {
        i += 1;
        continue;
    }
    if i == 9 then break;
}
```


### Flow Control

`defer` - any statement can be deferred, which executes after block completes

```cpp
if xx < yy then printf();
```

### Allocation / Destruction

`new` - allocates memory, initializes value, casts for assignment
`delete` - frees memory
