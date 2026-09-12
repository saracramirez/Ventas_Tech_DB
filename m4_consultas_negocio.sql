USE Ventas_Tech_DB;

-- Consulta 1: Resumen ejecutivo mensual

SELECT
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(*) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY MONTH(fecha_venta);

-- Consulta 2: Ranking de productos

SELECT TOP 5
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_generado
FROM ventas
GROUP BY id_producto
ORDER BY SUM(cantidad * precio_unitario) DESC;

-- Consulta 3: Clientes recurrentes

SELECT
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;

-- Consulta 4: Meses por encima/por debajo del promedio

SELECT
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    CASE
        WHEN SUM(cantidad * precio_unitario) >= (
            SELECT AVG(total_mensual)
            FROM (
                SELECT SUM(cantidad * precio_unitario) AS total_mensual
                FROM ventas
                GROUP BY MONTH(fecha_venta)
            ) AS promedio_meses
        )
        THEN 'Por encima'
        ELSE 'Por debajo'
    END AS comparacion_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY MONTH(fecha_venta);

-- Hallazgos
-- 1. En marzo se generó una facturación total de $6.444 en 10 pedidos, con un ticket promedio de $644,40.
-- 2. El producto 1 fue el de mayor facturación ($3.600 con 3 unidades), mientras que el producto 2 fue el más vendido en unidades (13), pero generó solo $364.
-- 3. Los 5 clientes registrados son recurrentes, ya que cada uno realizó 2 pedidos; sin embargo, el gasto total varía considerablemente entre ellos.