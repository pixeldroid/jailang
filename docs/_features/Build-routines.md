---
layout: page
title: Build routines

footnotes:
 -
    label: build-example
    video: demo_20141210
    time:  251
    text:  this `#run` directive says that at compile time when this run directive is hit, we're going to run this function and anything else that needs to get compiled to make that function work.
 -
    label: build-options
    video: demo_20141210
    time:  1759
    text:  #FIXME: provide text
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
    label: code-modification
    video: reboot_2017
    time:  2571
    text:  you can modify compile-time data structures and resubmit them.
 -
    label: compiler-does-everything
    video: ideas_20140919
    time:  5166
    text:  you shouldn't need wacky different tools on every operating system. you should need the compiler and your source code and that's all.

---


# {{ page.title }}


The Jai compiler will handle all the aspects of building an executable: compiling (in parallel), linking, etc.[^compiler-does-everything]
{:.larger.text}

The compiler provides an api to work with build configuration options.[^build-routine]&nbsp;[^build-options]&nbsp;[^build-options-struct]

For example:[^build-example]

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

You can write programs that modify or generate code during compilation to use in a later part of the compilation process.[^code-modification]

```cpp
value_table: [] float = #run generate_expensive_values(); // #run invokes the compile time execution
```


{% include footnotes.liquid references=page.footnotes %}
