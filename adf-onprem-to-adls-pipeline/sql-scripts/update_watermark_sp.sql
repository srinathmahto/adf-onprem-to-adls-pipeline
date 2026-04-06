CREATE PROCEDURE etl.UpdateWatermark
(
    @SourceSchemaName VARCHAR(100),
    @SourceTableName VARCHAR(100),
    @NewWatermarkValue DATETIME
)
AS
BEGIN
    UPDATE etl.Metadata_Control
    SET LastWatermarkValue = @NewWatermarkValue
    WHERE SourceSchemaName = @SourceSchemaName 
      AND SourceTableName = @SourceTableName
      AND LoadType = 'Incremental';
END
GO
