---
title: Type_Info_Struct
layout: type
module: Basic
type: STRUCT

description: "Type info data structure for structs."
fields:
  - { name: "name", type: "string", description: "Name of the struct (if any)." }
  - { name: "members", type: "[] Type_Info_Struct_Member", description: "Type info for each of the struct members (if any)." }
using:
  - { module: "Basic", name: "Type_Info" }
tags:
- { name: see, value: "Basic#Type_Info_Struct_Member" }
examples:
- { name: field_by_name, file: "code/field_by_name.jai" }
footnotes:
- { label: field-by-name, video: demo_20150211, time: 2349, text: "example casting from `Any` to `Type_Info_Struct` to retrieve a pointer to a struct member." }
---
