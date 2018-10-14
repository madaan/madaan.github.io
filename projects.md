---
layout: page
permalink: /projects/
---
 <head>
 <link rel="stylesheet" href="/assets/css/main.css">
<script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://madaan.github.io/assets/js/common.js"></script>
 </head>
 <article class="post-content publications clearfix">

<h2 id="publications">Projects</h2>
<h3 id="publications">Tags</h3>

Pick a tag
{% assign tag_list = "" %}
{% for project in site.data.projects %}
    {% for tag in project.tags %}
        {% assign tag_list =  tag_list | append: tag %}
        {% assign tag_list =  tag_list | append: "," %}
        {% endfor %}
{% endfor %}

{%assign uniq_tag_list = tag_list | split: "," | uniq %}

<div id="tag-list">
    {% for tag in uniq_tag_list %}
        <a href = "#{{tag}}" class = "post-tag">{{tag}}</a>
    {% endfor %}
</div>

  <hr/>


<div id="projects" class="tags-expo-section">
    {% for active_tag in uniq_tag_list %}
    <h3 class="tag-header" id = "{{active_tag}}">{{active_tag}}</h3>
    <ol class="bibliography">
    {% for project in site.data.projects %}
        {% for tag in project.tags %}
            {% if tag == active_tag %}
                <li>
                <h3 class="year">{{project.year}}</h3>
                <span class="title"> {{project.name}} </span>
                <span class="periodical"><em>{{project.about}}</em></span>
                
                <span class="links">
                    {% if project.url %}
                        [<a href="{{project.url}}">project page</a>]
                    {% endif %}
                    {% if project.report %}
                        [<a href="{{project.report}}">report</a>]
                    {% endif %}
                    {% if project.code %}
                        [<a href="{{project.code}}">code</a>]
                    {% endif %}
                </span>
                </li>
            {% endif %}
        {% endfor %}
     {% endfor %}
     </ol>
{% endfor %}
</div>



