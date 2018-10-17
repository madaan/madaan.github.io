---
layout: page
permalink: /projects/
---
 <head>
 <link rel="stylesheet" href="/assets/css/main.css">
<script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="/assets/js/common.js"></script>

 </head>
 <article class="post-content publications clearfix">

<h2 id="publications">Projects</h2>
This page lists about some of the interesting projects I've been a part of over the last few years. Some of these projects have a project page which contains more details. Please feel free to reach out to me at amn.madaan@gmail.com for any questions.


<h3 id="publications">Tags</h3>


{% assign tag_list = "" %}
{% for project in site.data.projects %}
    {% for tag in project.tags %}
        {% assign tag_list =  tag_list | append: tag %}
        {% assign tag_list =  tag_list | append: "," %}
        {% endfor %}
{% endfor %}

{%assign uniq_tag_list = tag_list | split: "," | uniq %}

{% assign tag_list = tag_list | split: "," %}
<div id="tag-list">
    {% for tag in uniq_tag_list %}
        {% assign num_tag_posts = 0 %}
        {% for tag2 in tag_list %}
            {% if tag2 == tag %}
                {% assign num_tag_posts = num_tag_posts | plus: 1 %}
            {% endif %}
        {% endfor %}
        <a href = "#{{tag}}" class = "post-tag" id="{{tag}}">{{tag}} {{num_tag_posts}}</a>
    {% endfor %}
</div>



<div id="projects" class="tags-expo-section">
    {% for active_tag in uniq_tag_list %}
    <div id="div-{{active_tag}}" style="display:none">
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
                        [<a href="{{project.url}}"  target="_blank">project page</a>]
                    {% endif %}
                    {% if project.report %}
                        [<a href="{{project.report}}" target="_blank">report</a>]
                    {% endif %}
                    {% if project.code %}
                        [<a href="{{project.code}}"  target="_blank">code</a>]
                    {% endif %}
                    {% if project.presentation %}
                        [<a href="{{project.presentation}}" target="_blank">presentation</a>]
                    {% endif %}
                </span>
                </li>
            {% endif %}
        {% endfor %}
     {% endfor %}
     </ol>
</div>
{% endfor %}
</div>



