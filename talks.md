---
layout: page
---
 <head>
 <link rel="stylesheet" href="/assets/css/main.css">
<script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://madaan.github.io/assets/js/common.js"></script>
 </head>
 <article class="post-content publications clearfix">

<h2 id="publications">Recent talks/tutorials</h2>
<ol class="bibliography">
{% for pub in site.data.talks %}
<li> <span class="title">{{pub.title}}, {{pub.venue}}, {{pub.year}} [<a href="{{pub.talk}}">slides</a>]</span>
 </li>
 {% endfor %}
 </ol>

</article>
