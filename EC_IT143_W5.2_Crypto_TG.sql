/*****************************************************************************************************************
NAME:    5.2 Create Answers to Questions
PURPOSE: Providing SQL queries to answer the questions for my Crypto Community

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     07/28/2025   TGRAHAM       1. Built this script for EC IT143 5.2




NOTES: 
This is where I talk about what this script is, why I built it, and other stuff...
 
******************************************************************************************************************/
USE EC_IT143_DA
GO

    -- Q5: For the year 2024, which cryptocurrency (Bitcoin or Ethereum) had the best performance and what was the percentage gain or lost?
    -- A5:

SELECT
    (
        ((SELECT TOP 1 [close] FROM dbo.BTC WHERE [Date] = '2024-12-31') - 
        (SELECT TOP 1 [close] FROM dbo.BTC WHERE [Date] = '2024-1-1')) / 
        (SELECT TOP 1 [close] FROM dbo.BTC WHERE [Date] = '2024-1-1')
    ) * 100 AS BTC_PCT_CHANGE,
    (
        ((SELECT TOP 1 [close] FROM dbo.ETH WHERE [Date] = '2024-12-31') - 
        (SELECT TOP 1 [close] FROM dbo.ETH WHERE [Date] = '2024-1-1')) / 
        (SELECT TOP 1 [close] FROM dbo.ETH WHERE [Date] = '2024-1-1')
    ) * 100 AS ETH_PCT_CHANGE

    -- Q6: Have you looked into how Bitcoin and Ethereum price trends compare with the performance of the Magnificent 7 stocks over the same time period? It would be interesting to see if there are any correlations or contrasting patterns between crypto and traditional equities.
    -- A6:
   
SELECT
    (
        ((SELECT TOP 1 AAPL FROM dbo.mag7 WHERE [Date] = '2025-7-15') - 
        (SELECT TOP 1 AAPL FROM dbo.mag7 WHERE [Date] = '2022-7-15')) / 
        (SELECT TOP 1 AAPL FROM dbo.mag7 WHERE [Date] = '2022-7-15')
    ) * 100 AS APPL_PCT_CHANGE,
    (
        ((SELECT TOP 1 MSFT FROM dbo.mag7 WHERE [Date] = '2025-7-15') - 
        (SELECT TOP 1 MSFT FROM dbo.mag7 WHERE [Date] = '2022-7-15')) / 
        (SELECT TOP 1 MSFT FROM dbo.mag7 WHERE [Date] = '2022-7-15')
    ) * 100 AS MSFT_PCT_CHANGE,
    (
        ((SELECT TOP 1 GOOGL FROM dbo.mag7 WHERE [Date] = '2025-7-15') - 
        (SELECT TOP 1 GOOGL FROM dbo.mag7 WHERE [Date] = '2022-7-15')) / 
        (SELECT TOP 1 GOOGL FROM dbo.mag7 WHERE [Date] = '2022-7-15')
    ) * 100 AS GOOGL_PCT_CHANGE,
    (
        ((SELECT TOP 1 AMZN FROM dbo.mag7 WHERE [Date] = '2025-7-15') - 
        (SELECT TOP 1 AMZN FROM dbo.mag7 WHERE [Date] = '2022-7-15')) / 
        (SELECT TOP 1 AMZN FROM dbo.mag7 WHERE [Date] = '2022-7-15')
    ) * 100 AS AMZN_PCT_CHANGE,
    (
        ((SELECT TOP 1 META FROM dbo.mag7 WHERE [Date] = '2025-7-15') - 
        (SELECT TOP 1 META FROM dbo.mag7 WHERE [Date] = '2022-7-15')) / 
        (SELECT TOP 1 META FROM dbo.mag7 WHERE [Date] = '2022-7-15')
    ) * 100 AS META_PCT_CHANGE,
    (
        ((SELECT TOP 1 NVDA FROM dbo.mag7 WHERE [Date] = '2025-7-15') - 
        (SELECT TOP 1 NVDA FROM dbo.mag7 WHERE [Date] = '2022-7-15')) / 
        (SELECT TOP 1 NVDA FROM dbo.mag7 WHERE [Date] = '2022-7-15')
    ) * 100 AS NVDA_PCT_CHANGE,
    (
        ((SELECT TOP 1 TSLA FROM dbo.mag7 WHERE [Date] = '2025-7-15') - 
        (SELECT TOP 1 TSLA FROM dbo.mag7 WHERE [Date] = '2022-7-15')) / 
        (SELECT TOP 1 TSLA FROM dbo.mag7 WHERE [Date] = '2022-7-15')
    ) * 100 AS TSLA_PCT_CHANGE,
    (
        ((SELECT TOP 1 [close] FROM dbo.BTC WHERE [Date] = '2024-12-31') - 
        (SELECT TOP 1 [close] FROM dbo.BTC WHERE [Date] = '2024-1-1')) / 
        (SELECT TOP 1 [close] FROM dbo.BTC WHERE [Date] = '2024-1-1')
    ) * 100 AS BTC_PCT_CHANGE,
    (
        ((SELECT TOP 1 [close] FROM dbo.ETH WHERE [Date] = '2024-12-31') - 
        (SELECT TOP 1 [close] FROM dbo.ETH WHERE [Date] = '2024-1-1')) / 
        (SELECT TOP 1 [close] FROM dbo.ETH WHERE [Date] = '2024-1-1')
    ) * 100 AS ETH_PCT_CHANGE

    -- Q7: On which date in the past five years did Bitcoin experience its highest trading volume?
    -- A7:

SELECT TOP 1 [date], volume
FROM dbo.BTC
WHERE [date] BETWEEN '2020-07-15' AND '2025-07-15'
ORDER BY volume DESC;

    -- Q8: Is it possible to get what the trend was that preceded an increase in the value of the coins? When did each coin have the highest value?
    -- A8:

SELECT TOP 1 [date], [close]
FROM dbo.BTC
WHERE [date] BETWEEN '2010-07-14' AND '2025-07-15'
ORDER BY [close] DESC;


