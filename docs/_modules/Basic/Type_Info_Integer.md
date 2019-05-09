---
title: Type_Info_Integer
layout: type
module: Basic
type: STRUCT

description: "Type info data structure for integers.\n\nAdditional struct description documentation comments."
fields:
  - { description: "Bits of memory required to store the integer value.", name: "size_in_bits", type: "u32" }
  - { description: "`true` when the integer can be negative.", name: "signed", type: "bool" }
using:
  - { module: "Basic", name: "Type_Info" }
---
