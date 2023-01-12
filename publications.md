---
layout: page
---
 <head>
 <link rel="stylesheet" href="/assets/css/main.css">
<script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://madaan.github.io/assets/js/common.js"></script>
 </head>
 <article class="post-content publications clearfix">

<h2 id="publications">Peer-reviewed Publications</h2>

Please see <a href="https://scholar.google.com/citations?user=jW9ts2cAAAAJ&hl=en&oi=ao">Google Scholar</a> and <a href="https://www.semanticscholar.org/author/Aman-Madaan/21626987">Semantic Scholar</a> for an updated list of publications.

<ol class="bibliography">
{% for pub in site.data.publications %}
<li>
  <abbr><a href="{{pub.org-url}}" target="_blank">[{{pub.org}}]</a></abbr>
  <h3 class="year">{{pub.year}}</h3>
  <span class="title">{{pub.title}}</span>
  <span class="author">{{pub.authors}}</span>
  <span class="periodical"><em>{{pub.conference}}</em></span>
  <span class="links">
    [<a class="abstract hidden">abstract</a>]
    [<a href="{{pub.pdf}}">pdf</a>]

    {% if pub.code %}
    [<a href="{{pub.code}}">code</a>]
    {% endif %}
  
    {% if pub.blog %}
    [<a href="{{pub.blog}}">blog</a>]
    {% endif %}
  
    {% if pub.talk %}
    [<a href="{{pub.talk}}">talk</a>]
    {% endif %}
  
    {% if pub.tldr %}
    [<a href="{{pub.tldr}}">tldr</a>]
    {% endif %}
  
    {% if pub.publication %}
    [<a href="{{pub.publication}}">publication</a>]
    {% endif %}
  </span>
  <span class="abstract hidden">
    <p>{{pub.abstract}}</p>
  </span>
 </li>
 {% endfor %}
 </ol>

<!-- <h2 id="publications">Patents</h2>
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
 </ol> -->

</article>
