with 

source as (

    select * from {{ source('localizacao', 'address') }}

),

renamed as (

    select
        cast(addressid as varchar) as address_id,
        cast(addressline1 as varchar) as address_linha1,
        cast(addressline2 as varchar) as address_linha2,
        cast(city as varchar) as address_cidade,
        cast(stateprovinceid as varchar) as address_estado_id,
        cast(postalcode as varchar) as address_codigo_id,
        cast(spatiallocation as varchar) as address_localizacao_espacial,
        cast(rowguid as varchar) as address_rowguid,
        cast(modifieddate as varchar) as address_data_modificacao

    from source

)

select * from renamed
