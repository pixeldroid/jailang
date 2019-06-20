---
layout: page
title: SOA

footnotes:
 -
    label: class-packing
    video: demo_20150121
    time:  338
    text:  |-
      This packing together of things in memory is part of what makes your game slow, because it has some consequences.
 -
    label: soa-goal
    video: demo_20150121
    time:  578
    text:  |-
      Can we be very fast about memory behavior, about playing well with the cache and very organized about how our data is laid out, and still have high levels of expressivity in our code?
 -
    label: retain-inheritance-composition
    video: demo_20150121
    time:  655
    text:  |-
      Expressing some kind of is-a relationship or has-a relationship
 -
    label: retain-upcasting
    video: demo_20150121
    time:  822
    text:  |-
      C++ lets you call functions with the parameter types of the base class.
 -
    label: retain-downcasting
    video: demo_20150121
    time:  862
    text:  |-
      Virtual functions are about going from the base class up to the derived class.
 -
    label: retain-implicit-this
    video: demo_20150121
    time:  902
    text:  |-
      Some value [in ..] having an implicit this in member functions and you don't have to write extra code all the time.
 -
    label: data-oriented-references
    video: demo_20150121
    time:  968
    text:  |-
      Here are some references in order of approachability about how to structure your program to behave well with respect to memory.
 -
    label: cpus-want-SOA
    video: demo_20150121
    time:  2870
    text:  |-
      A language like C++ basically assumes your data is going to be in a thing called Array of Structures (AOS): [..] When you're trying to put things in memory, they go in an array, and each structure in the array is contiguous, so all the members are laid out in order. But most CPUs don't really want data that way. Most CPUs want things laid out as Structures of Arrays (SOA).
 -
    label: AOS-SOA
    url: https://en.wikipedia.org/wiki/AOS_and_SOA
    text:  |-
      In computing, Array of Structures (AoS), Structure of Arrays (SoA) and Array of Structures of Arrays (AoSoA) refer to contrasting ways to arrange a sequence of records in memory, with regard to interleaving, and are of interest in SIMD and SIMT programming.
 -
    label: jai-SOA
    video: demo_20150121
    time:  2927
    text:  |-
      If a language is going to be data-oriented, then it should—for example—be easy to put your data in SOA format.
 -
    label: SOA-faster
    video: demo_20150121
    time:  3515
    text:  |-
      The reason that's faster is because now, in my Entity array, all these flags are going to be next to each other [..] and if you just want to deal with flags, that flags-flags-flags for a long time in memory lets you be very fast.
 -
    label: jai-AOS
    video: demo_20150121
    time:  3679
    text:  |-
      I can make [a struct] that's SOA by default, but if I want an array of them that's AOS (for some reason) I can do that.

---

# {{ page.title }} (Structs of Arrays)

## Goal

The desire is to provide a more data-oriented way to do game object systems without losing language expressivity.

This means retaining the following functionality:
* is-a / has-a relationships (code re-use via inheritance and composition) [^retain-inheritance-composition]
* calling functions with parameter types of the base class (upcasting) [^retain-upcasting]
* organizing functions into known slots on the base class (downcasting) [^retain-downcasting]
* convenience of an implicit `this ->` in member functions [^retain-implicit-this]

While being more "data-oriented"&mdash;having a clear idea of how you want things to live in memory, in accordance with the principles and guidance outlined in the following references: [^data-oriented-references]
* "Data-Oriented Design", Noel Llopis, <http://gamesfromwithin.com/data-oriented-design>
* "Chandler Carruth: Efficiency with Algorithms, Performance with Data Structures." YouTube, uploaded by CppCon, Oct 21, 2014, <https://www.youtube.com/watch?v=fHNmRkzxHWs>
* "Mike Acton: Data Oriented Design in C++." YouTube, uploaded by CppCon, Mar 24, 2017, <https://www.youtube.com/watch?v=rX0ItVEVjHc>


## Problem

In C++, when expressing an is-a / has-a relationship, the following is a typical simple example for organizing game objects:

```cpp
struct Entity {
    Vector3 position;
    Quaternion orientation;

    unsigned int flags;

    virtual void update() {}
};

struct Door : public Entity {
    float openness_current;
    float openness_target;

    void update() override;
};

struct Human : public Entity {
    char *name;

    void update() override;
}
```

But this design conceit has introduced problems that grow worse with scale: [^class-packing]

* All classes are different sizes
* Entities can't be allocated contiguously
* Cache misses occur

Jai provides the `using` keyword to allow memory-smart composition. [^keyword-using]

And Jai provides the `SOA` keyword to organize data into CPU-friendlier Structures of Arrays (SOA): [^cpus-want-SOA] [^AOS-SOA] [^jai-SOA] [^SOA-faster]

{% include collapsible_example.liquid file='code/print_floats_in_memory.jai' syntax='cpp' %}

{% include collapsible_example.liquid file='code/soa_entity_test.jai' syntax='cpp' %}

The `AOS` keyword allows for declaration-specific overrides to retain Array of Structures style packing when the default has been set to Structures of Arrays. [^jai-AOS]


[^keyword-using]: See [Reference &gt; Keywords &gt; Using]({{site.baseurl}}/reference/Keywords/using/#/reference/)
{% include footnotes.liquid references=page.footnotes %}
