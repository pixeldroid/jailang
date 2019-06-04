---
title: Type_Info
layout: type
module: Basic
type: STRUCT

description: "Metadata for the types that appear in your program.\n\nCastable to more specific structs for additional info."
fields:
- { name: "type", type: "Type_Info_Tag", description: "Represents the types that appear in your program." }
used_by:
- { module: "Basic", name: "Type_Info_Integer" }
- { module: "Basic", name: "Type_Info_Float" }
tags:
- { name: see, value: "Basic#Type_Info_Tag" }
footnotes:
- { label: type-info, video: demo_20150211, time: 218, text: "`Type_Info`s represent every possible type that can happen in your program." }
- { label: type-info-usage, video: demo_20150211, time: 272, text: "Based on what you see in the `type` field, you can cast into a struct that provides more specific details." }
---
