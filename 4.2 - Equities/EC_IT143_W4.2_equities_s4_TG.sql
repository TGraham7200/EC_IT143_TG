USE EC_IT143_DA
DROP VIEW IF EXISTS dbo.v_top_etf_gainers;
GO


/******************************************************************************************************************
NAME: dbo.v_top3_etfs
PURPOSE: Create Top 3 ETF's - Load view

MODIFICATION LOG:
Ver		Date		Author		Description
-----	---------	---------	-----------------------------------
1.0		7/21/25		TGRAHAM		1. EC IT143 4.2

Notes:
Th is script exists to help me learn step 4 of 8 in the Answer Focused Approach for T-SQL Data Manipulation

******************************************************************************************************************/


    CREATE VIEW dbo.v_top_etf_gainers AS
WITH unpivoted AS (
    SELECT 
        etf,
        [date],
        price
    FROM (
        SELECT 
            [date], 
            SPY, VOO, IVV, VTI, XLG, QQQ, VUG, IWF,
            IWM, VEA, VXUS, VWO, IEMG, IEFA, IJH,
            VO, IJR, VTV, VIG, SCHD, RSP, XLK, XLE,
            XLF, VGT
        FROM dbo.equity_etfs
    ) AS source
    UNPIVOT (
        price FOR etf IN (
            SPY, VOO, IVV, VTI, XLG, QQQ, VUG, IWF,
            IWM, VEA, VXUS, VWO, IEMG, IEFA, IJH,
            VO, IJR, VTV, VIG, SCHD, RSP, XLK, XLE,
            XLF, VGT
        )
    ) AS unpvt
),
filtered AS (
    SELECT *
    FROM unpivoted
    WHERE [date] IN ('2020-01-02', '2025-07-17')
),
pivoted AS (
    SELECT 
        etf,
        MAX(CASE WHEN [date] = '2020-01-02' THEN price END) AS start_price,
        MAX(CASE WHEN [date] = '2025-07-17' THEN price END) AS end_price
    FROM filtered
    GROUP BY etf
)
SELECT 
    etf,
    start_price,
    end_price,
    ROUND(((end_price - start_price) / start_price) * 100.0, 2) AS percent_change
FROM pivoted;
