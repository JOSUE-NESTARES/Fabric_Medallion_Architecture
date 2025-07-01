CREATE   PROCEDURE gold.sp_TruncateGoldTables
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        -- 1. Primero eliminar tablas de hechos (que dependen de dimensiones)
        DELETE FROM gold.lead_conversion;
        DELETE FROM gold.sales_performance;
        DELETE FROM gold.fact_sales;
        DELETE FROM gold.fact_leads;
        
        -- 2. Luego eliminar tablas dimensión (en orden inverso a sus dependencias)
        DELETE FROM gold.dim_properties;
        DELETE FROM gold.dim_projects;
        DELETE FROM gold.dim_campaigns;
        DELETE FROM gold.dim_clients;
        DELETE FROM gold.dim_brokers;
        DELETE FROM gold.dim_region;
        
        -- 3. dim_date puede tener datos de referencia independiente
        DELETE FROM gold.dim_date;
        
        PRINT '¡Todos los datos fueron eliminados manteniendo la integridad referencial!';
    END TRY
    BEGIN CATCH
        PRINT 'Error durante la limpieza: ' + ERROR_MESSAGE();
        -- Revertir cambios si es necesario
        ROLLBACK;
        THROW;
    END CATCH
END;