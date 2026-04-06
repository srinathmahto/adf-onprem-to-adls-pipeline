-- Query used dynamically in ADF for Incremental Load
-- Pipeline passes SchemaName, TableName, WatermarkColumn, and LastWatermarkValue dynamically

SELECT * 
FROM 
    [@{pipeline().parameters.SchemaName}].[@{pipeline().parameters.TableName}]
WHERE 
    [@{pipeline().parameters.WatermarkColumn}] > '@{pipeline().parameters.LastWatermarkValue}'
