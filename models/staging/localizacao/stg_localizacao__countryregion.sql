with 

source as (

    select * from {{ source('localizacao', 'countryregion') }}

),

renamed as (

    select
        cast(countryregioncode as varchar) as pais_codigo,
        cast(name as varchar) as pais_nome,
        cast(modifieddate as varchar) as pais_data_modicacao

    from source

)

select * from renamed
