with 
-- import models
product as (
    select *
    from {{ ref('stg_produto__product')}}
)
, productcategory as (
    select *
    from {{ ref('stg_produto__productcategory')}}
)
, productsubcategory as (
    select *
    from {{ ref('stg_produto__productsubcategory')}}
)

-- transformaçao para unir informações de categoria e subcategoria

, joinedcategorias as (
    select 
        productcategory.productcategory_id as categoria_id,
        productcategory.productcategory_nome as categoria_nome,
        productsubcategory.productsubcategory_id as subcategoria_id,
        productsubcategory.productsubcategory_nome as subcategoria_nome,
from productsubcategory
    left join productcategory on  productsubcategory.productsubcategory_categoria_id = productcategory.productcategory_id
)
-- transformaçao para unir informações de categorias e dos produtos
, joined as (
    select 
        product.product_id as produto_id,
        product.product_nome as nome_produto,
        product.product_numero as produto_numero,
        product.product_cor as cor,
        product.product_custo_padrao as custo_padrao,
        product.product_lista_preco as lista_preco,
        product.product_tamanho as tamanho,
        product.product_dias_producao as dias_producao,
        product.product_linha_producao as linha_producao,
        product.product_classe as classe,
        product.product_estilo as estilo,
        product.product_modelo_producao_id as modelo_producao,
        product.product_discontinuado_data as data_descontinuado,
        joinedcategorias.categoria_id,
        joinedcategorias.categoria_nome,
        joinedcategorias.subcategoria_id,
        joinedcategorias.subcategoria_nome,
from product
    left join joinedcategorias on product.product_subcategoria_id = joinedcategorias.subcategoria_id
)

select *
from joined