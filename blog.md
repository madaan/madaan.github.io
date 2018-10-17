---
layout: page
permalink: /blog/
---

 <head>
 <link rel="stylesheet" href="/assets/css/main.css">
<script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="/assets/js/common.js"></script>
 </head>

<div class="posts">
  {% for post in site.posts %}
    {%if post.blog != null %}
    <article class="post">

      <h2><a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h2>

      <div class="entry">
      </div>

      <a href="{{ site.baseurl }}{{ post.url }}" class="read-more">Read More</a>
    </article>
    {% endif %}
  {% endfor %}
</div>
