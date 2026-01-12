select 
    c.order_id as order_id,
    c.customer_id as customer_id,
    p.amount as amount,


from  {{ ref('stg_jaffle_shop__orders') }} c join 
      {{ ref('stg_stripe__payments') }} p  on  c.order_id = p.order_id

