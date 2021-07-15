
with payments as (

    select
        orderid as order_id,
        id as payment_id,
        paymentmethod,
        status,
        amount/100 as amount,
        created as payment_date

    from {{ source('stripe','payment') }}
    


) select * from payments