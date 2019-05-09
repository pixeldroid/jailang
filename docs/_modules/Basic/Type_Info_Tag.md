---
title: Type_Info_Tag
layout: type
module: Basic
type: ENUM

description: "Enumeration of the types supported by Jai."
fields:
  - { description: "an integer value (`int`, `u8`, `u16`, `u32`, `u64`, `s8`, `s16`, `s32`, `s64`).", name: "INTEGER", type: "u32" }
  - { description: "a floating point value (`float`, `float32`, `float64`).", name: "FLOAT", type: "u32" }
  - { description: "a boolean value (`bool`).", name: "BOOL", type: "u32" }
  - { description: "a character string value (`string`).", name: "STRING", type: "u32" }
  - { description: "a pointer value (`pointer`).", name: "POINTER", type: "u32" }
  - { description: "a procedure (`procedure`), a.k.a function, method.", name: "PROCEDURE", type: "u32" }
  - { description: "unknown value (`void`).", name: "VOID", type: "u32" }
  - { description: "a data structure (`struct`).", name: "STRUCT", type: "u32" }
  - { description: "an array (`array`).", name: "ARRAY", type: "u32" }
  - { description: "no value (`null`).", name: "NULL", type: "u32" }
  - { description: "wildcard value (`any`).", name: "ANY", type: "u32" }
  - { description: "an enumeration (`enum`).", name: "ENUM", type: "u32" }
---
