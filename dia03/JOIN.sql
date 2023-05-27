-- Databricks notebook source
SELECT t1.*,
       t2.vlPreco
FROM silver.pizza_query.item_pedido AS t1
LEFT JOIN silver.pizza_query.produto AS t2 
ON t1.descItem = t2.descItem

-- COMMAND ----------

SELECT t1.idPedido,
       SUM(t2.vlPreco) AS vl_pedido
FROM silver.pizza_query.item_pedido AS t1
LEFT JOIN silver.pizza_query.produto AS t2 
ON t1.descItem = t2.descItem
WHERE t1.descTipoItem <> 'bebida'
GROUP by t1.idPedido

-- COMMAND ----------

SELECT descItem,
       count(*) AS qtdPedido
FROM silver.pizza_query.item_pedido
WHERE descTipoItem = 'massa'
GROUP BY descItem
ORDER BY qtdPedido DESC
LIMIT 1

-- COMMAND ----------

SELECT descItem,
       count(*) AS qtdPedido
FROM silver.pizza_query.item_pedido
WHERE descTipoItem LIKE '%ingrediente%'
GROUP BY descItem
ORDER BY qtdPedido DESC
LIMIT 5

-- COMMAND ----------

-- Descobrindo a pizza perfeita
SELECT * FROM(
(
  SELECT descItem,
          count(*) AS qtdPedido
  FROM silver.pizza_query.item_pedido
  WHERE descTipoItem = 'borda'

  GROUP BY descItem
  ORDER BY qtdPedido DESC
  LIMIT 1)

    UNION ALL
    (SELECT descItem,
            count(*) AS qtdPedido
    FROM silver.pizza_query.item_pedido
    WHERE descTipoItem = 'massa'

    GROUP BY descItem
    ORDER BY qtdPedido DESC
    LIMIT 1)

    UNION ALL
    (SELECT descItem,
            count(*) AS qtdPedido
    FROM silver.pizza_query.item_pedido
    WHERE descTipoItem LIKE '%ingrediente%'

    GROUP BY descItem
    ORDER BY qtdPedido DESC
    LIMIT 5)

    UNION ALL
    (SELECT descItem,
            count(*) AS qtdPedido
    FROM silver.pizza_query.item_pedido
    WHERE descTipoItem LIKE '%queijo%'

    GROUP BY descItem
    ORDER BY qtdPedido DESC
    LIMIT 1)

    UNION ALL
    (SELECT descItem,
            count(*) AS qtdPedido
    FROM silver.pizza_query.item_pedido
    WHERE descTipoItem = 'bebida'

    GROUP BY descItem
    ORDER BY qtdPedido DESC
    LIMIT 1)
  ) AS t1

  LEFT JOIN silver.pizza_query.produto AS t2
  ON t1.descItem = t2.descItem

-- COMMAND ----------

-- Preço total da pizza perfeita
SELECT sum(vlPreco) AS valorPizza
FROM (

  (SELECT descItem,
  count(*) AS qtdPedido
  FROM silver.pizza_query.item_pedido
  WHERE descTipoItem = 'borda'

  GROUP BY descItem
  ORDER BY qtdPedido DESC
  LIMIT 1)

    UNION ALL
    (SELECT descItem,
            count(*) AS qtdPedido
    FROM silver.pizza_query.item_pedido
    WHERE descTipoItem = 'massa'

    GROUP BY descItem
    ORDER BY qtdPedido DESC
    LIMIT 1)

    UNION ALL
    (SELECT descItem,
            count(*) AS qtdPedido
    FROM silver.pizza_query.item_pedido
    WHERE descTipoItem LIKE '%ingrediente%'

    GROUP BY descItem
    ORDER BY qtdPedido DESC
    LIMIT 5)

    UNION ALL
    (SELECT descItem,
            count(*) AS qtdPedido
    FROM silver.pizza_query.item_pedido
    WHERE descTipoItem LIKE '%queijo%'

    GROUP BY descItem
    ORDER BY qtdPedido DESC
    LIMIT 1)

    UNION ALL
    (SELECT descItem,
            count(*) AS qtdPedido
    FROM silver.pizza_query.item_pedido
    WHERE descTipoItem = 'bebida'

    GROUP BY descItem
    ORDER BY qtdPedido DESC
    LIMIT 1)
  ) AS t1

  LEFT JOIN silver.pizza_query.produto AS t2
  ON t1.descItem = t2.descItem

-- COMMAND ----------


