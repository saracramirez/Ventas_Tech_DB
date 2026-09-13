USE Ventas_Tech_DB;

-- Consulta 1: Vista base del proyecto

SELECT
    v.fecha_venta AS fecha,
    v.id_cliente,
    c.nombre AS nombre_cliente,
    v.id_producto,
    p.nombre_producto,
    cat.nombre_categoria AS categoria,
    v.cantidad,
    v.precio_unitario,
    v.cantidad * v.precio_unitario AS total_venta
FROM ventas AS v
INNER JOIN clientes AS c
    ON v.id_cliente = c.id_cliente
INNER JOIN productos AS p
    ON v.id_producto = p.id_producto
INNER JOIN categorias AS cat
    ON p.id_categoria = cat.id_categoria;

-- Consulta 2: Clientes sin ventas

SELECT
    c.nombre,
    c.email,
    c.fecha_registro
FROM clientes AS c
LEFT JOIN ventas AS v
    ON c.id_cliente = v.id_cliente
WHERE v.id_cliente IS NULL;

-- Consulta 3: Productos sin ventas

SELECT
    p.nombre_producto,
    c.nombre_categoria AS categoria,
    p.precio
FROM productos AS p
LEFT JOIN ventas AS v
    ON p.id_producto = v.id_producto
INNER JOIN categorias AS c
    ON p.id_categoria = c.id_categoria
WHERE v.id_producto IS NULL;

-- Consulta 4: Consolidado por canal

SELECT
    canal,
    COUNT(*) AS cantidad_ventas,
    SUM(total) AS total_facturado
FROM (
    SELECT
        fecha_venta AS fecha,
        cantidad * precio_unitario AS total,
        'Online' AS canal
    FROM ventas
    WHERE fecha_venta <= '2024-03-10'

    UNION ALL

    SELECT
        fecha_venta AS fecha,
        cantidad * precio_unitario AS total,
        'Presencial' AS canal
    FROM ventas
    WHERE fecha_venta > '2024-03-10'
) AS consolidado
GROUP BY canal;