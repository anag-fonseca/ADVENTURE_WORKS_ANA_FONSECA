with 

source as (

    select * from {{ source('razao', 'salesorderheadersalesreason') }}

),

renamed as (

    select
        cast(salesorderid as varchar) as salesorderheadersalesreason_pedido_id,
        cast(salesreasonid as varchar) as salesorderheadersalesreason_razao_id,
        cast(modifieddate as varchar) as salesorderheadersalesreason_data_modificacao

    from source

)

select * from renamed
