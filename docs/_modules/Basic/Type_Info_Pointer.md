---
title: Type_Info_Pointer
layout: type
module: Basic
type: STRUCT

description: "Type info data structure for pointers."
fields:
  - { name: "pointer_to", type: "^Type_Info", description: "Value referred to by this pointer." }
  - { name: "soa_packing", type: "s32", description: "`-1` means no SOA. `0` means no size. `>0` is AOSOA of that chunk size." }
using:
  - { module: "Basic", name: "Type_Info" }
footnotes:
- { label: soa-packing, video: demo_20150212_qa, time: 1354, text: "`-1` means a conventional in-order value-packed struct. `0` means /Data-Oriented Demo: SOA, composition/. A value greater than zero will mean an AOSOA of the specified chunk size." }
- { label: soa-demo, video: demo_20150121, text: "Defining and demonstrating of Struct of Arrays (SOA)" }
---
