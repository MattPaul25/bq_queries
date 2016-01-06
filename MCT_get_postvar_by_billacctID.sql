SELECT b.eid, b.BILL_ACCT_ID, a.post_evar3
FROM  cipomniture_djfactiva.2015_12 a 
     join each [EDW_B2B.B2B_MEMBERSHIP_DTL_VW] b on b.eid = a.post_evar3
WHERE b.BILL_ACCT_ID  = '9ALL017600'
LIMIT 1000