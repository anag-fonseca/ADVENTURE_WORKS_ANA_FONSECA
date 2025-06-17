with 

source as (

    select * from {{ source('pagamento', 'personcreditcard') }}

),

renamed as (

    select
        cast(businessentityid as varchar) as personcreditcard_clienteid,
        cast(creditcardid as varchar) as  personcreditcard_cartaoid,
        cast(modifieddate as varchar) as personcreditcard_data_modifcacao

    from source

)

select * from renamed
