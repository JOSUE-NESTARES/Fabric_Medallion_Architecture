# 🏗️ Real Estate Insight Fabric - Proyecto Integrador

Este repositorio contiene el desarrollo completo del proyecto **"Real Estate Insight Fabric"**, una solución end-to-end construida sobre **Microsoft Fabric** para la empresa ficticia **BrickVista S.A.**, especializada en proyectos inmobiliarios en LATAM.

---

## 🧠 Objetivo del Proyecto

Implementar una plataforma unificada de datos que integre información de ventas, marketing, leads, valorizaciones y más, con el fin de habilitar analítica descriptiva y mejorar la toma de decisiones en tiempo real.

---

## 📊 Arquitectura de la Solución

![Arquitectura](images/arquitectura.JPG)

### Componentes:
- **Origen de Datos:** Archivos CSV. El contenedor ADLS Gen2 no es posible compartirlo, por ello para efectos educativos trabajaremos con el CSV.
- **Orquestación:** Data Pipelines de Microsoft Fabric.
- **Lakehouse:** Estructura en capas: Raw → Bronze → Silver → Gold (Delta Tables).
- **Transformaciones:** Notebooks en PySpark por capa.
- **Warehouse:** Modelo dimensional relacional para análisis.
- **Visualización:** Power BI con modelo semántico integrado.

---

## 🔁 Flujo de Ejecución

El pipeline de Fabric ejecuta diariamente los siguientes pasos:

1. Extracción desde ADLS / CSV
2. Enriquecimiento y metadatos en Bronze
3. Limpieza y normalización en Silver
4. Construcción de hechos y dimensiones en Gold
5. Carga final al Data Warehouse
6. Visualización automática en Power BI

![Pipeline](images/pipeline.png)

---

## ✅ Buenas Prácticas Aplicadas

- Modularización de notebooks por capa (Bronze, Silver, Gold)
- Uso de Delta Lake como formato de almacenamiento
- Automatización desde el inicio del desarrollo

---

## 🚀 Próximos Pasos

- Integración de APIs externas con datos macroeconómicos
- Implementación de alertas automáticas en Capacity Metrics
- Escalado del modelo a más líneas de negocio

---

## 🧑‍💻 Contenido del Repositorio

```text
📁 pipelines/
   ├─ pipe_bricks_vista.json
   └─ pipe_extract_adls.json
📁 notebooks/
   ├─ NTB_BRONZE_BRICKVISTA_DEV_001.ipynb
   ├─ NTB_SILVER_BRICKVISTA_DEV_001.ipynb
   └─ NTB_GOLD_BRICKVISTA_DEV_001.ipynb
📁 sql/
   └─ sp_TruncateGoldTables.sql
📁 images/
   ├─ arquitectura.JPG
   └─ pipeline.png
📄 README.md

---

Este proyecto fue desarrollado como parte del curso de Ingeniería de Datos, con fines académicos.  
Contacto: Josué Nestares - jnestaresj@gmail.com - https://www.linkedin.com/in/josuenestares/
