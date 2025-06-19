with 

source as (

    select * from {{ source('produto', 'productsubcategory') }}

),

renamed as (

    select
        cast(productsubcategoryid as int) as productsubcategory_id,
        cast(productcategoryid as int) as productsubcategory_categoria_id,
        cast(name as varchar) as productsubcategory_nome,
        cast(rowguid as varchar) as productsubcategory_rowguid,
        cast(modifieddate as varchar) as productsubcategory_modieddate

    from source

)

select * from renamed
