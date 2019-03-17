---
layout: module
title: Basic
module: Basic

constants:
-
  declaration: Basic.jai
  description: "Constant doc comments first line."
  name: TAU
-
  declaration: Basic.jai
  description: "Constant doc comments first line."
  name: TAU64
enums:
-
  declaration: Basic.jai
  description: "Enum doc comments first line.\n\nThis enumeration starts at zero and counts by ones,\nand has a `LAST` entry with value `999`.\n\nThe individual values can have their own doc comments."
  name: Type_Info_Tag
procedures:
-
  declaration: Basic.jai
  description: "Procedure description doc comments first line.\n\nAdditional Procedure description documentation comments.\n\nCode sample:\n```cpp\nfor array\n  if it == null return it_index;\n```"
  name: array_unordered_remove
-
  declaration: Basic.jai
  description: "SuperClass description doc comments first line.\n\nAdditional Procedure description documentation comments."
  name: array_ordered_remove_by_index
structs:
-
  declaration: Basic.jai
  description: "Struct description doc comments first line.\n\nAdditional struct description documentation comments."
  name: Type_Info
-
  declaration: Basic.jai
  description: "Struct description doc comments first line.\n\nAdditional struct description documentation comments."
  name: Type_Info_Integer
-
  declaration: Basic.jai
  description: "Struct description doc comments first line.\n\nAdditional struct description documentation comments."
  name: Type_Info_Float
-
  declaration: Basic.jai
  description: "Struct description doc comments first line.\n\nAdditional struct description documentation comments."
  name: Type_Info_Pointer

---
