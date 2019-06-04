---
title: "Optimization_Level"
layout: type
module: Basic
type: ENUM

description: "Flags to signal degree of effort (and time) the compiler should spend optimizing."
constants:
  - { name: "DEBUG", type: "u8", value: "0", description: "Perform only simple and fast optimizations." }
  - { name: "RELEASE", type: "u8", value: "1", description: "Perform more complicated (and slower) optimizations." }
tags:
- { name: see, value: "Basic#Build_Options" }
---
