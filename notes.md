---
layout: page
permalink: /notes/
---

<div class="posts">
  {% for post in site.posts %}
    {%if post.scribble != null %}
    <article class="post">

      <h2><a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h2>

      <div class="entry">
      </div>

      <a href="{{ site.baseurl }}{{ post.url }}" class="read-more">Read More</a>
    </article>
    {% endif %}
  {% endfor %}
</div>
