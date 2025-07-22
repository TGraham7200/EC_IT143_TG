USE EC_IT143_DA;
DROP TABLE IF EXISTS dbo.t_btc_price;
GO

CREATE TABLE dbo.t_btc_price (
start_price FLOAT NOT NULL,
end_price FLOAT NOT NULL,
percent_change FLOAT NOT NULL,

CONSTRAINT PK_t_btc_price PRIMARY KEY CLUSTERED (percent_change ASC)
);
GO