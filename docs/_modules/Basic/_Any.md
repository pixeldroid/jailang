---
title: "_Any"
layout: type
module: Basic
type: STRUCT

description: "Data structure backing the `Any` type."
fields:
  - { name: "type", type: "^Type_Info", description: "Type info for the value type." }
  - { name: "value_pointer", type: "^Void", description: "Pointer to the value. Use `type` to understand what to cast it into." }
tags:
- { name: see, value: "Basic#Type_Info" }
---
