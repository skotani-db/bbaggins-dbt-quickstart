with orders as (

    select * from {{ ref('stg_jaffle_shop__orders') }}

),

payment as (

    select * from {{ ref('stg_stripe__payments') }}

),

fct_orders as (

    select orderid, customer_id, amount
    from orders o
    join payment p on o.order_id = p.orderid

)

select * from fct_orders
