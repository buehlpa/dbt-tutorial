with payments as 
(
    select * from {{ ref('stg_stripe__payments')}}
    where status = 'success'
)
,

pivoted as (
    select
        order_id,
        {% set payment_methods=['bank_transfer','coupon','credit_card','gift_card'] %}
        {% for p_method in payment_methods %}

            sum(case when payment_method = '{{p_method}}' then amount else 0 end) as {{p_method}}_amount,

        {% endfor %}
    from payments
    group by order_id
)


select * from pivoted