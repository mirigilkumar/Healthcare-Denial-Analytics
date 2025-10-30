
------------------------------------------------------------------
-- Create Database & Use
------------------------------------------------------------------
CREATE DATABASE HealthcareDenialDB;
GO
USE HealthcareDenialDB;
GO

------------------------------------------------------------------
-- Import Files
------------------------------------------------------------------
/* Go to Object Explorer  -> Databases ->  HealthcareDenialDB
	Righ Click databse  and select Tasks -> Import Flat File
	Browse File and import 
*/
GO

------------------------------------------------------------------
--Data Exploration (Data Understanding)
------------------------------------------------------------------
--Check if table loaded correctly
------------------------------------------------------------------
SELECT TOP 10 * 
FROM ClaimDenials;

SELECT COUNT(*) AS Total_Claims  
FROM ClaimDenials;
GO

------------------------------------------------------------------
-- Check Data Quality
------------------------------------------------------------------

SELECT 
	SUM(CASE WHEN Claim_ID  IS NULL THEN 1 ELSE 0 END) missing_claim_id,
	SUM(CASE WHEN Patient_ID IS NULL THEN 1 ELSE 0 END) missing_patient_id,
	SUM(CASE WHEN Denial_Flag = 1 AND Denial_Reason_Code IS NULL  THEN 1 ELSE 0 END) missing_denial
FROM ClaimDenials;
GO

------------------------------------------------------------------
-- Key Summary Matrics
------------------------------------------------------------------
SELECT COUNT(*) AS Total_claims,
SUM(CASE WHEN Denial_Flag = 1 THEN 1 ELSE 0 END) AS Denied_Claims,
CAST(SUM(CASE WHEN Denial_Flag = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS [Denial_Rate %]
FROM ClaimDenials;
GO

------------------------------------------------------------------
-- Denials Per Payer
------------------------------------------------------------------
SELECT Payer_Name, COUNT(*) Total_Claims,
SUM(CASE WHEN Denial_Flag = 1 THEN 1 ELSE 0 END) Denied_Claims,
CAST(SUM(CASE WHEN Denial_Flag = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) [Denial_Rate_%] 
FROM ClaimDenials
GROUP BY Payer_Name
ORDER BY [Denial_Rate_%] DESC;
GO


------------------------------------------------------------------
-- Denials by Reasons
------------------------------------------------------------------
SELECT Denial_Reason_Code, Denial_Reason_Description, 
COUNT(*) Denied_Claims
FROM ClaimDenials
WHERE Denial_Flag = 1
GROUP BY Denial_Reason_Code, Denial_Reason_Description
ORDER BY Denied_Claims DESC;
GO


------------------------------------------------------------------
-- Trend  Over Time
------------------------------------------------------------------
SELECT YEAR(Claim_Submission_Date)[Year], 
DATENAME(Month, Claim_Submission_Date) [Month],
COUNT(*) Total_Claims,
SUM(CASE WHEN Denial_Flag =1 THEN 1 ELSE 0 END) Denial_claims,
CAST(SUM(CASE WHEN Denial_Flag =1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) [Denial_%] 
FROM ClaimDenials
GROUP BY YEAR(Claim_Submission_Date), MONTH(Claim_submission_Date), DATENAME(Month, Claim_Submission_Date)
ORDER BY YEAR(Claim_Submission_Date), MONTH(Claim_submission_Date);
GO

------------------------------------------------------------------
-- Claim Category Analysis
------------------------------------------------------------------
SELECT Claim_Category, COUNT(*) Total_claims,
SUM(CASE WHEN Denial_Flag = 1 THEN 1 ELSE 0 END) Denied_Claims,
CAST(SUM(CASE WHEN Denial_Flag = 1 THEN 1 ELSE 0 END) *100.0 /COUNT(*) AS DECIMAL(5,2)) [Denial_Rate_%]
FROM ClaimDenials
GROUP BY Claim_Category
ORDER BY [Denial_Rate_%];
Go


------------------------------------------------------------------
-- Denial Age days Analysis
------------------------------------------------------------------
SELECT CAST(AVG(Denial_Age_Days) AS DECIMAL(5,2)) Average_Days,
MAX(Denial_Age_Days) Maximum_AR_Days,
MIN(Denial_Age_Days) Minimum_AR_Days
FROM ClaimDenials
WHERE Denial_Age_Days IS NOT NULL;
GO

/* 
--------------------------------------------------------------------
Insight Summary
--------------------------------------------------------------------
Total Claims  - 12000
Denial Claims - 1450
Denial Rate	  - 12.08%
Highest Denial rate Payer  - Blue Cross
Top Denial Reasons - CO-96	Payment adjusted because the patient was covered under a secondary payer
Type of claims  - Professional	8329, Institutional	3671
Average AR Days - 30
--------------------------------------------------------------------


