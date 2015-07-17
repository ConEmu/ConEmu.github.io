{% comment %}
generated from "_data/toc.yml"
{% endcomment %}

{% for h3 in site.data.toc %}
<h3 id="{{ h3.id }}">{% if h3.url != "" %}<a href="{% if h3.id == 'conemu' %}{{page.docfolder}}/{% else %}{{ h3.url }}{% endif %}">{% endif %}{% if page.pagelang == "en" %}{{ h3.eng }}{% else %}{{ h3.rus }}{% endif %}{% if h3.url != "" %}</a>{% endif %}</h3>{% if h3.children %}{% for h4 in h3.children %}
  * [{% if page.pagelang == "en" %}{{ h4.eng }}{% else %}{{ h4.rus }}{% endif %}]({% if h4.url == "donate" %}{% if page.pagelang == "en" %}/donate.html{% else %}{{site.mirror_ru}}/donate.html{% endif %}{% else %}{{ h4.url }}{% endif %}){% if h4.children %}{% for h5 in h4.children %}
    * [{% if page.pagelang == "en" %}{{ h5.eng }}{% else %}{{ h5.rus }}{% endif %}]({{ h5.url }}){% if h5.children %}{% for h6 in h5.children %}
      * [{% if page.pagelang == "en" %}{{ h6.eng }}{% else %}{{ h6.rus }}{% endif %}]({{ h6.url }}){% endfor %}{% endif %}{% endfor %}{% endif %}{% endfor %}{% endif %}
{% endfor %}
