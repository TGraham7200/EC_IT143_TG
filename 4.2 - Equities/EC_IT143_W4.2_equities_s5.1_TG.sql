USE EC_IT143_DA;
GO
SELECT v.start_price,v.end_price,v.percent_change
	INTO dbo.t_equity_etfs
FROM dbo.v_top_etf_gainers AS v;