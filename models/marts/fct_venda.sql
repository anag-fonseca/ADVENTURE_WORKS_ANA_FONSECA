with
    int_vendas as (
        select *
        from {{ ref('int_vendas__enriched')}}
    )

    select *
    from int_vendas