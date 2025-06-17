with 

source as (

    select * from {{ source('localizacao', 'businessentityaddress') }}

),

renamed as (

    select
        cast(businessentityid as varchar) as businessentityaddress_cliente_id,
        cast(addressid as varchar) as businessentityaddress_endereco_id,
        cast(addresstypeid as varchar) as businessentityaddress_endereco_tipo,
        cast(rowguid as varchar) as businessentityaddress_rowguid,
        cast(modifieddate as varchar) as businessentityaddress_data_modificacao

    from source

)

select * from renamed
