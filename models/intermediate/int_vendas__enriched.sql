with 
-- import models
salesorderdatail as (
    select *
    from {{ ref('stg_vendas__salesorderdetail')}}
)
, salesorderheader as (
    select *
    from {{ ref('stg_vendas__salesorderheader')}}
)

-- transformaçao para construção dos dados de venda

--,--joined as (
--    select 
--
--, from stg_pagamento__creditcard
--    left join personcreditcard on stg_pagamento__creditcard.creditcard_id = stg_pagamento__personcreditcard.personcreditcard_cartaoid
----)
--
--select *
--from joined