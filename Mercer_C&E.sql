 
 Select 
 COMPANY_NAME,
 count(*) as Page_Views
 from cipomniture_djfactiva.2015_10 a join
 (
     SELECT  COMPANY_NAME, EID
     FROM [EDW_B2B.B2B_MEMBERSHIP_DTL_VW]   
      where Bill_acct_id in (
                          '9GUY000100','9MAR001400','9MAR011100',
                          '9MAR012400',	'9MAR015300',	'9WIL000100',	
                          '9MAR016800',	'9LIP000100',	'9NER000100',	
                          '9MAR001900','9OLI000300','9MAR000200'
                      ) 
                      ) b on a.post_evar3 = b.eid
        where click_context like 'Fact_RT_%'
      
         group by COMPANY_NAME             
          order by Page_Views desc