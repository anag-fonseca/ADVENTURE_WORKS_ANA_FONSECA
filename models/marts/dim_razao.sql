with
    int_razao as (
        select *
        from {{ ref('int_razao__enriched')}}
    )

    select *
    from int_razao