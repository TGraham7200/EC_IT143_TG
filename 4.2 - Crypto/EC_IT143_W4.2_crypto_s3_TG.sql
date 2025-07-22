-- Q: What was the price of Bitcoin on July 21st 2024?
-- A: Let's ask SQL Server and find out...
USE EC_IT143_DA;
GO

SELECT 
    [date] AS specified_date,ticker AS ticker_symbol,[close] AS price_at_close

FROM 
    dbo.BTC
WHERE 
    [date] = '2024-07-21';