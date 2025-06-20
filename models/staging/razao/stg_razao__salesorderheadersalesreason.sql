with 

source as (

    select * from {{ source('razao', 'salesorderheadersalesreason') }}

),

renamed as (

    select
        {{dbt_utils.generate_surrogate_key(['salesorderid','salesreasonid'])}} as pedido_razao_sk,
        cast(salesorderid as int) as salesorderheadersalesreason_pedido_id,
        cast(salesreasonid as int) as salesorderheadersalesreason_razao_id,
        cast(modifieddate as varchar) as salesorderheadersalesreason_data_modificacao

    from source

)

select * from renamed
