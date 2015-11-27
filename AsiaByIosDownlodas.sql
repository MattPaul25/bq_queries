SELECT
    geo.country Country,
    SUM(CASE WHEN product_type_identifier = '1F'THEN units END) Downloads,
    SUM(CASE WHEN product_type_identifier = '7F' THEN units END) Updates
    
  FROM
    [itunes.weekly_newsstand] tunes join each itunes.country_code_region geo
    on tunes.country_code=geo.country_Code
    WHERE
    sku = 'asd'    /*filters for the wsj app*/
    AND geo.region ="Asia Pacific" 
    AND (download_date > '2015-09-30' AND download_date < '2015-11-01')
  GROUP BY
    Country
  
  ORDER BY Downloads desc