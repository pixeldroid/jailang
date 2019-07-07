---
layout: page
title: Named arguments

footnotes:
 -
    label: named-arguments
    video: demo_20150310
    time:  212
    text:  named arguments are useful when you have a function with a whole lot of arguments and the arguments are sometimes of the same type as each other, and so the type checker isn't going to catch you if you pass them in the wrong order, or you accidentally forget one, or there's some default arguments at the end. If you don't have default arguments in your language it's less of a problem [..] so if you have default arguments, then I think you want named arguments.

---


# {{ page.title }}

Parameters to functions can be provided by name or order.

Named arguments provide additional clarity and safety when a function has multiple arguments of the same type, especially if the arguments have default values. [^named-arguments]

```cpp
{% include code/named_arguments.jai %}
```


{% include footnotes.liquid references=page.footnotes %}
