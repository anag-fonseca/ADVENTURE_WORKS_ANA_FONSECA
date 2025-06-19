with
    int_cliente as (
        select *
        from {{ ref('int_cliente__enriched')}}
    )

    select *
    from int_cliente