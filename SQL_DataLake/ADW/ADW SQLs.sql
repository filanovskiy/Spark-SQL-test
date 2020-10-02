BEGIN
  DBMS_STATS.GATHER_SCHEMA_STATS('ADMIN', options=>'GATHER AUTO');
END;
/

--q1.sql--

 WITH customer_total_return AS
   (SELECT sr_customer_sk AS ctr_customer_sk, sr_store_sk AS ctr_store_sk,
           sum(sr_return_amt) AS ctr_total_return
    FROM store_returns, date_dim
    WHERE sr_returned_date_sk = d_date_sk AND d_year = 2000
    GROUP BY sr_customer_sk, sr_store_sk)
 SELECT c_customer_id
   FROM customer_total_return ctr1, store, customer
   WHERE ctr1.ctr_total_return >
    (SELECT avg(ctr_total_return)*1.2
      FROM customer_total_return ctr2
       WHERE ctr1.ctr_store_sk = ctr2.ctr_store_sk)
   AND s_store_sk = ctr1.ctr_store_sk
   AND s_state = 'TN'
   AND ctr1.ctr_customer_sk = c_customer_sk
   ORDER BY c_customer_id 
   fetch first 100 rows only;

--q6.sql--

SELECT state, cnt FROM (
 SELECT a.ca_state state, count(*) cnt
 FROM
    customer_address a, customer c, store_sales s, date_dim d, item i
 WHERE a.ca_address_sk = c.c_current_addr_sk
  AND c.c_customer_sk = s.ss_customer_sk
  AND s.ss_sold_date_sk = d.d_date_sk
  AND s.ss_item_sk = i.i_item_sk
  AND d.d_month_seq =
       (SELECT distinct (d_month_seq) FROM date_dim 
        WHERE d_year = 2001 AND d_moy = 1)
  AND i.i_current_price > 1.2 *
             (SELECT avg(j.i_current_price) FROM item j
              WHERE j.i_category = i.i_category)
 GROUP BY a.ca_state
) x
WHERE cnt >= 10
ORDER BY cnt 
fetch first 100 rows only;

--q30.sql--

 with customer_total_return as
 (select wr_returning_customer_sk as ctr_customer_sk
        ,ca_state as ctr_state,
  sum(wr_return_amt) as ctr_total_return
 from web_returns, date_dim, customer_address
 where wr_returned_date_sk = d_date_sk
   and d_year = 2002
   and wr_returning_addr_sk = ca_address_sk
 group by wr_returning_customer_sk,ca_state)
 select c_customer_id,c_salutation,c_first_name,c_last_name,c_preferred_cust_flag
       ,c_birth_day,c_birth_month,c_birth_year,c_birth_country,c_login,c_email_address
       ,c_last_review_date,ctr_total_return
 from customer_total_return ctr1, customer_address, customer
 where ctr1.ctr_total_return > (select avg(ctr_total_return)*1.2
        from customer_total_return ctr2
                      where ctr1.ctr_state = ctr2.ctr_state)
       and ca_address_sk = c_current_addr_sk
       and ca_state = 'GA'
       and ctr1.ctr_customer_sk = c_customer_sk
 order by c_customer_id,c_salutation,c_first_name,c_last_name,c_preferred_cust_flag
                  ,c_birth_day,c_birth_month,c_birth_year,c_birth_country,c_login,c_email_address
                  ,c_last_review_date,ctr_total_return
fetch first 100 rows only;

--q47.sql--

 with v1 as(
 select i_category, i_brand,
        s_store_name, s_company_name,
        d_year, d_moy,
        sum(ss_sales_price) sum_sales,
        avg(sum(ss_sales_price)) over
          (partition by i_category, i_brand,
                     s_store_name, s_company_name, d_year)
          avg_monthly_sales,
        rank() over
          (partition by i_category, i_brand,
                     s_store_name, s_company_name
           order by d_year, d_moy) rn
 from item, store_sales, date_dim, store
 where ss_item_sk = i_item_sk and
       ss_sold_date_sk = d_date_sk and
       ss_store_sk = s_store_sk and
       (
         d_year = 1999 or
         ( d_year = 1999-1 and d_moy =12) or
         ( d_year = 1999+1 and d_moy =1)
       )
 group by i_category, i_brand,
          s_store_name, s_company_name,
          d_year, d_moy),
 v2 as(
 select v1.i_category, v1.i_brand, v1.s_store_name, v1.s_company_name, v1.d_year, 
                     v1.d_moy, v1.avg_monthly_sales ,v1.sum_sales, v1_lag.sum_sales psum, 
                     v1_lead.sum_sales nsum
 from v1, v1 v1_lag, v1 v1_lead
 where v1.i_category = v1_lag.i_category and
       v1.i_category = v1_lead.i_category and
       v1.i_brand = v1_lag.i_brand and
       v1.i_brand = v1_lead.i_brand and
       v1.s_store_name = v1_lag.s_store_name and
       v1.s_store_name = v1_lead.s_store_name and
       v1.s_company_name = v1_lag.s_company_name and
       v1.s_company_name = v1_lead.s_company_name and
       v1.rn = v1_lag.rn + 1 and
       v1.rn = v1_lead.rn - 1)
 select * from v2
 where  d_year = 1999 and
        avg_monthly_sales > 0 and
        case when avg_monthly_sales > 0 then abs(sum_sales - avg_monthly_sales) / avg_monthly_sales else null end > 0.1
 order by sum_sales - avg_monthly_sales, 3
fetch first 100 rows only;

--q67.sql--

 select * from
     (select i_category, i_class, i_brand, i_product_name, d_year, d_qoy, d_moy, s_store_id,
             sumsales, rank() over (partition by i_category order by sumsales desc) rk
      from
         (select i_category, i_class, i_brand, i_product_name, d_year, d_qoy, d_moy,
                 s_store_id, sum(coalesce(ss_sales_price*ss_quantity,0)) sumsales
          from store_sales, date_dim, store, item
        where  ss_sold_date_sk=d_date_sk
           and ss_item_sk=i_item_sk
           and ss_store_sk = s_store_sk
           and d_month_seq between 1200 and 1200+11
        group by rollup(i_category, i_class, i_brand, i_product_name, d_year, d_qoy,
                        d_moy,s_store_id))dw1) dw2
 where rk <= 100
 order by
   i_category, i_class, i_brand, i_product_name, d_year,
   d_qoy, d_moy, s_store_id, sumsales, rk
fetch first 100 rows only;
          
--q88.sql--

 select  *
 from
   (select count(*) h8_30_to_9
    from store_sales, household_demographics , time_dim, store
    where ss_sold_time_sk = time_dim.t_time_sk
     and ss_hdemo_sk = household_demographics.hd_demo_sk
     and ss_store_sk = s_store_sk
     and time_dim.t_hour = 8
     and time_dim.t_minute >= 30
     and ((household_demographics.hd_dep_count = 4 and household_demographics.hd_vehicle_count<=4+2) or
          (household_demographics.hd_dep_count = 2 and household_demographics.hd_vehicle_count<=2+2) or
          (household_demographics.hd_dep_count = 0 and household_demographics.hd_vehicle_count<=0+2))
     and store.s_store_name = 'ese') s1 cross join
   (select count(*) h9_to_9_30
    from store_sales, household_demographics , time_dim, store
    where ss_sold_time_sk = time_dim.t_time_sk
      and ss_hdemo_sk = household_demographics.hd_demo_sk
      and ss_store_sk = s_store_sk
      and time_dim.t_hour = 9
      and time_dim.t_minute < 30
      and ((household_demographics.hd_dep_count = 4 and household_demographics.hd_vehicle_count<=4+2) or
          (household_demographics.hd_dep_count = 2 and household_demographics.hd_vehicle_count<=2+2) or
          (household_demographics.hd_dep_count = 0 and household_demographics.hd_vehicle_count<=0+2))
      and store.s_store_name = 'ese') s2 cross join
 (select count(*) h9_30_to_10
 from store_sales, household_demographics , time_dim, store
 where ss_sold_time_sk = time_dim.t_time_sk
     and ss_hdemo_sk = household_demographics.hd_demo_sk
     and ss_store_sk = s_store_sk
     and time_dim.t_hour = 9
     and time_dim.t_minute >= 30
     and ((household_demographics.hd_dep_count = 4 and household_demographics.hd_vehicle_count<=4+2) or
          (household_demographics.hd_dep_count = 2 and household_demographics.hd_vehicle_count<=2+2) or
          (household_demographics.hd_dep_count = 0 and household_demographics.hd_vehicle_count<=0+2))
     and store.s_store_name = 'ese') s3 cross join
 (select count(*) h10_to_10_30
 from store_sales, household_demographics , time_dim, store
 where ss_sold_time_sk = time_dim.t_time_sk
     and ss_hdemo_sk = household_demographics.hd_demo_sk
     and ss_store_sk = s_store_sk
     and time_dim.t_hour = 10
     and time_dim.t_minute < 30
     and ((household_demographics.hd_dep_count = 4 and household_demographics.hd_vehicle_count<=4+2) or
          (household_demographics.hd_dep_count = 2 and household_demographics.hd_vehicle_count<=2+2) or
          (household_demographics.hd_dep_count = 0 and household_demographics.hd_vehicle_count<=0+2))
     and store.s_store_name = 'ese') s4 cross join
 (select count(*) h10_30_to_11
 from store_sales, household_demographics , time_dim, store
 where ss_sold_time_sk = time_dim.t_time_sk
     and ss_hdemo_sk = household_demographics.hd_demo_sk
     and ss_store_sk = s_store_sk
     and time_dim.t_hour = 10
     and time_dim.t_minute >= 30
     and ((household_demographics.hd_dep_count = 4 and household_demographics.hd_vehicle_count<=4+2) or
          (household_demographics.hd_dep_count = 2 and household_demographics.hd_vehicle_count<=2+2) or
          (household_demographics.hd_dep_count = 0 and household_demographics.hd_vehicle_count<=0+2))
     and store.s_store_name = 'ese') s5 cross join
 (select count(*) h11_to_11_30
 from store_sales, household_demographics , time_dim, store
 where ss_sold_time_sk = time_dim.t_time_sk
     and ss_hdemo_sk = household_demographics.hd_demo_sk
     and ss_store_sk = s_store_sk
     and time_dim.t_hour = 11
     and time_dim.t_minute < 30
     and ((household_demographics.hd_dep_count = 4 and household_demographics.hd_vehicle_count<=4+2) or
          (household_demographics.hd_dep_count = 2 and household_demographics.hd_vehicle_count<=2+2) or
          (household_demographics.hd_dep_count = 0 and household_demographics.hd_vehicle_count<=0+2))
     and store.s_store_name = 'ese') s6 cross join
 (select count(*) h11_30_to_12
 from store_sales, household_demographics , time_dim, store
 where ss_sold_time_sk = time_dim.t_time_sk
     and ss_hdemo_sk = household_demographics.hd_demo_sk
     and ss_store_sk = s_store_sk
     and time_dim.t_hour = 11
     and time_dim.t_minute >= 30
     and ((household_demographics.hd_dep_count = 4 and household_demographics.hd_vehicle_count<=4+2) or
          (household_demographics.hd_dep_count = 2 and household_demographics.hd_vehicle_count<=2+2) or
          (household_demographics.hd_dep_count = 0 and household_demographics.hd_vehicle_count<=0+2))
     and store.s_store_name = 'ese') s7 cross join
 (select count(*) h12_to_12_30
 from store_sales, household_demographics , time_dim, store
 where ss_sold_time_sk = time_dim.t_time_sk
     and ss_hdemo_sk = household_demographics.hd_demo_sk
     and ss_store_sk = s_store_sk
     and time_dim.t_hour = 12
     and time_dim.t_minute < 30
     and ((household_demographics.hd_dep_count = 4 and household_demographics.hd_vehicle_count<=4+2) or
          (household_demographics.hd_dep_count = 2 and household_demographics.hd_vehicle_count<=2+2) or
          (household_demographics.hd_dep_count = 0 and household_demographics.hd_vehicle_count<=0+2))
     and store.s_store_name = 'ese') s8;