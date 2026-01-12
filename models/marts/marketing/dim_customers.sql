{# {{ config( materialized = "view") }} #}

with 

orders as (

    select * from {{ ref ('stg_jaffle_shop__orders') }}
),

customers as (

    select * from {{ ref( 'stg_jaffle_shop__customers' ) }}
),

payments as (

    select * from {{ ref( 'stg_stripe__payments') }}
),


-- aggregation customer orders 
customer_orders as (

    select
        customer_id,

        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders

    from orders

    group by 1

),

-- aggregation customer payments

customer_payments as (

    select
        o.customer_id as customer_id,
        sum(amount) as lifetime_value

    from payments p join orders o on p.order_id = o.order_id

    where p.status = 'success'

    group by customer_id
 
),

-- sum_clv as (
-- select sum(lifetime_value) from customer_payments
-- ),

final as (

    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders,
        customer_payments.lifetime_value

    from customers

    left join customer_orders using (customer_id)
    left join customer_payments using (customer_id)

)

select * from final
