SELECT  
      A.post_prop8 source_code,       
      SUBSTR(A.post_prop8, INSTR(A.post_prop8, '_') + 1) source_name,
      B.BILL_ACCT_ID,  
      B.USER_ID,
      B.Job_Title,
      COUNT(*) AS page_views,
      COUNT(DISTINCT post_visid_high + "-" + post_visid_low + "-" + visit_num) visits,
      COUNT(DISTINCT post_visid_high + "-" + post_visid_low) visitors      
 FROM [cipomniture_djfactiva.2015_11] A JOIN EACH  EDW_B2B.B2B_MEMBERSHIP_DTL_VW B on A.post_evar3 = B.EID 
 where post_evar3  in   
 (SELECT EID FROM [EDW_B2B.B2B_MEMBERSHIP_DTL_VW] 
     where COMPANY_NAME like "%KPMG%")     
     AND post_page_event = "0"
     AND A.post_prop8 not like "%Factiva%"
     AND A.post_prop8 != ""
 
 GROUP BY source_code, source_name,
         B.BILL_ACCT_ID,
         B.USER_ID
         B.Job_Title
 
 ORDER BY page_views DESC
 LIMIT 1000