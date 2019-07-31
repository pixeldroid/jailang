---
layout: directive
title: '#body_text'
category: directive
invocation: "`f :: (a: $A) #body_text (A: ^Type_Info) -> string { <body-code> }`"
description: provide a procedure to generate source for the body of a polymorphic procedure
see_also:
- { text: "Type_Info", url: "/modules/Basic/Type_Info/#/modules/" }

examples:
- { name: length_body_text, file: "code/length_body_text.jai" }

footnotes:
-
  label: directive-body_text
  video: demo_20150401_2
  time:  2437
  text:  |-
    you can have this `#body_text` directive that replaces this function body, and like a modify proc it takes the types and returns a string, and the string it returns is then fed by the compiler back into the compilation loop.
-
  label: body_text-overkill
  video: demo_20150401_2
  time:  2736
  text:  |-
    building a string and running the string is kind of overkill. That's kind of big guns to bring to any fight, and a lot of time you don't need it. Most of the time you would use [other language features]. But it's a very powerful technique.

---
