USE EC_IT143_DA
DROP VIEW IF EXISTS dbo.v_btc_price;
GO
CREATE VIEW dbo.v_btc_price
AS

/******************************************************************************************************************
NAME: dbo.v_btc_price
PURPOSE: Create Bitcon Price - Load view

MODIFICATION LOG:
Ver		Date		Author		Description
-----	---------	---------	-----------------------------------
1.0		7/21/25		TGRAHAM		1. EC IT143 4.2

Notes:
Th is script exists to help me learn step 4 of 8 in the Answer Focused Approach for T-SQL Data Manipulation

******************************************************************************************************************/

SELECT 
    [date] AS specified_date,ticker AS ticker_symbol,[close] AS price_at_close


FROM 
    dbo.BTC
WHERE 
    [date] = '2024-07-21';