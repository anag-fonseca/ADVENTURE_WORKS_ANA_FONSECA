with 

source as (

    select * from {{ source('produto', 'productcategory') }}

),

renamed as (

    select
        cast(productcategoryid as int) as productcategory_id,
        cast(name as varchar) as productcategory_nome,
        cast(rowguid as varchar) as productcategory_rowguid,
        cast(modifieddate as varchar) as productcategory_data_modificacao

    from source

)

select * from renamed
