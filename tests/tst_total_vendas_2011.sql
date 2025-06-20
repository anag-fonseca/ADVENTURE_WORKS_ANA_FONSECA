/* teste de dados que as vendas brutas no ano de 2011 foram de $12.646.112,16 */

with vendas_brutas_teste as (
    select sum(valor_bruto) as total
    from {{ ref('int_vendas__enriched') }}
    where data_pedido between '2011-01-01' and '2011-12-31'
)

select *
from vendas_brutas_teste
where total not between 12646112.14 and 12646112.18