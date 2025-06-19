with
    int_produto as (
        select *
        from {{ ref('int_produto__enriched')}}
    )

    select *
    from int_produto