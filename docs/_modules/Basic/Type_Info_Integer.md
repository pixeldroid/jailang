---
title: Type_Info_Integer
layout: type
module: Basic
type: STRUCT

description: "Type info data structure for integer numbers.\n\nApplies to integers of all bit sizes."
fields:
  - { name: "size_in_bits", type: "u32", description: "Bits of memory required to store the numerical value." }
  - { name: "signed", type: "bool" , description: "`true` when the integer can be negative." }
using:
  - { module: "Basic", name: "Type_Info" }
---
