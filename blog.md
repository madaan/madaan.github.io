---
layout: page
title: Blog
permalink: /blog/
---

<div class="posts">
  {% for post in site.posts %}
    {% if post.blog != null %}
    <article class="post">
      <h2><a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h2>
      <div class="date">{{ post.date | date: "%B %e, %Y" }}</div>
    </article>
    {% endif %}
  {% endfor %}
</div>
