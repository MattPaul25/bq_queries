Select COMPANY_NAME, BILL_ACCT_ID, COUNT(B.post_prop8) as PageViews

FROM EDW_B2B.B2B_MEMBERSHIP_DTL_VW AS A                  
LEFT JOIN (
  SELECT  FROM    
    cipomniture_djfactiva.2015_11,
    cipomniture_djfactiva.2015_10,
    cipomniture_djfactiva.2015_09,
    cipomniture_djfactiva.2015_08,
    cipomniture_djfactiva.2015_07,
    cipomniture_djfactiva.2015_06,
    cipomniture_djfactiva.2015_05,
    cipomniture_djfactiva.2015_04,
    cipomniture_djfactiva.2015_03,
    cipomniture_djfactiva.2015_02,
    cipomniture_djfactiva.2015_01,
    cipomniture_djfactiva.2014_12
      WHERE post_prop8 LIKE 'board%'
        AND post_page_event = 0) AS B 
    ON A.EID = B.post_evar3
    GROUP BY COMPANY_NAME, BILL_ACCT_ID
    ORDER BY PageViews DESC
LIMIT 100
