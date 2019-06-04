---
title: Type_Info_Procedure
layout: type
module: Basic
type: STRUCT

description: "Type info data structure for procedures."
fields:
  - { name: "return_type", type: "^Type_Info", description: "Type of the function result." }
  - { name: "argument_types", type: "[] ^Type_Info", description: "Type info for each of the arguments to the function (if any)." }
using:
  - { module: "Basic", name: "Type_Info" }
---
