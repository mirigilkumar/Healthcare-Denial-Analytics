-- inspect top 10 rows from table
SELECT TOP 10 * FROM ClaimDenials;
GO

-- Count Total  Claims
SELECT COUNT(*) AS [Total number of claims] FROM ClaimDenials;
GO

-- Find Total Denied Claims
SELECT COUNT(*) AS [Total Denied Claims] 
FROM ClaimDenials
WHERE Claim_Status LIKE '%Denied%';
GO


-- Denials per Payer
SELECT Payer_Name, COUNT(Denial_Reason_Code)  AS Denied_claims 
FROM ClaimDenials
WHERE Denial_Reason_Code IS NOT NULL AND Denial_Reason_Code LIKE '%PR-1%'
GROUP BY Payer_Name
ORDER BY Denied_claims DESC;

--Distinct Denial Codes
SELECT DISTINCT Denial_Reason_Code FROM ClaimDenials;
GO

-- TOP 5 Denial codes
SELECT TOP 5 Denial_Reason_Code, COUNT(*) No_of_claims 
FROM ClaimDenials
WHERE Denial_Reason_Code IS NOT NULL AND Denial_Reason_Code NOT LIKE 'PR-1'
GROUP BY Denial_Reason_Code
ORDER BY No_of_claims DESC;
