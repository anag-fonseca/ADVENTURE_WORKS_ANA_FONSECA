with 

source as (

    select * from {{ source('pagamento', 'creditcard') }}

),

renamed as (

    select
        cast(creditcardid as varchar) as creditcard_id,
        cast(cardtype as varchar) as creditcard_tipo,
        cast(cardnumber as varchar) as creditcard_numero,
        cast(expmonth as varchar) as creditcard_val_mes,
        cast(expyear as varchar) as creditcard_val_ano,
        cast(modifieddate as varchar) as creditcard_data_motificacao

    from source

)

select * from renamed
