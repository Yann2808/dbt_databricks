with orders as (
    select *
    from {{ ref("stg_orders") }}
),

--customers as (
  --  select *
    --from {{ ref("stg_customers") }}
--),

payments as (
    select *
    from {{ ref("stg_payments") }}
)

select
    -- o.order_id as order_id,
    o.customer_id as customer_id,
    -- p.order_id as order_payment_id,
    sum(p.amount) as total_amount
from orders as o
 inner join payments p
 on o.order_id = p.order_id
group by o.customer_id
