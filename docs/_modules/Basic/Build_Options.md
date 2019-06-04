---
title: "Build_Options"
layout: type
module: Basic
type: STRUCT

description: "Flags to the compiler for controlling build-time behavior."
fields:
  - { name: "optimization_level", type: "u8", default_value: "Optimization_Level.DEBUG", description: "Amount of effort to spend optimizing." }
  - { name: "emit_line_directives", type: "bool", default_value: "true", description: "#FIXME: need description" }
  - { name: "runtime_storageless_type_info", type: "bool", default_value: "false", description: "when `true`, strip all `Type_Info` metadata to reduce binary size. The `_type_table` will hold unique integers instead of `Type_Info` structs." }
  - { name: "executable_name", type: "string", description: "name to give compiled binary executable" }
  - { name: "output_path", type: "string", description: "path to write compiled binary to" }
tags:
- { name: see, value: "Basic#Optimization_Level" }
- { name: see, value: "Basic#_type_table" }
- { name: see, value: "Basic#Type_Info" }
footnotes:
- { label: runtime-storageless-type-info, video: demo_20150211, time: 2006, text: "By setting `runtime_storageless_type_info` to `true`, you're basically saying \"I don't want all that data..\", but you still can use `Type_Info`. It's no longer a pointer you can dereference to a struct, but an integer cast as a pointer." }
---
