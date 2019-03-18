---
layout: page
---

{% assign parent = page.path | split: '.' | first %}
{% assign child_depth = page.path | split:'/' | size | minus:1 %}

<h1 id="heading" class="ui dividing header">{{ page.title }}</h1>

<div class="ui divided link items">
{% for doc in site.reference %}
  {% assign listable = true %}
  {% assign child = doc.path | split: '.' | first %}
  {% if parent == child %}{% continue %}{%endif%}
  {% assign prefix = child | truncate: parent.size, '' %}
  {% unless prefix == parent %}{% assign listable = false %}{% endunless %}
  {% if listable %}
  <a class="item" href="{{ site.baseurl }}{{ doc.url }}#/{{ doc.collection | downcase }}/">
    <div class="content">
      <div class="medium header">{{ doc.title }}</div>
      <div class="description">{{ doc.description | newline_to_br | split: '<br />' | first | rstrip | markdownify | remove: '<p>' | remove: '</p>' }}</div>
    </div>
  </a>
  {% endif %}
{% endfor %}
</div>