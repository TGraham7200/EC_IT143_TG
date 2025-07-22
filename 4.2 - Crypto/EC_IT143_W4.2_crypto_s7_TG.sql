/******************************************************************************************************************
NAME: dvo.v_hello_world_load
PURPOSE: Hello World - Load user stored procedure

MODIFICATION LOG:
Ver		Date		Author		Description
-----	---------	---------	-----------------------------------
1.0		7/21/25		TGRAHAM		1. EC IT143 4.2

Notes:
Th is script exists to help me learn step 7 of 8 in the Answer Focused Approach for T-SQL Data Manipulation

******************************************************************************************************************/
USE EC_IT143_DA;
GO
CREATE PROCEDURE dbo.usp_btc_price
AS

BEGIN

		-- 1) Reload data
		TRUNCATE TABLE dbo.t_btc_price;

		INSERT INTO dbo.t_btc_price
			SELECT v.specified_date,v.ticker_symbol,v.price_at_close
			FROM dbo.v_btc_price AS v;

-- 2) Review results

	SELECT t.*
	FROM dbo.t_btc_price AS t;

	END;
