---
layout: page
title: Basic premises
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


---

## footnotes

{% capture external_link %}{% include icon.liquid id='external-link' %}{% endcapture %}

[^compiler-speed]: The target rate after we do those speed-ups is about a million lines a second. [_#Gamelab2018 - Jon Blow's Design decisions on creating Jai, a new language for game programmers_ {{ external_link }}](https://youtu.be/uZgbKrDEzAs?t=1522)
[^cpp-too-complex]: I like C++ now [September 14, 2014] more than before, but also feel it's reached critical complexity, and its ship is done sailing. [_Ideas about a new programming language for games_ {{ external_link }}](https://youtu.be/TH9VCN6UkyQ?t=124)
[^cpp-overreaches]: C++ provides all these facilities that overreach they try to get too far and get heavy and collapse in. [_Ideas about a new programming language for games_ {{ external_link }}](https://youtu.be/TH9VCN6UkyQ?t=1739)
[^efficiency]: 50% is possible; 80% may be possible. [_#Gamelab2018 - Jon Blow's Design decisions on creating Jai, a new language for game programmers_ {{ external_link }}](https://youtu.be/uZgbKrDEzAs?t=1028)
[^improvements]: I think in pure process improvements, we could get at least 20%. [_Ideas about a new programming language for games_ {{ external_link }}](https://youtu.be/TH9VCN6UkyQ?t=1026)
[^joy-of-programming]: There's something that's worth far more than 20%, and that's the joy of programming. [_Ideas about a new programming language for games_ {{ external_link }}](https://youtu.be/TH9VCN6UkyQ?t=1041)
[^make-software-fast-again]: Software today feels slower and slower, despite significant continuous hardware advances for the last several decades ([_"andy giveth, and bill taketh away"_ {{ external_link }}](https://en.wikipedia.org/wiki/Andy_and_Bill%27s_law)). But now, computers are not getting much faster.. will software stop getting slower? "[We] need to dislodge ourselves [from the growth curve plateau] by...getting rid of some of the bottlenecks we have. So if our tools are constraining our productivity, and we do a good job of revising those tools, this might buy us more slope on one of these curves" [_Reboot Develop 2017 - Jonathan Blow, Thekla Inc. / Making Game Programming Less Terrible_ {{ external_link }}](https://youtu.be/De0Am_QcZiQ?t=906)
[^principles]: What should we care about? Quality of life of the programmer...simplicity...expressive power. [_#Gamelab2018 - Jon Blow's Design decisions on creating Jai, a new language for game programmers_ {{ external_link }}](https://youtu.be/uZgbKrDEzAs?t=854)
[^simpler-than-AAA-game]: I think a compiler is much easier than a AAA game. [_Ideas about a new programming language for games_ {{ external_link }}](https://youtu.be/TH9VCN6UkyQ?t=782)
[^simpler-than-cpp]: If we design a simpler language than something like C++, it's going to be a lot less work to make it happen. [_Ideas about a new programming language for games_ {{ external_link }}](https://youtu.be/TH9VCN6UkyQ?t=926)
[^terrible-cpp]: C++ is a really terrible, terrible language, so it would really help us to get off it as quickly as we can. [_#Gamelab2018 - Jon Blow's Design decisions on creating Jai, a new language for game programmers_ {{ external_link }}](https://youtu.be/uZgbKrDEzAs?t=24)
[^time-savings]: Imagine that every single programmer in the entire industry saved 10% of their time.[ _#Gamelab2018 - Jon Blow's Design decisions on creating Jai, a new language for game programmers_ {{ external_link }}](https://youtu.be/uZgbKrDEzAs?t=1015)
[^why-new-language]: Other languages buy into assumptions that prevent you from writing programs that run efficiently, are clear, and are brief, concise, and easy to understand. [_#Gamelab2018 - Jon Blow's Design decisions on creating Jai, a new language for game programmers_ {{ external_link }}](https://youtu.be/uZgbKrDEzAs?t=1157)
[^why-now]: Another reason why now is better than ever before is we have this thing called LLVM, which is a compiler system that over the past several years has gotten really robust and into common use. [_Ideas about a new programming language for games_ {{ external_link }}](https://youtu.be/TH9VCN6UkyQ?t=845)
[^why-not-d]: It does feel like a better, cleaner, smarter C++, but I don't really want C++ ultimately. [_Ideas about a new programming language for games_ {{ external_link }}](https://youtu.be/TH9VCN6UkyQ?t=514)
[^why-not-go]: Go does a lot right! But, GC'd = non-starter, and [the] concurrency model probably won't work for us. [_Ideas about a new programming language for games_ {{ external_link }}](https://youtu.be/TH9VCN6UkyQ?t=378)
[^why-not-rust]: Rust is very, very concerned about never letting you do unsafe things to the point of being a big idea language. And because it's a big idea language, it creates a lot of friction. [_Ideas about a new programming language for games_ {{ external_link }}](https://youtu.be/TH9VCN6UkyQ?t=600)
[^working-persons-language]: If you're going to go to game developers and say, "You should switch to a new language.", it can't be a big agenda language. It has to be more like a working person's language that understands the kind of stuff we do every day. [_Ideas about a new programming language for games_ {{ external_link }}](https://youtu.be/TH9VCN6UkyQ?t=292)


[d]: https://dlang.org/ "The D programming language"
[go]: https://golang.org/ "The Go Programming Language"
[llvm]: https://llvm.org/ "The LLVM Compiler Infrastructure Project"
[rust]: https://www.rust-lang.org/en-US/ "The Rust programming language"
