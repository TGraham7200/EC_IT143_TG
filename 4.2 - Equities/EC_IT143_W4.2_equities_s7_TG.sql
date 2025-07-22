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
CREATE PROCEDURE dbo.usp_equityetf_performer
AS

BEGIN


-- 1) Reload data

TRUNCATE TABLE dbo.t_equity_etfs;

INSERT INTO dbo.t_equity_etfs
	SELECT v.start_price,v.end_price,v.percent_change
		FROM dbo.v_top_etf_gainers AS v;

-- 2) Review results

SELECT t.*
	FROM dbo.t_equity_etfs AS t;

END;
