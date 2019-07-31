---
layout: directive
title: '#bake_values'
category: directive
invocation: "`v :: #bake_values f(<type-name> = <value>);`"
description: provide specific values to a function at compile time
see_also:
- { text: "`$$` (auto-bake)", url: "/reference/Operators/op_autobake/#/reference/" }

examples:
- { name: length_body_text, file: "code/length_body_text.jai" }

footnotes:
-
  label: directive-bake_values
  video: demo_20150401_2
  time:  2828
  text:  |-
    `#bake_values` [..] polymorphic functions are mostly like regular functions, they just take type variables. Once you've done that, once you have it so that there's not much of a difference between polymorphic functions and regular functions, you can start treating regular functions like polymorphic functions and do cool stuff with it.

---
