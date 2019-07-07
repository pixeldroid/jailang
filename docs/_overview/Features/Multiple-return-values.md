---
layout: page
title: Multiple return values

footnotes:
 -
    label: multiple-return-values
    video: demo_20150310
    time:  1539
    text:  |-
      here's what multiple return values are like. I've got some function `foo :: () -> int, int`. It takes no arguments, and it returns, instead of one int, it returns two ints. It returns `int, int`, and I'm going to `return 3, 5;`. I've got an `int x` and an `int y`, and you can take both values by just saying `x,y = foo();`.

---


# {{ page.title }}

Functions in Jai may return multiple values, and multiple variables may be assigned the result of a function. [^multiple-return-values]

```cpp
{% include code/multiple_return_values.jai %}
```


{% include footnotes.liquid references=page.footnotes %}
