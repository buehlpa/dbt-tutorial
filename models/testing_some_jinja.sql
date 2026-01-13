{#
  -- if statement
  {% set x = 20 %}
  -- bla 
  {% if x > 2 %}
  -- blubla
  {% else %}
  -- bliblu
  {% endif %}


  -- for loop
  {% for j in range(26) %}
    select {{j}} as number {% if not loop.last %} union all {% endif%}
  {% endfor %}

  -- use variables
  -- i want to print

  {{ x }}

  im a comment 

  {% set animals = ['blub','blab'] %}

  {{ animals[0] }}
  {%- for animal in animals -%}
    {% if animal == 'blub' %}
    {% set cage = 1 %}
  {% endif %}

  -- dicitonary
  {% set animals_dict = {'blub': 10,'blab':100} %}
  -- access dictionary hour key 
  {{ animals_dict['blub'] }}
#}

  {% for j in range(26) %}
    select {{j}} as number {% if not loop.last %} union all {% endif%}
  {% endfor %}
