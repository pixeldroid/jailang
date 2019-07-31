---
layout: directive
title: '#bake'
category: directive
invocation: "`#bake <procedure>(<type-variable> = <type>)`"
description: generate a compiled function with predefined values for type variables

examples:
- { name: named_bake_test, file: "code/named_bake_test.jai" }
- { name: internal_bake_test, file: "code/internal_bake_test.jai" }

footnotes:
-
  label: directive-bake
  video: demo_20150401
  time:  2170
  text:  I can do a thing called 'bake', where I use this `#bake` directive to generate a compiled function. This doesn't happen at runtime, this is a thing that happens at compile time only, because we're a compiled language.

---
