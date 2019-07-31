---
layout: directive
title: '#modify'
category: directive
invocation: "`f :: (a: $A) -> $B #modify (A: ^Type_Info) -> <something> { <modify-code> } { <procedure-code> }`"
description: provide a function to manipulate a type variable prior to it being used in a polymorphic procedure
see_also:
- { text: "Type_Info", url: "/modules/Basic/Type_Info/#/modules/" }

examples:
- { name: sum_modify, file: "code/sum_modify.jai" }

footnotes:
-
  label: directive-modify
  video: demo_20150401
  time:  2593
  text:  |-
    [..] this thing called a modify directive [..] you can attach it onto a polymorphic procedure, and it supplies code that runs at compile time that maps the types given by the user onto the types of the generated function.
-
  label: modify-chain
  video: demo_20150401_2
  time:  423
  text:  |-
    ..you can chain them together, and if you use more than one, they get called in order. So, [..] you could have a toolkit of them that you just apply.

---

`#modify` injects a user-defined procedure at compile time to allow for validation, modification, or other arbitrary actions on the type variables being passed to a polymorhpic procedure.

The procedure can be defined inline:

```cpp
foo :: (f: $T) -> $R
#modify (T : ^Type_Info, R : ^Type_Info) -> ^Type_Info, ^Type_Info { /* .. */ }
{
  // ..
}
```

Or named and shared:

```cpp
ensure_R_is_big_enough :: (T : ^Type_Info, R : ^Type_Info) -> ^Type_Info, ^Type_Info { /* .. */ }

foo :: (f: $T) -> $R
#modify ensure_R_is_big_enough
{
  // ..
}

bar :: (b: $T) -> $R
#modify ensure_R_is_big_enough
{
  // ..
}
```

Multiple `#modify` procedures can be chained, and execute in order.

```cpp
foo :: (a: $T) -> $R
#modify ensure_R_is_big_enough
#modify reject_R_if_float
{
  // ..
}
```
