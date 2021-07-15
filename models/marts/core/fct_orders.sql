
with payments as (
    select * from {{ ref('stg_payments')}} where status='success'
), orders as ( select * from {{ ref ('stg_orders')}}),


fctorders as (

    select
        orders.order_id,
        orders.customer_id,
        SUM(payments.amount) as amount

    from orders

    left join payments on payments.order_id=orders.order_id
    group by 
orders.order_id, orders.customer_id
)

select * from fctorders