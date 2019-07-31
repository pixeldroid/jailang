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
    text:  'FIXME: find this video reference (https://www.youtube.com/watch?v=BwqeFrlSpuI)'

---


# {{ page.title }}

Jai is designed to _**not**_ include the following:
{:.larger.text}

- header files [^no-header-files]
- garbage collection [^no-garbage-collection]
- exceptions [^no-exceptions]  _(see [Default return values] instead)_{:.smaller.text}
- a preprocessor [^no-preprocessor]  _([directives] are part of the language)_{:.smaller.text}
- smart pointers [^no-smart-pointers]  _(see [Memory management] instead)_{:.smaller.text}
- template metaprogramming [^no-template-metaprogamming]  _(see [Polymorphic procedures] instead)_{:.smaller.text}
{:.larger.text}


{% include footnotes.liquid references=page.footnotes %}

[Default return values]: {{site.baseurl}}/overview/Features/Default-return-values/#/overview/ "Default return values can provide info to the caller without complicated event heirarchies"
[directives]: {{site.baseurl}}/overview/Features/Directives/#/overview/ "There is no preprocessor for Jai; directives are just part of the language"
[Memory management]: {{site.baseurl}}/overview/Features/Memory-management/#/overview/ "The language design focuses on making it easier to manage memory"
[Polymorphic procedures]: {{site.baseurl}}/overview/Features/Polymorphic-procedures/#/overview/ "Jai provides a simple, clean syntax for using type variables"
