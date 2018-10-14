---
layout: page
---
 <head>
 <link rel="stylesheet" href="/assets/css/main.css">
<script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://madaan.github.io/assets/js/common.js"></script>
 </head>
 <article class="post-content publications clearfix">

<h2 id="publications">Conference Publications</h2>
<ol class="bibliography">
{% for pub in site.data.publications %}
<li>
  <abbr>[<a href="{{pub.org-url}}" target="_blank">{{pub.org}}</a>]</abbr>
  <h3 class="year">{{pub.year}}</h3>
  <span class="title">{{pub.title}}</span>
  <span class="author">{{pub.authors}}</span>
  <span class="periodical"><em>{{pub.conference}}</em></span>
  <span class="links">
    [<a class="abstract hidden">abstract</a>]
    [<a href="{{pub.pdf}}">pdf</a>]
    {% if pub.talk %}
    [<a href="{{pub.talk}}">talk</a>]
    {% endif %}
    [<a href="{{pub.publication}}">publication</a>]
  </span>
  <span class="abstract hidden">
    <p>{{pub.abstract}}</p>
  </span>
 </li>
 {% endfor %}
 </ol>

<h2 id="publications">Patents</h2>
<ol class="bibliography">
{% for patent in site.data.patents %}
<li>
  <h3 class="year">{{patent.year}}</h3>
  <span class="title">{{patent.title}}</span>
  <span class="author">{{patent.number}}</span>
  <span class="author">{{patent.authors}}</span>
  <span class="periodical"><em>{{patent.org}}</em></span>
  <span class="links">
    [<a class="abstract hidden">abstract</a>]
    [<a href="{{patent.url}}">link</a>]
  </span>
  <span class="abstract hidden">
    <p>{{patent.abstract}}</p>
  </span>
 </li>
 {% endfor %}
 </ol>

</article>
