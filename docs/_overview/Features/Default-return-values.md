---
layout: page
title: Default return values

footnotes:
 -
    label: default-return-values
    video: demo_20150310
    time:  2940
    text:  you can have default values on your return values, just like with arguments.
 -
    label: flow-back
    video: demo_20150310
    time:  3076
    text:  sometimes you would like a little bit of help managing the flow of information back up the stack of functions.

---


# {{ page.title }}

Return values for functions in Jai may be defined with default values, similar to arguments. [^default-return-values]

```cpp
{% include code/default_return_values.jai %}
```

Named return values with defaults can provide a simpler alternative to exceptions: [^flow-back]

```cpp
Status :: enum {
  SUCCESS,
  NEGATIVE_NUMBERS_CONFUSE_MY_API,
  EVEN_NUMBERS_ARE_FOR_LOSERS
}

using Status.members;

Vector3 :: struct {
  x, y, z: float;
}

Entity :: struct {
  using position : Vector3;
  id : u32;
}

complicated_function :: (input : int) -> result: ^Entity = null, status := SUCCESS {
  if input < 0    return status = NEGATIVE_NUMBERS_CONFUSE_MY_API;
  if !(input % 2) return status = EVEN_NUMBERS_ARE_FOR_LOSERS;

  e := new Entity;
  e.id = cast(input, u32);

  return result = e;
}
```


{% include footnotes.liquid references=page.footnotes %}
