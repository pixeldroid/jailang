---
layout: page
title: enum
category: type
description: struct with constant members

footnotes:
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

# enum members: https://youtu.be/ZHqFrNyLlpA?list=PLmV5I2fxaiCKfxMBrNsU1kgKJXD3PkyxO&t=1420
---


# `{{ page.title }}`

Enums (enumerations) are a type of struct that contain a list of constants.

Number-valued enums start their members at `0` by default, but can be initialized to arbitrary values.[^enum-declaration]

```cpp
My_Enum :: enum u16 {
    VALUE_ZERO,
    VALUE_ONE,
    VALUE_TWO,
    VALUE_THREE,
    VALUE_HIGH,
}
```

Introspection for enums includes count, value range, and names.[^enum-introspection]

```cpp
printf("My_Enum ranges from %d to %d.\n", My_Enum.lowest_value, My_Enum.highest_value);
printf("My_Enum has %d members:\n", My_Enum.count);
for My_Enum.names {
    printf("  name: %s: value: %d\n", My_Enum.names[it_index], My_Enum.values[it_index]);
}
```


## declaration

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

Enum values can be treated with strict or loose typing.[^enum-typing]

```cpp
x : My_Enum:strict;
x = My_Enum.VALUE_THREE; // valid
x = 10; // compiler error, even though 10 is a valid u16

y : My_Enum:loose;
y = 10; // valid
y = cast(My_Enum.VALUE_THREE, My_Enum.loose);
```


## properties

- `count` - number of members
- `highest_value` - last value in the enum (may not be the largest numeric value of all the enum members)
- `lowest_value` - first value in the enum (may not be the largest numeric value of all the enum members)
- `members` - array of enum members
- `names` - array of enum names
- `values` - array of enum values


{% include footnotes.liquid references=page.footnotes %}
