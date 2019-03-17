---
layout: page
---

{% assign page_url_pieces = page.url | split: '/' %}
{% assign module_root = page_url_pieces[1] | prepend: '/' %}
{% capture module_url %}{{ site.baseurl }}{{ module_root }}{% endcapture %}
{% capture page_module_url %}{{ module_url }}/{{ page.module | split: '.' | join: '/' }}{% endcapture %}

<div class="ui basic segment">
<h1 class="ui dividing header">{{ page.module }}</h1>
{% if page.submodules %}
<div class="ui horizontal divided list">
  {% assign list = page.submodules %}
  {% for name in list %}
  <div class="item"><a class="header" href="{{ page_module_url }}/{{ name }}/#{{ module_root }}/">{{ name }}</a></div>
  {% endfor %}
</div>
{% endif %}
</div>

{% assign types = "constants|enums|procedures|structs" | split: '|'  %}

{% for t in types %}
{% if page[t] %}
<div class="ui basic segment"><span class="anchor" id="{{ t }}">&nbsp;</span>
<h2 class="ui dividing header">{{ t | capitalize }}</h2>

<div class="ui list">
  {% assign list = page[t] %}
  {% for item in list %}
    {% capture content %}
    <a class="header" href="{{ page_module_url }}/{{ item.name }}/#{{ module_root }}/">{{ item.name }}</a>
    <div class="description">
      {{ item.description | newline_to_br | split: '<br />' | first | rstrip | markdownify | remove: '<p>' | remove: '</p>' }}{% if item.description %}<br/>{% endif %}
      <span class="smaller text"><i>Declared in:</i> {{ item.declaration }}</span>
    </div>
    {% endcapture %}
  <div class="item">{{ content }}</div>
  {% endfor %}
</div>
</div>
{% endif %}
{% endfor %}