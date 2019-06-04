---
layout: page
title: Compile-time code execution

footnotes:
 -
    label: run-in-compiler
    video: reboot_2017
    time:  1526
    text:  full compile-time execution.

---


# {{ page.title }}

There are no limitations, the compiler knows how to _run_ the intermediate representation of the programming language.[^run-in-compiler]
{:.larger.text}

This lets you simplify your project:

- no make, build, or properties files in other arbitrary languages; everything is written in the same main language.
- cross-platform. exactly the same code works on every platform.


{% include footnotes.liquid references=page.footnotes %}
