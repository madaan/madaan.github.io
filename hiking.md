---
layout: page
permalink: /hiking/
---

 <head>
 <link rel="stylesheet" href="/assets/css/main.css">
<script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="/assets/js/common.js"></script>
 </head>
<div class="hiking">
<p>Pictures from hikes in and around the bay area. A mediocre phone camera backed by non-existent photography skills produced these photos; these hikes are that pretty.</p>
<table>


{% for img in site.data.hiking %}

{% assign modulo = forloop.index | modulo:2 %}
{% if modulo == 1 %}
<tr>
{% endif %}
<td>
<figure>
<a href="{{img.src}}" target="_blank"><img src="{{img.src}}"/></a>
<figcaption>{{img.caption}}</figcaption>
</figure>
</td>
{% if modulo == 0 or forloop.last %}
</tr>
{% endif %}
{% endfor %}
</table>
</div>
<!--
<td>
<figure>
<img src="/res/artifacts/hiking/pinnacles_20180408.jpg"/>
<figcaption>Pinnacles National Park</figcaption>
</figure>
</td>
</tr>
</table>
-->
