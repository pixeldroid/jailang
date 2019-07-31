---
layout: page
title: '$'
category: operator
description: indicate the authoritative variable type parameter for a polymorphic procedure
search_tags: type variable dollar

footnotes:
 -
    label: type-variable
    video: demo_20150401
    time:  228
    text:  what the dollar sign indicates is that this is a type variable which means we don't know what type it is at declaration time. the type of this variable will be determined when the function is called.
 -
    label: one-dollar
    video: demo_20150401
    time:  360
    text:  the reason that we only use the dollar sign once is that the dollar sign tells us which argument is authoritative over what the type should be..

---

# `{{ page.title }}`

Indicates the authoritative variable type parameter for a polymorphic procedure. [^type-variable] [^one-dollar]

{% include collapsible_example.liquid file='code/swap.jai' syntax='cpp' %}

{% include collapsible_example.liquid file='code/find.jai' syntax='cpp' %}

{% include collapsible_example.liquid file='code/do_three_times.jai' syntax='cpp' %}


{% include footnotes.liquid references=page.footnotes %}
