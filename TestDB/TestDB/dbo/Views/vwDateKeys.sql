CREATE VIEW vwDateKeys
AS
select DateKey 
from DimDate WITH(NOLOCK)