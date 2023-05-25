-- Databricks notebook source
SELECT flKetchup, txtRecado
FROM silver.pizza_query.pedido
WHERE flKetchup = TRUE
AND descUF = 'Espírito Santo'
