---
layout: page
title: Anti-features

footnotes:
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

---


# {{ page.title }}

Jai is designed to _**not**_ include the following:
{:.larger.text}

- header files [^no-header-files]
- garbage collection [^no-garbage-collection]
- exceptions [^no-exceptions]  (see Multiple return values instead)
- preprocessor [^no-preprocessor]  (directives are part of the language)
- smart pointers [^no-smart-pointers]  (see [Memory management] instead)
- template metaprogramming [^no-template-metaprogamming]  (see Polymorphism instead)
{:.larger.text}


{% include footnotes.liquid references=page.footnotes %}

[Memory management]: {{site.baseurl}}/features/Memory-management/#/features/ "The language design focuses on making it easier to manage memory"
