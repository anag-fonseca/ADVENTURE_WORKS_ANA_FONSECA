with
    int_localizacao as (
        select *
        from {{ ref('int_localizacao__enriched')}}
    )

    select *
    from int_localizacao