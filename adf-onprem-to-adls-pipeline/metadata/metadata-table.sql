-- Create schema for ETL Control framework
CREATE SCHEMA etl;
GO

-- Create Metadata Control Table
CREATE TABLE etl.Metadata_Control (
    TableID INT IDENTITY(1,1) PRIMARY KEY,
    SourceSchemaName VARCHAR(100) NOT NULL,
    SourceTableName VARCHAR(100) NOT NULL,
    TargetContainerName VARCHAR(100) NOT NULL,
    TargetDirectoryPath VARCHAR(255) NOT NULL,
    LoadType VARCHAR(50) NOT NULL CHECK (LoadType IN ('Full', 'Incremental')),
    WatermarkColumn VARCHAR(100) NULL,
    LastWatermarkValue DATETIME NULL,
    IsActive BIT DEFAULT 1
);
GO

-- Insert sample metadata
INSERT INTO etl.Metadata_Control 
(SourceSchemaName, SourceTableName, TargetContainerName, TargetDirectoryPath, LoadType, WatermarkColumn, LastWatermarkValue, IsActive)
VALUES 
('Sales', 'Customers', 'raw', 'sales/customers/', 'Full', NULL, NULL, 1),
('Sales', 'Orders', 'raw', 'sales/orders/', 'Incremental', 'ModifiedDate', '1900-01-01 00:00:00.000', 1),
('Production', 'Products', 'raw', 'production/products/', 'Full', NULL, NULL, 1);
GO
