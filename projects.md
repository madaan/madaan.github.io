---
layout: page
title: Projects
permalink: /projects/
---

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

<div id="projects">
    {% for active_tag in uniq_tag_list %}
    <h1>{{active_tag}}</h1>
    <ul>
    {% for project in site.data.projects %}
        {% for tag in project.tags %}
            {% if tag == active_tag %}
                <li><a href="/projects/{{project.url}}/"><h2 class="tag-header" id = "{{tag}}"> {{project.name}} </h2></a></li>
                {{project.about}}
            {% endif %}
        {% endfor %}
     {% endfor %}
     </ul>
{% endfor %}
</div>



