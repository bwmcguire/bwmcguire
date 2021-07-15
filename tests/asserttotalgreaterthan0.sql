with total as (
    select order_id,
sum(amount) as totalamount
from {{ref ('stg_payments') }}
group by order_id
)

select * from total where totalamount<0