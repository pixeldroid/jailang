---
title: Type_Info
layout: type
module: Basic
type: STRUCT

description: "Holds the classification of a type."
fields:
- { description: "Enumeration representing the type's classification.", name: "type", type: "Type_Info_Tag" }
used_by:
- { module: "Basic", name: "Type_Info_Integer" }
tags:
- { name: see, value: "Basic#Type_Info_Tag" }
---
