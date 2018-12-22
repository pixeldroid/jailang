---
layout: page
title: Basic premises

footnotes:
 -
    label: compiler-speed
    video: gamelab_2018
    time:  1522
    text:  The target rate after we do those speed-ups is about a million lines a second.
 -
    label: cpp-too-complex
    video: ideas_20140919
    time:  124
    text:  I like C++ now more than before, but also feel it's reached critical complexity, and its ship is done sailing.
 -
    label: cpp-overreaches
    video: ideas_20140919
    time:  1739
    text:  C++ provides all these facilities that overreach they try to get too far and get heavy and collapse in.
 -
    label: efficiency
    video: gamelab_2018
    time:  1028
    text:  50% is possible; 80% may be possible.
 -
    label: improvements
    video: ideas_20140919
    time:  1026
    text:  I think in pure process improvements, we could get at least 20%.
 -
    label: joy-of-programming
    video: ideas_20140919
    time:  1041
    text:  There's something that's worth far more than 20%, and that's the joy of programming.
 -
    label: make-software-fast-again
    video: reboot_2017
    time:  906
    text:  |-
        Software today feels slower and slower, despite significant continuous hardware advances for the last several decades ([_"andy giveth, and bill taketh away"_](https://en.wikipedia.org/wiki/Andy_and_Bill%27s_law)). But now, computers are not getting much faster.. will software stop getting slower? [We] need to dislodge ourselves [from the growth curve plateau] by...getting rid of some of the bottlenecks we have. So if our tools are constraining our productivity, and we do a good job of revising those tools, this might buy us more slope on one of these curves.
 -
    label: principles
    video: gamelab_2018
    time:  854
    text:  What should we care about? Quality of life of the programmer...simplicity...expressive power.
 -
    label: simpler-than-AAA-game
    video: ideas_20140919
    time:  782
    text:  I think a compiler is much easier than a AAA game.
 -
    label: simpler-than-cpp
    video: ideas_20140919
    time:  926
    text:  If we design a simpler language than something like C++, it's going to be a lot less work to make it happen.
 -
    label: terrible-cpp
    video: gamelab_2018
    time:  24
    text:  C++ is a really terrible, terrible language, so it would really help us to get off it as quickly as we can.
 -
    label: time-savings
    video: gamelab_2018
    time:  1015
    text:  Imagine that every single programmer in the entire industry saved 10% of their time.
 -
    label: why-new-language
    video: gamelab_2018
    time:  1157
    text:  Other languages buy into assumptions that prevent you from writing programs that run efficiently, are clear, and are brief, concise, and easy to understand.
 -
    label: why-now
    video: ideas_20140919
    time:  845
    text:  Another reason why now is better than ever before is we have this thing called LLVM, which is a compiler system that over the past several years has gotten really robust and into common use.
 -
    label: why-not-d
    video: ideas_20140919
    time:  514
    text:  |-
        \[D\] does feel like a better, cleaner, smarter C++, but I don't really want C++ ultimately.
 -
    label: why-not-go
    video: ideas_20140919
    time:  378
    text:  Go does a lot right! But, GC'd = non-starter, and [the] concurrency model probably won't work for us.
 -
    label: why-not-rust
    video: ideas_20140919
    time:  600
    text:  Rust is very, very concerned about never letting you do unsafe things to the point of being a big idea language. And because it's a big idea language, it creates a lot of friction.
 -
    label: working-persons-language
    video: ideas_20140919
    time:  292
    text:  If you're going to go to game developers and say, "You should switch to a new language.", it can't be a big agenda language. It has to be more like a working person's language that understands the kind of stuff we do every day.

---


# {{ page.title }}

**_the goal &raquo;_** a new language&mdash;to replace the current defacto standard of C++&mdash;that is not a &lsquo;big agenda&rsquo; language, but a working person's language. [^working-persons-language]
{:.larger.text}

- TOC
{::options toc_levels="2,3" /}
{:toc}

## Guiding principles [^principles]

- Quality of life
- Simplicity
- Expressive Power


## Considered alternatives

- **[go][go]** - generally good, but GC'd, and concurrency model is too restrictive [^why-not-go]
- **[D][d]** - buys too much into C++'s ideas [^why-not-d]
- **[rust][rust]** - cares too much about safety, probably high friction [^why-not-rust]


## Feasability

Making a AAA game is probably more complicated than making a compiler [^simpler-than-AAA-game], and it doesn't make programming better for everyone. Also, because this language will be simpler than C++, it will be less work to develop. [^simpler-than-cpp]


## Why a new language? Why now?

- C++ has reached critical complexity [^cpp-too-complex] [^terrible-cpp], and other new languages prevent you from being efficient [^why-new-language]
- [LLVM] exists and takes care of the hard parts of compiler building: optimizing and generating competent machine code for multiple target platforms [^why-now]
- Moore's law is not holding up anymore, so we need a way to make software faster instead of relying on better hardware [^make-software-fast-again]


## What's in it for the game programming community?

- if using the language is even 10% simpler, the impact to the industry will be large [^time-savings]
- efficiency improvements of 20% [^improvements] and more [^efficiency] are expected, including compiling 1,000,000 lines of code per second [^compiler-speed]
- most importantly, increasing the joy of programming will actually make programmer's lives better [^joy-of-programming]


{% include footnotes.liquid references=page.footnotes %}


[d]: https://dlang.org/ "The D programming language"
[go]: https://golang.org/ "The Go Programming Language"
[llvm]: https://llvm.org/ "The LLVM Compiler Infrastructure Project"
[rust]: https://www.rust-lang.org/en-US/ "The Rust programming language"
