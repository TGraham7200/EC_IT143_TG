USE EC_IT143_DA;
GO
SELECT v.specified_date,v.ticker_symbol,v.price_at_close
	INTO dbo.t_btc_price
FROM dbo.v_btc_price AS v;