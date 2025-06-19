with 

source as (

    select * from {{ source('razao', 'salesreason') }}

),

renamed as (

    select
        cast(salesreasonid as int) as salesreason_id,
        cast(name as varchar) as salesreason_nome,
        cast(reasontype as varchar) as salesreason_tipo,
        cast(modifieddate as varchar) as salesreason_data_modificacao

    from source

)

select * from renamed
