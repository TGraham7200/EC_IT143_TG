-- Q: What is the current date and time?
-- A: Let's ask SQL Server and find out...

-- 1) Reload data
USE EC_IT143_DA;
GO
TRUNCATE TABLE dbo.t_btc_price;

INSERT INTO dbo.t_btc_price
	SELECT v.specified_date,v.ticker_symbol,v.price_at_close
		FROM dbo.v_btc_price AS v;

-- 2) Review results

SELECT t.*
	FROM dbo.t_btc_price AS t;

