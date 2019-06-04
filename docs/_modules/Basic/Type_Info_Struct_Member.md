---
title: Type_Info_Struct_Member
layout: type
module: Basic
type: STRUCT

description: "Type info data structure for members of structs."
fields:
  - { name: "name", type: "^u8", description: "Name of this struct member." }
  - { name: "type", type: "^Type_Info", description: "Type info this struct member." }
  - { name: "offset_in_bytes", type: "s64", description: "" }
  - { name: "flags", type: "u32", description: "" }
  - { name: "notes", type: "[] ^u8", description: "" }
constants:
  - { name: "CONSTANT", type: "u32", value: "0x1", description: "flag indicating declaration as a constant" }
  - { name: "IMPORTED", type: "u32", value: "0x2", description: "flag indicating declaration via `using`" }
using:
  - { module: "Basic", name: "Type_Info" }
tags:
- { name: see, value: "Basic#Type_Info_Struct" }
---
