--q11.sql--

 with year_total as (
 select c_customer_id customer_id
       ,c_first_name customer_first_name
       ,c_last_name customer_last_name
       ,c_preferred_cust_flag customer_preferred_cust_flag
       ,c_birth_country customer_birth_country
       ,c_login customer_login
       ,c_email_address customer_email_address
       ,d_year dyear
       ,sum(ss_ext_list_price-ss_ext_discount_amt) year_total
       ,'s' sale_type
 from customer, store_sales, date_dim
 where c_customer_sk = ss_customer_sk
   and ss_sold_date_sk = d_date_sk
 group by c_customer_id
         ,c_first_name
         ,c_last_name
         ,c_preferred_cust_flag
         ,c_birth_country
         ,c_login
         ,c_email_address
         ,d_year
 union all
 select c_customer_id customer_id
       ,c_first_name customer_first_name
       ,c_last_name customer_last_name
       ,c_preferred_cust_flag customer_preferred_cust_flag
       ,c_birth_country customer_birth_country
       ,c_login customer_login
       ,c_email_address customer_email_address
       ,d_year dyear
       ,sum(ws_ext_list_price-ws_ext_discount_amt) year_total
       ,'w' sale_type
 from customer, web_sales, date_dim
 where c_customer_sk = ws_bill_customer_sk
   and ws_sold_date_sk = d_date_sk
 group by
    c_customer_id, c_first_name, c_last_name, c_preferred_cust_flag, c_birth_country,
    c_login, c_email_address, d_year)
 select
    t_s_secyear.customer_id
   ,t_s_secyear.customer_first_name
   ,t_s_secyear.customer_last_name
   ,t_s_secyear.customer_preferred_cust_flag
 from year_total t_s_firstyear
     ,year_total t_s_secyear
     ,year_total t_w_firstyear
     ,year_total t_w_secyear
 where t_s_secyear.customer_id = t_s_firstyear.customer_id
         and t_s_firstyear.customer_id = t_w_secyear.customer_id
         and t_s_firstyear.customer_id = t_w_firstyear.customer_id
         and t_s_firstyear.sale_type = 's'
         and t_w_firstyear.sale_type = 'w'
         and t_s_secyear.sale_type = 's'
         and t_w_secyear.sale_type = 'w'
         and t_s_firstyear.dyear = 2001
         and t_s_secyear.dyear = 2001+1
         and t_w_firstyear.dyear = 2001
         and t_w_secyear.dyear = 2001+1
         and t_s_firstyear.year_total > 0
         and t_w_firstyear.year_total > 0
         and case when t_w_firstyear.year_total > 0 then t_w_secyear.year_total / t_w_firstyear.year_total else 0.0 end
             > case when t_s_firstyear.year_total > 0 then t_s_secyear.year_total / t_s_firstyear.year_total else 0.0 end
 order by 
         t_s_secyear.customer_id
         ,t_s_secyear.customer_first_name
         ,t_s_secyear.customer_last_name
         ,
t_s_secyear.customer_preferred_cust_flag
fetch first 100 rows only;

--q12.sql--

 select i_item_id,
  i_item_desc, i_category, i_class, i_current_price,
  sum(ws_ext_sales_price) as itemrevenue,
  sum(ws_ext_sales_price)*100/sum(sum(ws_ext_sales_price)) over
          (partition by i_class) as revenueratio
 from
	web_sales, item, date_dim
 where
	ws_item_sk = i_item_sk
  	and i_category in ('Sports', 'Books', 'Home')
  	and ws_sold_date_sk = d_date_sk
	and to_date(d_date, 'yyyy-mm-dd') between to_date('1999-02-22', 'yyyy-mm-dd')
				and (to_date('1999-02-22', 'yyyy-mm-dd')) + 30
 group by
	i_item_id, i_item_desc, i_category, i_class, i_current_price
 order by
	i_category, i_class, i_item_id, i_item_desc, revenueratio
fetch first 100 rows only;

--q13.sql--

 select avg(ss_quantity)
       ,avg(ss_ext_sales_price)
       ,avg(ss_ext_wholesale_cost)
       ,sum(ss_ext_wholesale_cost)
 from store_sales
     ,store
     ,customer_demographics
     ,household_demographics
     ,customer_address
     ,date_dim
 where s_store_sk = ss_store_sk
 and  ss_sold_date_sk = d_date_sk and d_year = 2001
 and((ss_hdemo_sk=hd_demo_sk
  and cd_demo_sk = ss_cdemo_sk
  and cd_marital_status = 'M'
  and cd_education_status = 'Advanced Degree'
  and ss_sales_price between 100.00 and 150.00
  and hd_dep_count = 3
     )or
     (ss_hdemo_sk=hd_demo_sk
  and cd_demo_sk = ss_cdemo_sk
  and cd_marital_status = 'S'
  and cd_education_status = 'College'
  and ss_sales_price between 50.00 and 100.00
  and hd_dep_count = 1
     ) or
     (ss_hdemo_sk=hd_demo_sk
  and cd_demo_sk = ss_cdemo_sk
  and cd_marital_status = 'W'
  and cd_education_status = '2 yr Degree'
  and ss_sales_price between 150.00 and 200.00
  and hd_dep_count = 1
     ))
 and((ss_addr_sk = ca_address_sk
  and ca_country = 'United States'
  and ca_state in ('TX', 'OH', 'TX')
  and ss_net_profit between 100 and 200
     ) or
     (ss_addr_sk = ca_address_sk
  and ca_country = 'United States'
  and ca_state in ('OR', 'NM', 'KY')
  and ss_net_profit between 150 and 300
     ) or
     (ss_addr_sk = ca_address_sk
  and ca_country = 'United States'
  and ca_state in ('VA', 'TX', 'MS')
  and ss_net_profit between 50 and 250
     ));
            
--q19.sql--

 select i_brand_id brand_id, i_brand brand, i_manufact_id, i_manufact,
 	sum(ss_ext_sales_price) ext_price
 from date_dim, store_sales, item,customer,customer_address,store
 where d_date_sk = ss_sold_date_sk
   and ss_item_sk = i_item_sk
   and i_manager_id = 8
   and d_moy = 11
   and d_year = 1998
   and ss_customer_sk = c_customer_sk
   and c_current_addr_sk = ca_address_sk
   and substr(ca_zip,1,5) <> substr(s_zip,1,5)
   and ss_store_sk = s_store_sk
 group by i_brand, i_brand_id, i_manufact_id, i_manufact
 order by ext_price desc, brand, brand_id, i_manufact_id, i_manufact
 fetch first 100 rows only;

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

   --q21.sql--

 select * from(
   select w_warehouse_name, i_item_id,
          sum(case when (cast(d_date as date) < cast ('2000-03-11' as date))
	                  then inv_quantity_on_hand
                   else 0 end) as inv_before,
          sum(case when (cast(d_date as date) >= cast ('2000-03-11' as date))
                   then inv_quantity_on_hand
                   else 0 end) as inv_after
   from inventory, warehouse, item, date_dim
   where i_current_price between 0.99 and 1.49
     and i_item_sk          = inv_item_sk
     and inv_warehouse_sk   = w_warehouse_sk
     and inv_date_sk        = d_date_sk
     and to_date(d_date, 'yyyy-mm-dd') between 
     to_date('2000-03-11', 'yyyy-mm-dd') - 30
	 and to_date('2000-03-11', 'yyyy-mm-dd') + 30
   group by w_warehouse_name, i_item_id) x
 where (case when inv_before > 0
             then inv_after / inv_before
             else null
             end) between 2.0/3.0 and 3.0/2.0
 order by w_warehouse_name, i_item_id
 fetch first 100 rows only;
            
--q22.sql--

 select i_product_name, i_brand, i_class, i_category, avg(inv_quantity_on_hand) qoh
       from inventory, date_dim, item, warehouse
       where inv_date_sk=d_date_sk
              and inv_item_sk=i_item_sk
              and inv_warehouse_sk = w_warehouse_sk
              and d_month_seq between 1200 and 1200 + 11
       group by rollup(i_product_name, i_brand, i_class, i_category)
 order by qoh, i_product_name, i_brand, i_class, i_category
fetch first 100 rows only;

--q24a.sql--

 with ssales as
 (select c_last_name, c_first_name, s_store_name, ca_state, s_state, i_color,
        i_current_price, i_manager_id, i_units, i_size, sum(ss_net_paid) netpaid
 from store_sales, store_returns, store, item, customer, customer_address
 where ss_ticket_number = sr_ticket_number
   and ss_item_sk = sr_item_sk
   and ss_customer_sk = c_customer_sk
   and ss_item_sk = i_item_sk
   and ss_store_sk = s_store_sk
   and c_birth_country = upper(ca_country)
   and s_zip = ca_zip
 and s_market_id = 8
 group by c_last_name, c_first_name, s_store_name, ca_state, s_state, i_color,
          i_current_price, i_manager_id, i_units, i_size)
 select c_last_name, c_first_name, s_store_name, sum(netpaid) paid
 from ssales
 where i_color = 'pale'
 group by c_last_name, c_first_name, s_store_name
 having sum(netpaid) > (select 0.05*avg(netpaid) from ssales);

 --q24b.sql--

 with ssales as
 (select c_last_name, c_first_name, s_store_name, ca_state, s_state, i_color,
         i_current_price, i_manager_id, i_units, i_size, sum(ss_net_paid) netpaid
 from store_sales, store_returns, store, item, customer, customer_address
 where ss_ticket_number = sr_ticket_number
   and ss_item_sk = sr_item_sk
   and ss_customer_sk = c_customer_sk
   and ss_item_sk = i_item_sk
   and ss_store_sk = s_store_sk
   and c_birth_country = upper(ca_country)
   and s_zip = ca_zip
   and s_market_id = 8
 group by c_last_name, c_first_name, s_store_name, ca_state, s_state,
          i_color, i_current_price, i_manager_id, i_units, i_size)
 select c_last_name, c_first_name, s_store_name, sum(netpaid) paid
 from ssales
 where i_color = 'chiffon'
 group by c_last_name, c_first_name, s_store_name
 having sum(netpaid) > (select 0.05*avg(netpaid) from ssales);
          
--q27.sql--

 select i_item_id,
        s_state, grouping(s_state) g_state,
        avg(ss_quantity) agg1,
        avg(ss_list_price) agg2,
        avg(ss_coupon_amt) agg3,
        avg(ss_sales_price) agg4
 from store_sales, customer_demographics, date_dim, store, item
 where ss_sold_date_sk = d_date_sk and
       ss_item_sk = i_item_sk and
       ss_store_sk = s_store_sk and
       ss_cdemo_sk = cd_demo_sk and
       cd_gender = 'M' and
       cd_marital_status = 'S' and
       cd_education_status = 'College' and
       d_year = 2002 and
       s_state in ('TN','TN', 'TN', 'TN', 'TN', 'TN')
 group by rollup (i_item_id, s_state)
 order by i_item_id, s_state
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
            
--q93.sql--

 select ss_customer_sk, sum(act_sales) sumsales
 from (select
         ss_item_sk, ss_ticket_number, ss_customer_sk,
         case when sr_return_quantity is not null then (ss_quantity-sr_return_quantity)*ss_sales_price
                                                  else (ss_quantity*ss_sales_price) end act_sales
       from store_sales
       left outer join store_returns
       on (sr_item_sk = ss_item_sk and sr_ticket_number = ss_ticket_number),
       reason
       where sr_reason_sk = r_reason_sk and r_reason_desc = 'reason 28') t
 group by ss_customer_sk
 order by sumsales, ss_customer_sk
 fetch first 100 rows only;
            
--q94.sql--

 select
    count(distinct ws_order_number)
   ,sum(ws_ext_ship_cost) 
   ,sum(ws_net_profit)
 from
    web_sales ws1, date_dim, customer_address, web_site
 where
  to_date(d_date, 'yyyy-mm-dd') between 
     to_date('1999-02-01', 'yyyy-mm-dd')
 and to_date('1999-02-01', 'yyyy-mm-dd') + 60
 and ws1.ws_ship_date_sk = d_date_sk
 and ws1.ws_ship_addr_sk = ca_address_sk
 and ca_state = 'IL'
 and ws1.ws_web_site_sk = web_site_sk
 and web_company_name = 'pri'
 and exists (select *
             from web_sales ws2
             where ws1.ws_order_number = ws2.ws_order_number
               and ws1.ws_warehouse_sk <> ws2.ws_warehouse_sk)
 and not exists(select *
                from web_returns wr1
                where ws1.ws_order_number = wr1.wr_order_number)
 order by count(distinct ws_order_number)
 fetch first 100 rows only;
            
--q95.sql--

 with ws_wh as
 (select ws1.ws_order_number,ws1.ws_warehouse_sk wh1,ws2.ws_warehouse_sk wh2
  from web_sales ws1,web_sales ws2
  where ws1.ws_order_number = ws2.ws_order_number
    and ws1.ws_warehouse_sk <> ws2.ws_warehouse_sk)
 select
    count(distinct ws_order_number)
   ,sum(ws_ext_ship_cost)
   ,sum(ws_net_profit)
 from
    web_sales ws1, date_dim, customer_address, web_site
 where
      to_date(d_date, 'yyyy-mm-dd') between 
     to_date('1999-02-01', 'yyyy-mm-dd')
 and to_date('1999-02-01', 'yyyy-mm-dd') + 60
 and ws1.ws_ship_date_sk = d_date_sk
 and ws1.ws_ship_addr_sk = ca_address_sk
 and ca_state = 'IL'
 and ws1.ws_web_site_sk = web_site_sk
 and web_company_name = 'pri'
 and ws1.ws_order_number in (select ws_order_number
                             from ws_wh)
 and ws1.ws_order_number in (select wr_order_number
                             from web_returns,ws_wh
                             where wr_order_number = ws_wh.ws_order_number)
 order by count(distinct ws_order_number)
fetch first 100 rows only;
            
--q96.sql--

 select count(*)
 from store_sales, household_demographics, time_dim, store
 where ss_sold_time_sk = time_dim.t_time_sk
     and ss_hdemo_sk = household_demographics.hd_demo_sk
     and ss_store_sk = s_store_sk
     and time_dim.t_hour = 20
     and time_dim.t_minute >= 30
     and household_demographics.hd_dep_count = 7
     and store.s_store_name = 'ese'
 order by count(*)
fetch first 100 rows only;
            
--q98.sql--

select i_item_desc, i_category, i_class, i_current_price
      ,sum(ss_ext_sales_price) as itemrevenue
      ,sum(ss_ext_sales_price)*100/sum(sum(ss_ext_sales_price)) over
          (partition by i_class) as revenueratio
from
	 store_sales, item, date_dim
where
	ss_item_sk = i_item_sk
  	and i_category in ('Sports', 'Books', 'Home')
  	and ss_sold_date_sk = d_date_sk
    and to_date(d_date, 'yyyy-mm-dd') between 
     to_date('1999-02-22', 'yyyy-mm-dd') 
	 and to_date('1999-02-22', 'yyyy-mm-dd') + 30
group by
	i_item_id, i_item_desc, i_category, i_class, i_current_price
order by
	i_category, i_class, i_item_id, i_item_desc, revenueratio;

--q9.sql--

select case when (select count(*) from store_sales
                  where ss_quantity between 1 and 20) > 74129
            then (select avg(ss_ext_discount_amt) from store_sales
                  where ss_quantity between 1 and 20)
            else (select avg(ss_net_paid) from store_sales
                  where ss_quantity between 1 and 20) end bucket1 ,
       case when (select count(*) from store_sales
                  where ss_quantity between 21 and 40) > 122840
            then (select avg(ss_ext_discount_amt) from store_sales
                  where ss_quantity between 21 and 40)
            else (select avg(ss_net_paid) from store_sales
                  where ss_quantity between 21 and 40) end bucket2,
       case when (select count(*) from store_sales
                  where ss_quantity between 41 and 60) > 56580
            then (select avg(ss_ext_discount_amt) from store_sales
                  where ss_quantity between 41 and 60)
            else (select avg(ss_net_paid) from store_sales
                  where ss_quantity between 41 and 60) end bucket3,
       case when (select count(*) from store_sales
                  where ss_quantity between 61 and 80) > 10097
            then (select avg(ss_ext_discount_amt) from store_sales
                  where ss_quantity between 61 and 80)
            else (select avg(ss_net_paid) from store_sales
                  where ss_quantity between 61 and 80) end bucket4,
       case when (select count(*) from store_sales
                  where ss_quantity between 81 and 100) > 165306
            then (select avg(ss_ext_discount_amt) from store_sales
                  where ss_quantity between 81 and 100)
            else (select avg(ss_net_paid) from store_sales
                  where ss_quantity between 81 and 100) end bucket5
from reason
where r_reason_sk = 1;

exit;