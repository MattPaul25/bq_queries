SELECT
    geo.country,
    SUM(CASE WHEN product_type_identifier = '1F'THEN units END) Overall_Downloads,
    SUM(CASE WHEN product_type_identifier = '7F' THEN units END) Overall_Updates
  FROM
    [itunes.weekly_newsstand] tunes join each itunes.country_code_region geo
    on tunes.country_code=geo.country_Code
    WHERE
    sku = 'asd'    /*filters for the wsj app*/
    AND geo.region ="Asia Pacific" 
    AND (download_date > '2015-09-30' AND download_date < '2015-11-01')
  GROUP BY
    geo.country
  
  ORDER BY Overall_Downloads desc