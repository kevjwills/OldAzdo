declare @j nvarchar(max) = '{
   "CustomerTransactionID":2,
   "CustomerID":832,
   "TransactionTypeID":1,
   "InvoiceID":1,
   "TransactionDate":"2013-01-01",
   "AmountExcludingTax":2300.00,
   "TaxAmount":345.00,
   "TransactionAmount":2645.00,
   "OutstandingBalance":0.00,
   "FinalizationDate":"2013-01-02",
   "IsFinalized":true,
   "LastEditedBy":10,
   "LastEditedWhen":"2013-01-02T11:30:00"
}'

select *
from openjson(@j)