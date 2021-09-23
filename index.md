---
my_number: 5
layout: default
title: Fő oldal
---

<h2>Bejegyzések</h2>
<ul>
  {% for post in site.posts %}
    <li>
      <h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
      {{ post.excerpt }}
    </li>
  {% endfor %}
</ul>
