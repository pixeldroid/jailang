---
layout: page
title: Memory management

footnotes:
 -
    label: memory-memory-memory
    video: ideas_20140919
    time:  2296
    text:  it's about memory and memory only.
 -
    label: owned-pointer
    video: ideas_20140919
    time:  2979
    text:  notation to indicate memory ownership.

---


# {{ page.title }}

The language design focuses on making it easier to manage memory. [^memory-memory-memory]
{:.larger.text}

Jai provides the owned pointer notation (`*!`)[^owned-pointer] to indicate that the object pointed to is owned by the member's struct and should be freed when the struct is freed. This can obviate the need for constructors and destructors.

```cpp
struct Mesh {
    Vector3 *! positions;
    int *! indices;
};
```


{% include footnotes.liquid references=page.footnotes %}
