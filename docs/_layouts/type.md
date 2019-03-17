---
layout: page
---

{% assign page_url_pieces = page.url | split: '/' %}
{% assign module_root = page_url_pieces[1] | prepend: '/' %}

<h1 id="heading" class="ui dividing header">{{ page.name }}</h1>

<div class="ui list">
  <div class="item">
    {% include icon.liquid id='package' %}
    <div class="content"><a href="{{ site.baseurl }}{{ module_root }}/{{ page.module }}/#{{ module_root }}">{{ page.module }}</a></div>
  </div>
  <div class="item">
    {% include icon.liquid id='datatype' %}
    <div class="content">{{ page.type_attributes | join: ' ' }} {{ page.type }}</div>
  </div>
  {% if page.using %}
  <div class="item">
    {% include icon.liquid id='composition' %}
    <div class="content">
      <div class="ui breadcrumb">
        <span class="section active">{{ page.name }}</span>
        {% if page.using and page.using.size > 0 %}{% include icon.liquid id='chevron-left' class='divider' %}{% endif %}
        {% for subtype in page.using %}
        {% assign module = subtype.module | append: '.' | append: subtype.name %}
        {% include module_linker.liquid module=module html_class='section' base_url=site.baseurl module_root=module_root %}
        {% unless forloop.last %},&nbsp;{% endunless %}
        {% endfor %}
      </div>
    </div>
  </div>
  {% endif %}
  {% if page.descendants %}
  <div class="item">
    {% include icon.liquid id='flow-tree' %}
    <div class="content">
      {% assign content = '' %}
      {% for descendant in page.descendants %}
        {% assign module = descendant.module | append: '.' | append: descendant.name %}
        {% capture link %}{% include module_linker.liquid module=module html_class='section' base_url=site.baseurl module_root=module_root %}{% endcapture %}
        {% unless forloop.last %}
          {% assign link = link | append: ', ' %}
        {% endunless %}
        {% assign content = content | append: link | strip | append: '
      ' %}
      {% endfor %}
      {{ content | strip }}
    </div>
  </div>
  {% endif %}
</div>

<h3 id="description" class="ui header">{{ page.type | capitalize }} Description</h3>
{% capture description %}{{ page.description }}{% endcapture %}
{{ description | replace: '   ⇥', '⇥' | replace: '⇥', site.code_indent | markdownify }}
{% assign base_module = page.module | append: '.' | append: page.name %}
{% include see_also.liquid base_module=base_module tags=page.tags heading=3 module_root=module_root %}

{% capture newline %}
{% endcapture %}

{% assign attr = "signature|constructor|fields|procedures" | split: '|'  %}

<h2 id="listing" class="ui dividing header">Listing</h2>

{% for a in attr %}
{% if page[a] %}
<h3 id="listing-{{ a }}" class="ui tight header">{{ a | capitalize }}</h3>
{% assign list = page[a] %}
{% if a == 'constructor' or a =='signature' %}{% assign list = "" | split: "" | push: page[a] %}{% endif %}
{% if list.size > 0 %}
<table class="ui striped definition table"><tbody>
{% assign isFunc = false %}{% if a == 'constructor' or a == 'signature' or a == 'methods' %}{% assign isFunc = true %}{% endif %}
{% assign isCtor = false %}{% if a == 'constructor' %}{% assign isCtor = true %}{% endif %}
{% for item in list %}
  {% capture params %}{% include parameters.liquid params=item.parameters base_url=site.baseurl module_root=module_root %}{% endcapture %}
  {% assign d_tags = item.tags | where_exp:"t", "t.name == 'deprecated'" %}
  {% capture deprecated %}{% if d_tags.size > 0 %}<div class="ui horizontal orange label">deprecated {{ d_tags.first.value }}</div>{% endif %}{% endcapture %}
  {% capture static %}{% if item.attributes contains 'static' %}<div class="ui horizontal grey label">static</div>{% endif %}{% endcapture %}
  {% capture read_only %}{% if item.is_read_only %}<div class="ui horizontal label">read only</div>{% endif %}{% endcapture %}
  {% capture chainable %}{% if item.is_chainable %}<div class="ui horizontal label">chainable</div>{% endif %}{% endcapture %}
  {% capture signature %}<a href="#details-{{ item.name }}">{{ item.name }}</a><span class="normal text">{% if isFunc and params.size == 0 %}(){% else %}{{ params | rstrip }}{% endif %}{% if isCtor != true %}:{% if item.template_types %}{% include template_signature.liquid template_type=item.template_types base_url=site.baseurl module_root=module_root %}{% else %}{% include module_linker.liquid module=item.type base_url=site.baseurl module_root=module_root %}{% endif %}{% endif %}</span>{% endcapture %}
  {% assign d_lines = item.description | split: newline %}
  <tr><td{% if forloop.first %} class="collapsing"{% endif %}>{{ signature | rstrip }}</td><td>{{ deprecated }}{{ static }}{{ read_only }}{{ chainable }}{{ d_lines | first | markdownify | remove: '<p>' | remove: '</p>' | remove: '</p>' | rstrip }}</td></tr>
{% endfor %}
</tbody></table>
{% endif %}
{% endif %}
{% endfor %}


<h2 id="details" class="ui dividing header">Details</h2>

{% for a in attr %}
{% if page[a] %}
<h3 id="details-{{ a }}" class="ui tight header">{{ a | capitalize }}</h3>
{% assign list = page[a] %}
{% if a == 'constructor' or a == 'signature' %}{% assign list = "" | split: "" | push: page[a] %}{% endif %}
{% assign isFunc = false %}{% if a == 'constructor' or a == 'signature' or a == 'methods' %}{% assign isFunc = true %}{% endif %}
{% assign isCtor = false %}{% if a == 'constructor' %}{% assign isCtor = true %}{% endif %}
{% for item in list %}
  {% capture params %}{% include parameters.liquid params=item.parameters base_url=site.baseurl module_root=module_root %}{% endcapture %}
  {% assign d_tags = item.tags | where_exp:"t", "t.name == 'deprecated'" %}
  {% capture deprecated %}{% if d_tags.size > 0 %}<div class="ui horizontal orange label">deprecated {{ d_tags.first.value }}</div>{% endif %}{% endcapture %}
  {% capture static %}{% if item.attributes contains 'static' %}<div class="ui horizontal grey label">static</div>{% endif %}{% endcapture %}
  {% capture read_only %}{% if item.is_read_only %}<div class="ui horizontal label">read only</div>{% endif %}{% endcapture %}
  {% capture chainable %}{% if item.is_chainable %}<div class="ui horizontal label">chainable</div>{% endif %}{% endcapture %}
  {% capture return_val %}{% if item.template_types %}{% include template_signature.liquid template_type=item.template_types base_url=site.baseurl module_root=module_root %}{% else %}{% include module_linker.liquid module=item.type base_url=site.baseurl module_root=module_root %}{% endif %}{% endcapture %}
  {% capture signature %}{{ item.attributes | join: ' ' }} {% if isFunc %}function {% endif %}<strong>{{ item.name }}</strong>{% if isFunc and params.size == 0 %}(){% else %}{{ params | rstrip }}{% endif %}{% if isCtor != true %}:{{ return_val }}{% endif %}{% endcapture %}
  <div class="details">
  <h4 id="details-{{ item.name }}" class="ui very tight secondary header">{{ item.name }}{% if isFunc %}(){% endif %}{{ deprecated }}{{ static }}{{ read_only }}{{ chainable }}</h4>
  <p><code>{{ signature }}</code></p>
  {{ item.description | markdownify }}

  {% assign base_module = page.module | append: '.' | append: page.name %}
  {% include see_also.liquid base_module=base_module tags=item.tags heading=4 module_root=module_root %}

  {% assign r_tags = item.tags | where_exp:"t", "t.name == 'return'" %}
  {% assign has_return = false %}
  {% if r_tags.size > 0 %}{% assign has_return = true %}{% endif %}

  {% assign needs_table = false %}
  {% if isFunc and item.parameters %}{% assign needs_table = true %}{% endif %}
  {% if has_return %}{% assign needs_table = true %}{% endif %}

  {% if needs_table %}<table class="ui striped definition table"><tbody>
  {% for p in item.parameters %}
    {% capture p_sig %}{% include parameter_signature.liquid param=p base_url=include.base_url %}{% endcapture %}
    {% capture optional %}{% if p.default_value or p.is_var_args %}<div class="ui horizontal label">optional</div>&nbsp;{% endif %}{% endcapture %}
    <tr><td class="collapsing"><code>{{ p_sig | rstrip }}</code></td><td>{{ optional }}{% if p.description %}{{ p.description | markdownify | remove: '<p>' | remove: '</p>' }}{% endif %}</td></tr>
  {% endfor %}
  {% if has_return %}<tr><td class="collapsing"><div class="ui basic grey ribbon label">returns</div>{{ return_val }}</td><td>{{ r_tags.first.value | markdownify }}</td></tr>{% endif %}
  </tbody></table>{% endif %}
  </div>
{% endfor %}
{% endif %}
{% endfor %}


<div id="scroll-space">
  {% for n in (1..10) %}
  <p>&nbsp;</p>
  {% endfor %}
</div>