with 

source as (

    select * from {{ source('localizacao', 'countryregion') }}

),

renamed as (

    select
        cast(countryregioncode as varchar) as country_codigo,
        cast(name as varchar) as country_nome,
        cast(modifieddate as varchar) as country_data_modicacao

    from source

)

select * from renamed
