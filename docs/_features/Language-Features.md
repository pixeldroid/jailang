---
layout: page
title: Language Features

footnotes:
 -
    label: ast-access
    video: reboot_2017
    time:  2551
    text:  data structures for all the code in the program.
 -
    label: build-example
    video: demo_20141210
    time:  251
    text:  this run directive says that at compile time when this run directive is hit, we're going to run this function and anything else that needs to get compiled to make that function work.
 -
    label: build-options
    video: demo_20141210
    time:  1759
    text:  .
 -
    label: build-options-struct
    video: reboot_2017
    time:  1759
    text:  you have a struct that defines the build options, and you apply those build options to the compiler workspace.
 -
    label: build-routine
    video: demo_20141031
    time:  3859
    text:  using the `#run` directive to run a build routine at compile time.
 -
    label: capture-for-any-block
    video: ideas_20140926
    time:  3344
    text:  i can just apply a capture to any block.
 -
    label: code-maturation
    video: ideas_20140926
    time:  2171
    text:  your programming language should be designed to support the transition from humble beginnings to final product.
 -
    label: code-modification
    video: reboot_2017
    time:  2571
    text:  you can modify compile-time data structures and resubmit them.
 -
    label: compiler-does-everything
    video: ideas_20140919
    time:  5166
    text:  you shouldn't need wacky different tools on every operating system. you should need the compiler and your source code and that's all.
 -
    label: concurrency
    video: ideas_20140919
    time:  4810
    text:  concurrency is huge. It's going to get huger for games.
 -
    label: directive-assert
    video: demo_20141031
    time:  3078
    text:  a flavor of `#run`, allowing arbitrary code at compile time to run as part of an assertion check.
 -
    label: directive-check-call
    video: demo_20141031
    time:  2362
    text:  |-
        `#checkcall` invokes arbitrary user-provided checking methods at compile time.
 -
    label: directive-filepath
    video: demo_20141210
    time:  275
    text:  a directive that tells you what the path is of the current file that is being compiled.
 -
    label: directive-run
    video: demo_20141031
    time:  2701
    text:  |-
        `#run` directive to execute code at compile time.
 -
    label: directive-compile-time
    video: demo_20141031
    time:  5443
    text:  boolean indication of running at compile time.
 -
    label: factorability-drudge
    video: ideas_20140926
    time:  1837
    text:  we want to avoid meaningless syntactic changes that create drudge work as I gradually factor my program from its beginning state into its final state.
 -
    label: factorability-lift
    video: ideas_20140926
    time:  3549
    text:  we have this whole sequence of stages we can lift a block of code on.
 -
    label: ffi-printf
    video: demo_20141031
    time:  1599
    text:  a straight-forward foreign function interface allows things like calling out to C for `printf`.
 -
    label: file-path-name-line
    video: demo_20141031
    time:  3876
    text:  current filepath, filename, and code line are available as directives at compile time.
 -
    label: introspection
    video: reboot_2017
    time:  1945
    text:  introspection / reflection.
 -
    label: memory-memory-memory
    video: ideas_20140919
    time:  2296
    text:  it's about memory and memory only.
 -
    label: no-exceptions
    video: ideas_20140919
    time:  2379
    text:  exceptions are silly at best, and horribly damaging at worst.
 -
    label: no-garbage-collection
    video: ideas_20140919
    time:  407
    text:  you can't build a sufficiently low-level system with sufficiently high performance characteristics in a garbage collected language.
 -
    label: no-header-files
    video: ideas_20140919
    time:  4484
    text:  no god damn header files.
 -
    label: no-preprocessor
    video: demo_20141031
    time:  4058
    text:  directives are part of the language; there is no preprocessor system.
 -
    label: no-smart-pointers
    video: ideas_20140919
    time:  2718
    text:  we're not afraid of pointers in the game industry. we need to use them.
 -
    label: no-template-metaprogamming
    text:  'FIXME: find this video reference'
 -
    label: owned-pointer
    video: ideas_20140919
    time:  2979
    text:  notation to indicate memory ownership.
 -
    label: permissive-license
    video: ideas_20140919
    time:  5195
    text:  a language we adopt should have a permissive license.
 -
    label: run-in-compiler
    video: reboot_2017
    time:  1526
    text:  full compile-time execution.

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
- `#filepath` - path to currently compiling source file [^directive-filepath] [^file-path-name-line]
- `#import "Library";` - bring a library into scope
- `#inline <function def>` - inline `<function_def>` wherever it is called
- `#line` - line number of current statement [^file-path-name-line]
- `#load "file.jai";` - bring a source code file into scope
- `#no_inline <function def>` - do not inline this function definition
- `#run <code>` - execute `<code>` at compile time (not run time) [^directive-run]
- `#running_at_compile_time` - boolean; `true` if execution is occuring during compile time [^directive-compile-time]


## Full compile-time code execution [^run-in-compiler]

There are no limitations, the compiler knows how to run the intermediate representation of the programming language.

This lets you simplify your project:

- no make, build, or properties files in other arbitrary languages; everything is written in the same main language.
- cross-platform. exactly the same code works on every platform.

### Build routines

The Jai compiler will handle all the aspects of building an executable: compiling (in parallel), linking, etc. [^compiler-does-everything]

The compiler provides an api to work with build configuration options. [^build-routine] [^build-options-struct]

For example:

```cpp
build := () {
    printf("In build (at compile time).\n");

    build_options.optimization_level = Optimization_Level.DEBUG;
    build_options.emit_line_directives = false;
    build_options.executable_name = "traveller.jai";

    update_build_options();

    printf("build_options.executable_name = %s\n", build_options.executable_name);
    printf("build_options.output_path = %s\n", build_options.output_path);

    printf("Building from file %s, line %d.\n", #file, #line);
    printf("filepath is: %s\n", #filepath);

    set_build_file_path(#filepath);

    add_build_file("misc.jai");
    add_build_file("invaders.jai");
    add_build_file("checks.jai");
    add_build_file("levels.jai");
}

#run build();
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

Scalars and functions do not require meaningless syntax changes when changing scope, capturing scope [^capture-for-any-block], or switching between being named or unnamed. [^factorability-drudge] [^factorability-lift]

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


{% include footnotes.liquid references=page.footnotes %}
