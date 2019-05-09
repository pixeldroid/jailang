---
layout: module
title: Basic
module: Basic

constants:
-
  name: TAU
  type: float
  value : 6.283147
  declaration: Basic.jai
  description: "Constant doc comments first line.\n\nSecond.line"
  tags:
  - { name: see, value: Basic#TAU64 }
  - { name: see, value: Basic#_type_table }
-
  name: TAU64
  type: float64
  value : 6.28318530717958647
  declaration: Basic.jai
  description: "Constant doc comments first line."
  footnotes:
  - { label: TAU64, video: demo_20150211, time: 213, text: "many bits of precision." }

fields:
-
  name: _type_table
  type: "[] ^Type_Info"
  declaration: Basic.jai
  description: "an array of `Type_Info`."
  footnotes:
  - { label: type-table, video: demo_20150211, time: 213, text: "`_type_table` is an aray of Type_Info." }
  tags:
  - { name: see, value: "Basic#Type_Info" }
  - { name: see, value: "Basic#Type_Info_Tag" }

procedures:
-
  name: add_build_file
  parameters: [ { name: filename, type: string, description: "name of file to be added to compilation project" } ]
  is_foreign: true
-
  name: array_unordered_remove
  parameters: [ { name: array, type: "*[..] $T", description: "description for array" }, { name: item, type: T, description: "description for item" } ]
  value: [ s64 ]
  declaration: Basic.jai
  description: "Procedure description doc comments first line.\n\nAdditional procedure description documentation comments.\n\nCode sample:\n```cpp\nfor array\n  if it == null return it_index;\n```"
-
  name: array_add_if_unique
  parameters: [ { name: array, type: "*[..] $T", description: "description for array" }, { name: item, type: T, description: "description for item" } ]
  value: [ bool, s64 ]
  declaration: Basic.jai
  description: "Procedure description doc comments first line.\n\nAdditional procedure description documentation comments."


enums:
-
  name: Type_Info_Tag
  declaration: Basic.jai
  description: "Enum doc comments first line.\n\nThis enumeration starts at zero and counts by ones,\nand has a `LAST` entry with value `999`.\n\nThe individual values can have their own doc comments."

structs:
-
  name: Type_Info
  declaration: Basic.jai
  description: "Struct description doc comments first line.\n\nAdditional struct description documentation comments."
-
  name: Type_Info_Integer
  declaration: Basic.jai
  description: "Struct description doc comments first line.\n\nAdditional struct description documentation comments."
-
  name: Type_Info_Float
  declaration: Basic.jai
  description: "Struct description doc comments first line.\n\nAdditional struct description documentation comments."
-
  name: Type_Info_Pointer
  declaration: Basic.jai
  description: "Struct description doc comments first line.\n\nAdditional struct description documentation comments."

---
