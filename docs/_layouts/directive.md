---
layout: page

---

{% capture md %}
# `{{ page.title }}`

## Invocation
{% assign references = "" | split: "" %}
{% for f in page.footnotes %}
{% capture ref %}[^{{ f.label }}]{% endcapture %}
{% assign references = references | push: ref %}
{% endfor %}
{{ page.invocation }} - {{ page.description }}{{ references | join: " " }}

{% if page.see_also.size > 0 %}
### See also:
{% for ref in page.see_also %}
{% capture link %}[{{ref.text}}]({{site.baseurl}}{{ref.url}}){% endcapture %}
- {{ link }}
{% endfor %}
{% endif %}


{% include footnotes.liquid references=page.footnotes %}
{% endcapture %}
{{ md | markdownify }}
