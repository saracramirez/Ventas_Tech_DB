# Ventas_Tech_DB

## Descripción

Proyecto de base de datos y análisis de ventas desarrollado para TechStore como parte de los módulos 3, 4, 5 y el checkpoint de ETL.

La base de datos `Ventas_Tech_DB` contiene información de categorías, clientes, productos y ventas, y permite realizar consultas SQL orientadas a métricas y análisis de negocio.

## Estructura del proyecto

- `ventas_tech_db.sql` — creación de la base de datos, tablas, restricciones y carga de datos.
- `m4_consultas_negocio.sql` — consultas SQL para obtener métricas y responder preguntas de negocio.
- `m5_consultas_joins.sql` — consultas SQL utilizando JOIN y UNION ALL para enriquecer y consolidar la información.
- `Pipeline_ETL_Ramirez_Sara.pbix` — archivo de Power BI con el pipeline ETL desarrollado mediante Power Query y lenguaje M.

## Tecnologías

- SQL Server
- SQL
- Power BI
- Power Query
- Lenguaje M
- GitHub

## Módulo 4 — Consultas de negocio

Se realizaron consultas para obtener:

- Resumen ejecutivo mensual.
- Ranking de productos.
- Identificación de clientes recurrentes.
- Comparación de ventas mensuales frente al promedio.

## Módulo 5 — Consultas con JOINs

Se realizaron consultas para:

- Crear una vista enriquecida de ventas con información de clientes, productos y categorías.
- Identificar clientes sin ventas.
- Identificar productos sin ventas.
- Consolidar las ventas mediante `UNION ALL` y una clasificación por canal.

## Checkpoint — Pipeline ETL con Power Query y M

Se construyó un pipeline ETL en Power BI a partir del archivo `Pipeline_ETL_Dataset.xlsx`.

### Transformaciones realizadas

- Eliminación de duplicados utilizando `id_cliente` e `id_producto` como claves.
- Resolución técnica de los valores nulos identificados.
- Eliminación de filas completamente vacías.
- Renombramiento de las consultas:
  - `Dim_Clientes`
  - `Dim_Productos`
  - `Dim_Categorias`
  - `Fact_Ventas`
- Corrección y validación de los tipos de datos.
- Merge de `Fact_Ventas` con `Dim_Productos`.
- Incorporación de `nombre_producto` y `categoria` a `Fact_Ventas`.
- Documentación de las transformaciones mediante comentarios técnicos en lenguaje M.

### Verificación

| Consulta | Filas |
|---|---:|
| Dim_Clientes | 11 |
| Dim_Productos | 12 |
| Dim_Categorias | 4 |
| Fact_Ventas | 50 |

## Objetivo

Obtener información concreta de las ventas mediante SQL y Power BI para apoyar el análisis y la toma de decisiones comerciales.
