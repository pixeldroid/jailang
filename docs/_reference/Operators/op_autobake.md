---
layout: page
title: '$$'
category: operator
description: trigger function baking when the parameter value is known at compile time
search_tags: auto bake dollar

footnotes:
-
  label: op-dollar-dollar
  video: demo_20150401_2
  time:  3150
  text:  |-
    [in procedure `print_names_and_values`], you may have noticed this funny `$$` up here, before the variable `mode`, and what that means is anytime, anywhere in the program where you call `print_names_and_values` if the value that you're passing for `Spacing_Mode.strict` is known at compile time [..], then auto-bake this function so that only these are really the parameters and this one is hard-coded so that the code gets generated with `mode` as a constant, so that you don't have to pay for these `if` statements.

---

# `{{ page.title }}`

Signals the compiler to bake a function when the value of the operand parameter is known at compile time. [^op-dollar-dollar]

{% include collapsible_example.liquid file='code/print_names_and_values_autobake.jai' syntax='cpp' %}


{% include footnotes.liquid references=page.footnotes %}
