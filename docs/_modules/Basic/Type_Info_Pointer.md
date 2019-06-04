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
---
