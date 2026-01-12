
{% set x = 20%}

  bla

{% if x > 2 %}

  blubla

{% else %}

  bliblu

{% endif %}



{% for j in range(26) %}
  select {{j}} as number {% if not loop.last %} union all {% endif%}
{% endfor %}