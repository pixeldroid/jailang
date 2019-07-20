---
layout: module
title: Basic
module: Basic
description: "Defines language utilities like the type introspection system."

constants:
-
  name: TAU
  type: float
  value : 6.283147
  declaration: Basic.jai
  description: "Constant doc comments first line.\n\nSecond.line"
  tags:
  - { name: see, value: Basic#TAU64 }
-
  name: TAU64
  type: float64
  value : 6.28318530717958647
  declaration: Basic.jai
  description: "Constant doc comments first line."
  footnotes:
  - { label: TAU64, video: demo_20150211, time: 213, text: "many bits of precision." }
  tags:
  - { name: see, value: Basic#TAU }

fields:
-
  name: _type_table
  type: "[] ^Type_Info"
  declaration: Basic.jai
  description: |
    The entry point for type introspection; an array of `Type_Info`.
  examples:
  - { name: print_all_types, file: "code/print_all_types.jai" }
  footnotes:
  - { label: type-table, video: demo_20150211, time: 213, text: "`_type_table` is an array of Type_Info." }
  - { label: type-print, video: demo_20150211, time: 399, text: "`print_all_types` iterates over `_type_table` and prints information about each type." }
  tags:
  - { name: see, value: "Basic#Type_Info" }

procedures:
-
  name: add_build_file
  parameters: [ { name: filename, type: string, description: "name of file to be added to compilation project" } ]
  is_foreign: true
  footnotes:
  - { label: add-build-file, video: demo_20150401, time: 821, text: "video reference." }
-
  name: add_build_string
  parameters: [ { name: data, type: string, description: "FIXME: add description" } ]
  is_foreign: true
  footnotes:
  - { label: add-build-string, video: demo_20150401, time: 821, text: "video reference." }
-
  name: set_build_file_path
  parameters: [ { name: filename, type: string, description: "FIXME: add description" } ]
  is_foreign: true
  footnotes:
  - { label: set-build-file-path, video: demo_20150401, time: 821, text: "video reference." }
-
  name: update_build_options
  is_foreign: true
  footnotes:
  - { label: update-build-options, video: demo_20150401, time: 821, text: "video reference." }
-
  name: array_add
  parameters: [ { name: array, type: "^[..] $T", description: "array of any type" }, { name: item, type: T, description: "item to add (must be of same type)" } ]
  is_inline: true
  declaration: Basic.jai
  description: "appends `item` to `array`, occupying the new highest index slot. Indices are zero-based."
  footnotes:
  - { label: array-add, video: demo_20150401, time: 821, text: "video reference." }
-
  name: array_add_if_unique
  parameters: [ { name: array, type: "^[..] $T", description: "FIXME: add description" }, { name: item, type: T, description: "FIXME: add description" } ]
  value: [ bool, s64 ]
  declaration: Basic.jai
  description: "FIXME: add description. Procedure description doc comments first line.\n\nAdditional procedure description documentation comments."
  footnotes:
  - { label: array-add-if-unique, video: demo_20150401, time: 821, text: "video reference." }
-
  name: array_unordered_remove
  parameters: [ { name: array, type: "^[..] $T", description: "FIXME: add description" }, { name: item, type: T, description: "FIXME: add description" } ]
  value: [ s64 ]
  declaration: Basic.jai
  description: "FIXME: add description. Procedure description doc comments first line.\n\nAdditional procedure description documentation comments.\n\nCode sample:\n```cpp\nfor array\n  if it == null return it_index;\n```"
  footnotes:
  - { label: array-unordered-remove, video: demo_20150401, time: 821, text: "video reference." }
-
  name: array_reserve
  parameters: [ { name: array, type: "^[..] $T", description: "FIXME: add description" }, { name: count, type: s64, description: "number of slots to pre-allocate for items of type `T`" } ]
  value: [ s64 ]
  declaration: Basic.jai
  description: "FIXME: add description. Procedure description doc comments first line.\n\nAdditional procedure description documentation comments.\n\nCode sample:\n```cpp\nfor array\n  if it == null return it_index;\n```"
  footnotes:
  - { label: array-reserve, video: demo_20150401, time: 821, text: "video reference." }


enums:
-
  name: Optimization_Level
  declaration: Basic.jai
  description: "Flags to signal degree of effort (and time) the compiler should spend optimizing."
  tags:
  - { name: see, value: "Basic#Build_Options" }
-
  name: Type_Info_Tag
  declaration: Basic.jai
  description: "Enumeration of the type categories supported by Jai."

structs:
-
  name: _Any
  declaration: Basic.jai
  description: "Data structure backing the `Any` type."
-
  name: Build_Options
  declaration: Basic.jai
  description: "Flags to the compiler for controlling build-time behavior."
  tags:
  - { name: see, value: "Basic#Optimization_Level" }
-
  name: Type_Info
  declaration: Basic.jai
  description: "Metadata for the types that appear in your program.\n\nCastable to more specific structs for additional info."
  tags:
  - { name: see, value: "Basic#Type_Info_Tag" }
-
  name: Type_Info_Integer
  declaration: Basic.jai
  description: "Type info data structure for integer numbers.\n\nApplies to integers of all bit sizes."
-
  name: Type_Info_Float
  declaration: Basic.jai
  description: "Type info data structure for floating point numbers.\n\nApplies to floats of all bit sizes."
-
  name: Type_Info_Pointer
  declaration: Basic.jai
  description: "Type info data structure for pointers."
-
  name: Type_Info_Procedure
  declaration: Basic.jai
  description: "Type info data structure for procedures."
-
  name: Type_Info_Struct
  declaration: Basic.jai
  description: "Type info data structure for structs."
  tags:
  - { name: see, value: "Basic#Type_Info_Struct_Member" }
-
  name: Type_Info_Struct_Member
  declaration: Basic.jai
  description: "Type info data structure for members of structs."
  tags:
  - { name: see, value: "Basic#Type_Info_Struct" }

---
