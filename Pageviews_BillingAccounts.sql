

Select 

BILL_ACCT_ID,
count(post_prop30) PageViews

From 

EDW_B2B.B2B_MEMBERSHIP_DTL_VW A  Join
(SELECT *

  FROM 
  [cipomniture_djfactiva.2015_10],
  [cipomniture_djfactiva.2014_10],
  [cipomniture_djfactiva.2015_11],
  [cipomniture_djfactiva.2014_11],

where post_prop30 = '0086' and post_page_event = '0'
LIMIT 1000) B on B.post_evar3 = A.EID 

GROUP BY 
BILL_ACCT_ID