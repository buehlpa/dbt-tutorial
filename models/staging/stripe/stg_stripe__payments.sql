select
    id as payment_id,
    orderid as order_id,
    amount,
    created as created_at,
    _batched_at,
    paymentmethod as payment_method,
    status

from {{source('stripe','payment')}}