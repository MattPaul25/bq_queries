SELECT
    begin_date,
    sum(if(device == 'iPad', units , 0)) as Ipad_Downloads,
    sum(if(device == 'iPhone', units, 0)) as Iphone_downloads,
    sum(units) WSJ_downloads
    FROM  TABLE_DATE_RANGE(itunes_daily.daily_sales_summary,TIMESTAMP('2016-01-01'),TIMESTAMP('2016-01-04'))
    WHERE 
      sku = 'asd'
      AND product_type_identifier = '1F'
      AND begin_date >= '2016-01-01'
      AND begin_date <= '2016-01-05'
    GROUP BY 
      begin_date

    ORDER BY begin_date DESC