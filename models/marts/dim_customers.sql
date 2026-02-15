with customers as (
    select *
    from {{ ref("stg_customers") }}
),

orders as (
    select *
    from {{ ref("stg_orders") }}
)

select
    c.customer_id as c_id,
    -- c.first_name as c_name,
    -- o.id as o_id,
    count(*) as nb_commande
from customers c
join orders o
on c.customer_id = o.customer_id
group by c.customer_id