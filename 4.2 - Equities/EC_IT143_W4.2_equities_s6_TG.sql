-- Q: What is the current date and time?
-- A: Let's ask SQL Server and find out...

-- 1) Reload data
USE EC_IT143_DA;
GO
TRUNCATE TABLE dbo.t_equity_etfs;

INSERT INTO dbo.t_equity_etfs
	SELECT v.start_price,v.end_price,v.percent_change
		FROM dbo.v_top_etf_gainers AS v;

-- 2) Review results

SELECT t.*
	FROM dbo.t_equity_etfs AS t;

