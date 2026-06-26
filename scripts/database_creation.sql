use master;
go


IF EXISTS ( select 1 from sys.databases where name = 'E_commerce')
begin
	alter database E_commerce set single_user with rollback immediate
	drop database E_commerce
end
go

Create database E_commerce
go

use E_commerce
go

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
