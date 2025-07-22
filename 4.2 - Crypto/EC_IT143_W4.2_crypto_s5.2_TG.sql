USE EC_IT143_DA;
DROP TABLE IF EXISTS dbo.t_btc_price;
GO

CREATE TABLE dbo.t_btc_price (
specified_date DATE NOT NULL,
ticker_symbol NVARCHAR(25) NOT NULL,
price_at_close FLOAT NOT NULL,

CONSTRAINT PK_t_btc_price PRIMARY KEY CLUSTERED (specified_date ASC)
);
GO