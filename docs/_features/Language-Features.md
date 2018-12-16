---
layout: page
title: Language Features
---

# {{ page.title }}

- TOC
{::options toc_levels="2,3" /}
{:toc}


## Anti-features

Jai is designed to _not_ provide the following:

- header files [^no-header-files]
- garbage collection [^no-garbage-collection]
- exceptions [^no-exceptions]  (see Multiple return values instead)
- smart pointers [^no-smart-pointers]  (see [Memory management](#memory-management) instead)
- template metaprogramming [^no-template-metaprogamming]  (see Polymorphism instead)


## A permissive license [^permissive-license]

Jai will be released under a permissive license, but the details have not been sorted out yet. People should just be able to take the compiler and not worry about what they're doing with it.


## Syntax

> see [General Syntax]({{site.baseurl}}/features/General-Syntax/#/features/)


## Directives

> There is no preprocessor for Jai; directives are just part of the language. [^no-preprocessor]

- `#assert <expression> <message>` - static assert generates compiler error when expression evaluates to `false` [^directive-assert]
- `#check_call <function def> <checker def>` - run a provided checking function whenever the named function is called [^directive-check-call]
- `#file` - name of current source file [^file-path-name-line]
- `#filepath` - path to current source file [^file-path-name-line]
- `#import "Library";` - bring a library into scope
- `#inline <function def>` - inline `<function_def>` wherever it is called
- `#line` - line number of current statement [^file-path-name-line]
- `#load "file.jai";` - bring a source code file into scope
- `#no_inline <function def>` - do not inline this function definition
- `#run <code>` - execute `<code>` at compile time (not run time) [^directive-run]


## Full compile-time code execution [^run-in-compiler]

There are no limitations, the compiler knows how to run the intermediate representation of the programming language.

This lets you simplify your project:

- no make, build, or properties files in other arbitrary languages; everything is written in the same main language.
- cross-platform. exactly the same code works on every platform.

### Build routines

The Jai compiler will handle all the aspects of building an executable: compiling (in parallel), linking, etc. [^compiler-does-everything]

The compiler provides an api to work with build configuration options. [^build-routine] [^build-options]

For example:

```cpp
build := () {
    printf("In build (at compile time).\n");

    printf("Building from file %s, line %d.\n", #file, #line);
    printf("filepath is: %s\n", #filepath);

    set_build_file_path(#filepath);

    add_build_file("misc.jai");
    add_build_file("invaders.jai");
    add_build_file("checks.jai");
}

#run build();
```

or:

```cpp
setup_debug :: (w: Workspace) {
    options := get_build_options(w); // gets Build_Options struct

    options.output_executable_name = "soko_debug";
    options.output_path = concatenate(#filepath, "../run_tree/");
    options.backend = Backend.X64;

    set_optimization_level(*options, 0, 0);
    set_build_options(options, w);
}

start_workspace :: (name: string, proc: (w: Workspace) -> void) {
    w := compiler_create_workspace(name); // part of jai standard library

    if !w {
        print("Workspace creation failed for '%'\n", name);
        return;
    }

    proc(w);
}

#run start_workspace("debug", setup_debug);
```

This also lets you re-use more code, and make build activities arbitrarily complex (code analysis, correctness checks, house rules, etc.) by using a general purpose programming language instead of various specialized build languages.

You can write programs that modify or generate code during compilation to use in a later part of the compilation process. [^code-modification]

```cpp
value_table: [] float = #run generate_expensive_values(); // #run invokes the compile time execution
```

## Memory management

The language design focuses on making it easier to manage memory. [^memory-memory-memory]

Jai provides the owned pointer notation (`*!`)[^owned-pointer] to indicate that the object pointed to is owned by the member's struct and should be freed when the struct is freed. This can obviate the need for constructors and destructors.

```cpp
struct Mesh {
    Vector3 *! positions;
    int *! indices;
};
```


## Factorability

Code has a maturation cycle; you don't just write the final thing initially, because you don't know what it should be. You work your way there. [^code-maturation]

Scalars and functions do not require meaningless syntax changes when changing scope, capturing scope [^capture-for-any-block], or switching between being named or unnamed. [^factorability1] [^factorability2]

```cpp
                                 { ... } // Anonymous code block
                       [capture] { ... } // Captured code block
     (i: int) -> float [capture] { ... } // Anonymous function
f :: (i: int) -> float [capture] { ... } // Named function (local or global)
```


## Concurrency

CPU clock speeds aren't getting that much faster anymore, but we are getting more processors. So concurrency is hugely important for games. [^concurrency]


## Named argument passing

{% comment %} FIXME: find a reference [^named-arguments]: [](https://youtu.be/TH9VCN6UkyQ?t=4999) {% endcomment %}

```cpp
some_function(arg1, arg2, x: float) -> float { return x * x; };
```


## Introspection [^introspection]

Full access to type info (in a compiled language) available at compile time and run time.

Requesting type info returns a pointer to an entry in the type table that is a `TypeInfo` struct. These structs can be printed directly for quick and cheap debugging.

```cpp
for _type_table { // iteration in Jai includes access to two local variables: it, it_index
    // it       - iterator, the current TypeInfo struct
    // it_index - zero-based iteration index, an integer

    print(it);
    // or..
    print("%:\n", it_index);
    print("  name: %\n", it.name);
    print("  type: %\n", it.type);
}
```

Equivalent data structures are provided for the entire text of the program (at compile time only). [^ast-access]


## Calling C library code / Foreign Function Interface

- `printf()` - calls out to C's printf [^ffi-printf]
- OpenGL

---

## footnotes

{% capture external_link %}{% include icon.liquid id='external-link' %}{% endcapture %}
{% capture ideas1_2014 %}Ideas about a new programming language for games{% endcapture %}
{% capture ideas2_2014 %}A Programming Language for Games, talk #2{% endcapture %}
{% capture demo_2014-10-31 %}Demo: Base language, compile-time execution{% endcapture %}
{% capture reboot_2017 %}Reboot Develop 2017 - Jonathan Blow, Thekla Inc. / Making Game Programming Less Terrible{% endcapture %}

[^ast-access]: data structures for all the code in the program. [_{{ reboot_2017 }}_ {{ external_link }}](https://youtu.be/De0Am_QcZiQ?t=2551)
[^build-options]: you have a struct that definces the build options, and you apply those build options to the compiler workspace. [_{{ reboot_2017 }}_ {{ external_link }}](https://youtu.be/De0Am_QcZiQ?t=1759)
[^build-routine]: using the `#run` directive to run a build routine at compile time. [_{{ demo_2014-10-31 }}_ {{ external_link }}](https://youtu.be/UTqZNujQOlA?t=3859)
[^capture-for-any-block]: i can just apply a capture to any block. [_{{ ideas2_2014 }}_ {{ external_link }}](https://youtu.be/5Nc68IdNKdg?t=3344)
[^code-maturation]: your programming language should be designed to support the transition from humble beginnings to final product. [_{{ ideas2_2014 }}_ {{ external_link }}](https://youtu.be/5Nc68IdNKdg?t=2171)
[^code-modification]: you can modify compile-time data structures and resubmit them. [_{{ reboot_2017 }}_ {{ external_link }}](https://youtu.be/De0Am_QcZiQ?t=2571)
[^compiler-does-everything]: you shouldn't need wacky different tools on every operating system. you should need the compiler and your source code and that's all. [_{{ ideas1_2014 }}_ {{ external_link }}](https://youtu.be/TH9VCN6UkyQ?t=5166)
[^concurrency]: concurrency is huge. It's going to get huger for games. [_{{ ideas1_2014 }}_ {{ external_link }}](https://youtu.be/TH9VCN6UkyQ?t=4810)
[^directive-assert]: a flavor of `#run`, allowing arbitrary code at compile time to run as part of an assertion check. [_{{ demo_2014-10-31 }}_ {{ external_link }}](https://youtu.be/UTqZNujQOlA?t=3078)
[^directive-check-call]: `#checkcall` invokes arbitrary user-provided checking methods at compile time [](https://youtu.be/UTqZNujQOlA?t=2362)
[^directive-run]: run directive to execute code at compile time. [_{{ demo_2014-10-31 }}_ {{ external_link }}](https://youtu.be/UTqZNujQOlA?t=2701)
[^factorability1]: we want to avoid meaningless syntactic changes that create drudge work as I gradually factor my program from its beginning state into its final state. [_{{ ideas2_2014 }}_ {{ external_link }}](https://youtu.be/5Nc68IdNKdg?t=1837)
[^factorability2]: we have this whole sequence of stages we can lift a block of code on. [_{{ ideas2_2014 }}_ {{ external_link }}](https://youtu.be/5Nc68IdNKdg?t=3549)
[^ffi-printf]: a straight-forward foreign function interface allows things like calling out to C for `printf`. [_{{ demo_2014-10-31 }}_ {{ external_link }}](https://youtu.be/UTqZNujQOlA?t=1599)
[^file-path-name-line]: current filepath, filename, and code line are available as directives at compile time. [_{{ demo_2014-10-31 }}_ {{ external_link }}](https://youtu.be/UTqZNujQOlA?t=3876)
[^introspection]: introspection / reflection. [_{{ reboot_2017 }}_ {{ external_link }}](https://youtu.be/De0Am_QcZiQ?t=1945)
[^memory-memory-memory]: it's about memory and memory only. [_{{ ideas1_2014 }}_ {{ external_link }}](https://youtu.be/TH9VCN6UkyQ?t=2296)
[^no-exceptions]: exceptions are silly. [_{{ ideas1_2014 }}_ {{ external_link }}](https://youtu.be/TH9VCN6UkyQ?t=2379)
[^no-garbage-collection]: you can't build a sufficiently low-level system with sufficiently high performance characteristics in a garbage collected language. [_{{ ideas1_2014 }}_ {{ external_link }}](https://youtu.be/TH9VCN6UkyQ?t=407)
[^no-header-files]: no god damn header files. [_{{ ideas1_2014 }}_ {{ external_link }}](https://youtu.be/TH9VCN6UkyQ?t=4484)
[^no-preprocessor]: directives are part of the language; there is no preprocessor system [_{{ demo_2014-10-31 }}_ {{ external_link }}](https://youtu.be/UTqZNujQOlA?t=4058)
[^no-smart-pointers]: we're not afraid of pointers in the game industry. we need to use them. [_{{ ideas1_2014 }}_ {{ external_link }}](https://youtu.be/TH9VCN6UkyQ?t=2718)
[^no-template-metaprogamming]: xxx. [_{{ ideas1_2014 }}_ {{ external_link }}](https://youtu.be/TH9VCN6UkyQ?t=2379)
[^owned-pointer]: notation to indicate memory ownership. [_{{ ideas1_2014 }}_ {{ external_link }}](https://youtu.be/TH9VCN6UkyQ?t=2979)
[^permissive-license]: A language we adopt should have a permissive license. [_{{ ideas1_2014 }}_ {{ external_link }}](https://youtu.be/TH9VCN6UkyQ?t=5195)
[^run-in-compiler]: full compile-time execution. [_{{ reboot_2017 }}_ {{ external_link }}](https://youtu.be/De0Am_QcZiQ?t=1526)
