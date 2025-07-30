/*****************************************************************************************************************
NAME:    5.2 Create Answers to Questions
PURPOSE: Providing SQL queries to answer the questions for my Equities Community

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     07/28/2025   TGRAHAM       1. Built this script for EC IT143 5.2




NOTES: 
This is where I talk about what this script is, why I built it, and other stuff...
 
******************************************************************************************************************/
USE EC_IT143_DA
GO

-- Q1: How much did VGT and QQQ gain or lose (in percentage form) in 2024?
-- A1:

WITH ordered_2024 AS (
    SELECT 
        [Date], 
        QQQ, 
        VGT,
        ROW_NUMBER() OVER (ORDER BY [Date] ASC) AS rn_start,
        ROW_NUMBER() OVER (ORDER BY [Date] DESC) AS rn_end
    FROM dbo.equity_etfs
    WHERE YEAR([Date]) = 2024
),
start_end_prices AS (
    SELECT
        MAX(CASE WHEN rn_start = 1 THEN QQQ END) AS QQQ_Start,
        MAX(CASE WHEN rn_end = 1 THEN QQQ END) AS QQQ_End,
        MAX(CASE WHEN rn_start = 1 THEN VGT END) AS VGT_Start,
        MAX(CASE WHEN rn_end = 1 THEN VGT END) AS VGT_End
    FROM ordered_2024
)
SELECT
    QQQ_Start,
    QQQ_End,
    ROUND(((QQQ_End - QQQ_Start) / QQQ_Start) * 100.0, 2) AS QQQ_Percent_Change,
    VGT_Start,
    VGT_End,
    ROUND(((VGT_End - VGT_Start) / VGT_Start) * 100.0, 2) AS VGT_Percent_Change
FROM start_end_prices;

-- Q2: 2022 was a bad year for the stock market. How much did SPY (tracks S&P 500) lose compared to QQQ (tracks Nasdaq)?
-- A2: 

WITH ordered_2022 AS (
    SELECT 
        [Date], 
        SPY, 
        QQQ,
        ROW_NUMBER() OVER (ORDER BY [Date] ASC) AS rn_start,
        ROW_NUMBER() OVER (ORDER BY [Date] DESC) AS rn_end
    FROM dbo.equity_etfs
    WHERE YEAR([Date]) = 2022
),
start_end_prices AS (
    SELECT
        MAX(CASE WHEN rn_start = 1 THEN SPY END) AS SPY_Start,
        MAX(CASE WHEN rn_end = 1 THEN SPY END) AS SPY_End,
        MAX(CASE WHEN rn_start = 1 THEN QQQ END) AS QQQ_Start,
        MAX(CASE WHEN rn_end = 1 THEN QQQ END) AS QQQ_End
    FROM ordered_2022
)
SELECT
    SPY_Start,
    SPY_End,
    ROUND(((SPY_End - SPY_Start) / SPY_Start) * 100.0, 2) AS SPY_Percent_Change,
    QQQ_Start,
    QQQ_End,
    ROUND(((QQQ_End - QQQ_Start) / QQQ_Start) * 100.0, 2) AS QQQ_Percent_Change,
    ROUND(
        ((QQQ_End - QQQ_Start) / QQQ_Start) * 100.0
        - ((SPY_End - SPY_Start) / SPY_Start) * 100.0,
        2
    ) AS QQQ_vs_SPY_Difference
FROM start_end_prices;

-- Q3: What Mag 7 company/stock has performed the best over the past 3 years?
-- A3: 

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
    ) * 100 AS TSLA_PCT_CHANGE

    -- Q4: In 2023, what was the highest performing Mag 7 stock?
    -- A4: 

SELECT
    (
        ((SELECT TOP 1 AAPL FROM dbo.mag7 WHERE [Date] = '2023-12-29') - 
        (SELECT TOP 1 AAPL FROM dbo.mag7 WHERE [Date] = '2023-1-3')) / 
        (SELECT TOP 1 AAPL FROM dbo.mag7 WHERE [Date] = '2023-1-3')
    ) * 100 AS APPL_PCT_CHANGE,
    (
        ((SELECT TOP 1 MSFT FROM dbo.mag7 WHERE [Date] = '2023-12-29') - 
        (SELECT TOP 1 MSFT FROM dbo.mag7 WHERE [Date] = '2023-1-3')) / 
        (SELECT TOP 1 MSFT FROM dbo.mag7 WHERE [Date] = '2023-1-3')
    ) * 100 AS MSFT_PCT_CHANGE,
    (
        ((SELECT TOP 1 GOOGL FROM dbo.mag7 WHERE [Date] = '2023-12-29') - 
        (SELECT TOP 1 GOOGL FROM dbo.mag7 WHERE [Date] = '2023-1-3')) / 
        (SELECT TOP 1 GOOGL FROM dbo.mag7 WHERE [Date] = '2023-1-3')
    ) * 100 AS GOOGL_PCT_CHANGE,
    (
        ((SELECT TOP 1 AMZN FROM dbo.mag7 WHERE [Date] = '2023-12-29') - 
        (SELECT TOP 1 AMZN FROM dbo.mag7 WHERE [Date] = '2023-1-3')) / 
        (SELECT TOP 1 AMZN FROM dbo.mag7 WHERE [Date] = '2023-1-3')
    ) * 100 AS AMZN_PCT_CHANGE,
    (
        ((SELECT TOP 1 META FROM dbo.mag7 WHERE [Date] = '2023-12-29') - 
        (SELECT TOP 1 META FROM dbo.mag7 WHERE [Date] = '2023-1-3')) / 
        (SELECT TOP 1 META FROM dbo.mag7 WHERE [Date] = '2023-1-3')
    ) * 100 AS META_PCT_CHANGE,
    (
        ((SELECT TOP 1 NVDA FROM dbo.mag7 WHERE [Date] = '2023-12-29') - 
        (SELECT TOP 1 NVDA FROM dbo.mag7 WHERE [Date] = '2023-1-3')) / 
        (SELECT TOP 1 NVDA FROM dbo.mag7 WHERE [Date] = '2023-1-3')
    ) * 100 AS NVDA_PCT_CHANGE,
    (
        ((SELECT TOP 1 TSLA FROM dbo.mag7 WHERE [Date] = '2023-12-29') - 
        (SELECT TOP 1 TSLA FROM dbo.mag7 WHERE [Date] = '2023-1-3')) / 
        (SELECT TOP 1 TSLA FROM dbo.mag7 WHERE [Date] = '2023-1-3')
    ) * 100 AS TSLA_PCT_CHANGE;

