---
layout: guide-index
title: Language Features
---

# {{ page.title }}

## Topics

- ✓ General Syntax
- Directives
- FFI / Calling C library code
- Concurrency
- Introspection
- Serialization
- Compile-time code execution (`#run`)


## Directives

- `#import "Library";` - Bring a library into scope
- `#load "file.jai";` - Bring a source code file into scope
- `#run <code>` - Execute <code> at runtime
- `#inline <function def>` - Inline this function definition wherever it is called
- `#no_inline <function def>` - Do not inline this function definition

## Calling C library code / Foreign Function Interface

- `print()` - sprintf
- OpenGL
