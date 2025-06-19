with 
-- import models
person as (
    select 
        person_id,
        person_tipo,
        person_email,
        person_demografia,
        concat_ws(' ', person_primeiro_nome, person_nome_meio, person_ultimo_nome) as nome_completo
    from {{ ref('stg_pessoa__persons')}}
)

select *
from person