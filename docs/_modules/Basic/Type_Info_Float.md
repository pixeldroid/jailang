---
title: Type_Info_Float
layout: type
module: Basic
type: STRUCT

description: "Type info data structure for floating point numbers.\n\nApplies to floats of all bit sizes."
fields:
  - { name: "size_in_bits", type: "u32", description: "Bits of memory required to store the numerical value." }
using:
  - { module: "Basic", name: "Type_Info" }
---
