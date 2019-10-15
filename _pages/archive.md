---
layout: archive
permalink: /archive/
title: Archives
---

{% for post in site.posts %}
    {% include archive-single.html type=page.entries_layout %}
{% endfor %}