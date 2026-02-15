with customers as (
    select *
    from {{ ref("stg_customers") }}
),

orders as (
    select *
    from {{ ref("stg_orders") }}
),

customers_payments as (
    select *
    from {{ ref("int_customer_payments") }}
)

select
    c.customer_id,
    c.first_name,
    c.last_name,
    count(o.order_id) as nb_commande,
    coalesce(total_amount, 0) as lifetime_value
from customers c
    left join orders o
        on c.customer_id = o.customer_id
    left join customers_payments cp
        on c.customer_id = cp.customer_id
group by 1, 2, 3, 5
-- ou bien group by c.customer_id, c.first_name, c.last_name, cp.total_amount