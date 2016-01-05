SELECT
SUBSTR(date_time, 1, 7) year_month, 
COUNT(*) page_views,
COUNT(DISTINCT post_visid_high + "-" + post_visid_low + "-" + visit_num) visits,
      COUNT(DISTINCT post_visid_high + "-" + post_visid_low) visitors  
FROM
  (SELECT date_time, post_evar3, post_visid_high, post_visid_low, visit_num, post_page_event FROM  EDW_B2B.B2B_MEMBERSHIP_DTL_VW a join each
          (select * from 
          cipomniture_djfactiva.2015_12,
          cipomniture_djfactiva.2015_11, 
          cipomniture_djfactiva.2015_10) b
          on a.EID = b.post_evar3
     Where b.post_page_event = "0" and  a.BILL_ACCT_ID = "9DEU004600")
  
GROUP BY year_month
ORDER BY year_month ASC
