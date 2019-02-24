---
layout: directive
title: #foreign
category: directive
invocation: "`<procedure-signature> #foreign \"<link-alias>\";`"
description: instruct compiler to link against a foreign library.
see_also:
- { text: "#foreign_library", url: "/reference/Directives/%23foreign_library/#/reference/" }

footnotes:
 -
    label: foreign-function
    video: demo_20141031
    time:  5765
    text:  _foreign_ right now means c calling syntax.
 -
    label: link-alias
    video: demo_20141031
    time:  5814
    text:  i can call the function with [one] name, but link against something with [another] name.

---

When linking, the compiler will look for a symbol matching `link-alias`.
If not provided, it will look for a symbol that matches the procedure name in the signature.