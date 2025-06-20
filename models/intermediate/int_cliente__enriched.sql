with 
-- import models
person as (
    select 
        cliente_id,
        person_tipo as tipo_cliente,
        person_email as email,
        person_demografia as demografia,
        concat_ws(' ', person_primeiro_nome, person_nome_meio, person_ultimo_nome) as nome_completo
    from {{ ref('stg_pessoa__persons')}}
)

select *
from person