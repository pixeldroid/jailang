---
layout: page
title: Initial premises
---

# {{ page.title }}

_goal:_ a new language to replace the current defacto standard of C++ that is not a 'big agenda' language, but a working person's language
{:.larger.text}

- TOC
{::options toc_levels="2,3" /}
{:toc}


## Considered alternatives

- **[go][go]** - good, but GC'd, and concurrency model is too restrictive
- **[D][d]** - buys too much into C++'s ideas
- **[rust][rust]** - cares too much about safety, probably high friction


## Feasability

Making a AAA game is probably more complicated than making a compiler, and it doesn't make programming better for everyone. Also, because this language will be simpler than C++, it will be less work to develop.


## Why now?

[LLVM][llvm] exists and takes care of the hard parts of compiler building: optimizing and generating competent machine code for multiple target platforms


## What's in it for the game programming community?

- if using the language is even 10% simpler, the impact to the industry will be large
- performance improvements of 20% are expected, comparable to C, but simpler to use
- most importantly, increasing the joy of programming will actually make programmer's lives better


## Video references

- [A Programming Language for Games](https://youtu.be/TH9VCN6UkyQ)
- [A Programming Language for Games, talk #2](https://youtu.be/5Nc68IdNKdg)



[d]: https://dlang.org/ "The D programming language"
[go]: https://golang.org/ "The Go Programming Language"
[llvm]: https://llvm.org/ "The LLVM Compiler Infrastructure Project"
[rust]: https://www.rust-lang.org/en-US/ "The Rust programming language"
