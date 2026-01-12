select
    id as payment_id,
    orderid as order_id,
    amount,
    created as created_at,
    _batched_at,
    status

from {{source('stripe','payment')}}