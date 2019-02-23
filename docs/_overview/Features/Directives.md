---
layout: page
title: Directives

footnotes:
 -
    label: no-preprocessor
    video: demo_20141031
    time:  4058
    text:  directives are part of the language; there is no preprocessor system.

---


# {{ page.title }}

There is no preprocessor for Jai; directives are just part of the language. [^no-preprocessor]
{:.larger.text}

See the following entries in the [reference](#/reference) for more details:

{% assign collection = site.collections | where:'title','Reference' | first %}
{% for d in collection.docs %}
{% unless d.layout == 'directive' %}{% continue %}{% endunless%}
- [{{ d.title }}]({{site.baseurl}}{{d.url}}#/reference) - {{ d.description }}
{% endfor %}

{% include footnotes.liquid references=page.footnotes %}
