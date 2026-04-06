-- Query used dynamically in ADF for Full Load
-- Pipeline passes SchemaName and TableName dynamically

SELECT * 
FROM 
    [@{pipeline().parameters.SchemaName}].[@{pipeline().parameters.TableName}]
