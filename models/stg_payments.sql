with
source as (
    select 
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        status,
        amount / 100 as amount, -- converting from cents to dollars
        created as created_at,
        _batched_at
    from raw.stripe.payment
)
select * from source