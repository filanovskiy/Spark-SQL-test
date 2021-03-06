drop database s3;
create database s3;
use s3;
CREATE EXTERNAL TABLE customer(
  c_customer_sk bigint, 
  c_customer_id string, 
  c_current_cdemo_sk bigint, 
  c_current_hdemo_sk bigint, 
  c_current_addr_sk bigint, 
  c_first_shipto_date_sk bigint, 
  c_first_sales_date_sk bigint, 
  c_salutation string, 
  c_first_name string, 
  c_last_name string, 
  c_preferred_cust_flag string, 
  c_birth_day int, 
  c_birth_month int, 
  c_birth_year int, 
  c_birth_country string, 
  c_login string, 
  c_email_address string, 
  c_last_review_date string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3a://TCPDSPARQ/user/hive/warehouse/parq.db/customer'
TBLPROPERTIES (
  'STATS_GENERATED_VIA_STATS_TASK'='true', 
  'spark.sql.create.version'='2.2 or prior', 
  'spark.sql.sources.schema.numParts'='1', 
  'spark.sql.sources.schema.part.0'='{"type":"struct","fields":[{"name":"c_customer_sk","type":"long","nullable":true,"metadata":{}},{"name":"c_customer_id","type":"string","nullable":true,"metadata":{}},{"name":"c_current_cdemo_sk","type":"long","nullable":true,"metadata":{}},{"name":"c_current_hdemo_sk","type":"long","nullable":true,"metadata":{}},{"name":"c_current_addr_sk","type":"long","nullable":true,"metadata":{}},{"name":"c_first_shipto_date_sk","type":"long","nullable":true,"metadata":{}},{"name":"c_first_sales_date_sk","type":"long","nullable":true,"metadata":{}},{"name":"c_salutation","type":"string","nullable":true,"metadata":{}},{"name":"c_first_name","type":"string","nullable":true,"metadata":{}},{"name":"c_last_name","type":"string","nullable":true,"metadata":{}},{"name":"c_preferred_cust_flag","type":"string","nullable":true,"metadata":{}},{"name":"c_birth_day","type":"integer","nullable":true,"metadata":{}},{"name":"c_birth_month","type":"integer","nullable":true,"metadata":{}},{"name":"c_birth_year","type":"integer","nullable":true,"metadata":{}},{"name":"c_birth_country","type":"string","nullable":true,"metadata":{}},{"name":"c_login","type":"string","nullable":true,"metadata":{}},{"name":"c_email_address","type":"string","nullable":true,"metadata":{}},{"name":"c_last_review_date","type":"string","nullable":true,"metadata":{}}]}', 
  'transient_lastDdlTime'='1550906713')


CREATE EXTERNAL TABLE customer_address(
  ca_address_sk bigint, 
  ca_address_id string, 
  ca_street_number string, 
  ca_street_name string, 
  ca_street_type string, 
  ca_suite_number string, 
  ca_city string, 
  ca_county string, 
  ca_state string, 
  ca_zip string, 
  ca_country string, 
  ca_gmt_offset double, 
  ca_location_type string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3a://TCPDSPARQ/user/hive/warehouse/parq.db/customer_address'
TBLPROPERTIES (
  'STATS_GENERATED_VIA_STATS_TASK'='true', 
  'spark.sql.create.version'='2.2 or prior', 
  'spark.sql.sources.schema.numParts'='1', 
  'spark.sql.sources.schema.part.0'='{"type":"struct","fields":[{"name":"ca_address_sk","type":"long","nullable":true,"metadata":{}},{"name":"ca_address_id","type":"string","nullable":true,"metadata":{}},{"name":"ca_street_number","type":"string","nullable":true,"metadata":{}},{"name":"ca_street_name","type":"string","nullable":true,"metadata":{}},{"name":"ca_street_type","type":"string","nullable":true,"metadata":{}},{"name":"ca_suite_number","type":"string","nullable":true,"metadata":{}},{"name":"ca_city","type":"string","nullable":true,"metadata":{}},{"name":"ca_county","type":"string","nullable":true,"metadata":{}},{"name":"ca_state","type":"string","nullable":true,"metadata":{}},{"name":"ca_zip","type":"string","nullable":true,"metadata":{}},{"name":"ca_country","type":"string","nullable":true,"metadata":{}},{"name":"ca_gmt_offset","type":"double","nullable":true,"metadata":{}},{"name":"ca_location_type","type":"string","nullable":true,"metadata":{}}]}', 
  'transient_lastDdlTime'='1550896507')


CREATE EXTERNAL TABLE customer_demographics(
  cd_demo_sk bigint, 
  cd_gender string, 
  cd_marital_status string, 
  cd_education_status string, 
  cd_purchase_estimate int, 
  cd_credit_rating string, 
  cd_dep_count int, 
  cd_dep_employed_count int, 
  cd_dep_college_count int)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3a://TCPDSPARQ/user/hive/warehouse/parq.db/customer_demographics'
TBLPROPERTIES (
  'STATS_GENERATED_VIA_STATS_TASK'='true', 
  'spark.sql.create.version'='2.2 or prior', 
  'spark.sql.sources.schema.numParts'='1', 
  'spark.sql.sources.schema.part.0'='{"type":"struct","fields":[{"name":"cd_demo_sk","type":"long","nullable":true,"metadata":{}},{"name":"cd_gender","type":"string","nullable":true,"metadata":{}},{"name":"cd_marital_status","type":"string","nullable":true,"metadata":{}},{"name":"cd_education_status","type":"string","nullable":true,"metadata":{}},{"name":"cd_purchase_estimate","type":"integer","nullable":true,"metadata":{}},{"name":"cd_credit_rating","type":"string","nullable":true,"metadata":{}},{"name":"cd_dep_count","type":"integer","nullable":true,"metadata":{}},{"name":"cd_dep_employed_count","type":"integer","nullable":true,"metadata":{}},{"name":"cd_dep_college_count","type":"integer","nullable":true,"metadata":{}}]}', 
  'transient_lastDdlTime'='1550896514')


CREATE EXTERNAL TABLE date_dim(
  d_date_sk bigint, 
  d_date_id string, 
  d_date string, 
  d_month_seq int, 
  d_week_seq int, 
  d_quarter_seq int, 
  d_year int, 
  d_dow int, 
  d_moy int, 
  d_dom int, 
  d_qoy int, 
  d_fy_year int, 
  d_fy_quarter_seq int, 
  d_fy_week_seq int, 
  d_day_name string, 
  d_quarter_name string, 
  d_holiday string, 
  d_weekend string, 
  d_following_holiday string, 
  d_first_dom int, 
  d_last_dom int, 
  d_same_day_ly int, 
  d_same_day_lq int, 
  d_current_day string, 
  d_current_week string, 
  d_current_month string, 
  d_current_quarter string, 
  d_current_year string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3a://TCPDSPARQ/user/hive/warehouse/parq.db/date_dim'
TBLPROPERTIES (
  'STATS_GENERATED_VIA_STATS_TASK'='true', 
  'spark.sql.create.version'='2.2 or prior', 
  'spark.sql.sources.schema.numParts'='1', 
  'spark.sql.sources.schema.part.0'='{"type":"struct","fields":[{"name":"d_date_sk","type":"long","nullable":true,"metadata":{}},{"name":"d_date_id","type":"string","nullable":true,"metadata":{}},{"name":"d_date","type":"string","nullable":true,"metadata":{}},{"name":"d_month_seq","type":"integer","nullable":true,"metadata":{}},{"name":"d_week_seq","type":"integer","nullable":true,"metadata":{}},{"name":"d_quarter_seq","type":"integer","nullable":true,"metadata":{}},{"name":"d_year","type":"integer","nullable":true,"metadata":{}},{"name":"d_dow","type":"integer","nullable":true,"metadata":{}},{"name":"d_moy","type":"integer","nullable":true,"metadata":{}},{"name":"d_dom","type":"integer","nullable":true,"metadata":{}},{"name":"d_qoy","type":"integer","nullable":true,"metadata":{}},{"name":"d_fy_year","type":"integer","nullable":true,"metadata":{}},{"name":"d_fy_quarter_seq","type":"integer","nullable":true,"metadata":{}},{"name":"d_fy_week_seq","type":"integer","nullable":true,"metadata":{}},{"name":"d_day_name","type":"string","nullable":true,"metadata":{}},{"name":"d_quarter_name","type":"string","nullable":true,"metadata":{}},{"name":"d_holiday","type":"string","nullable":true,"metadata":{}},{"name":"d_weekend","type":"string","nullable":true,"metadata":{}},{"name":"d_following_holiday","type":"string","nullable":true,"metadata":{}},{"name":"d_first_dom","type":"integer","nullable":true,"metadata":{}},{"name":"d_last_dom","type":"integer","nullable":true,"metadata":{}},{"name":"d_same_day_ly","type":"integer","nullable":true,"metadata":{}},{"name":"d_same_day_lq","type":"integer","nullable":true,"metadata":{}},{"name":"d_current_day","type":"string","nullable":true,"metadata":{}},{"name":"d_current_week","type":"string","nullable":true,"metadata":{}},{"name":"d_current_month","type":"string","nullable":true,"metadata":{}},{"name":"d_current_quarter","type":"string","nullable":true,"metadata":{}},{"name":"d_current_year","type":"string","nullable":true,"metadata":{}}]}', 
  'transient_lastDdlTime'='1550896514')


CREATE EXTERNAL TABLE household_demographics(
  hd_demo_sk bigint, 
  hd_income_band_sk bigint, 
  hd_buy_potential string, 
  hd_dep_count int, 
  hd_vehicle_count int)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3a://TCPDSPARQ/user/hive/warehouse/parq.db/household_demographics'
TBLPROPERTIES (
  'STATS_GENERATED_VIA_STATS_TASK'='true', 
  'spark.sql.create.version'='2.2 or prior', 
  'spark.sql.sources.schema.numParts'='1', 
  'spark.sql.sources.schema.part.0'='{"type":"struct","fields":[{"name":"hd_demo_sk","type":"long","nullable":true,"metadata":{}},{"name":"hd_income_band_sk","type":"long","nullable":true,"metadata":{}},{"name":"hd_buy_potential","type":"string","nullable":true,"metadata":{}},{"name":"hd_dep_count","type":"integer","nullable":true,"metadata":{}},{"name":"hd_vehicle_count","type":"integer","nullable":true,"metadata":{}}]}', 
  'transient_lastDdlTime'='1550896515')


CREATE EXTERNAL TABLE income_band(
  ib_income_band_sk bigint, 
  ib_lower_bound int, 
  ib_upper_bound int)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3a://TCPDSPARQ/user/hive/warehouse/parq.db/income_band'
TBLPROPERTIES (
  'STATS_GENERATED_VIA_STATS_TASK'='true', 
  'spark.sql.create.version'='2.2 or prior', 
  'spark.sql.sources.schema.numParts'='1', 
  'spark.sql.sources.schema.part.0'='{"type":"struct","fields":[{"name":"ib_income_band_sk","type":"long","nullable":true,"metadata":{}},{"name":"ib_lower_bound","type":"integer","nullable":true,"metadata":{}},{"name":"ib_upper_bound","type":"integer","nullable":true,"metadata":{}}]}', 
  'transient_lastDdlTime'='1550896519')


CREATE EXTERNAL TABLE inventory(
  inv_date_sk bigint, 
  inv_item_sk bigint, 
  inv_warehouse_sk bigint, 
  inv_quantity_on_hand int)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3a://TCPDSPARQ/user/hive/warehouse/parq.db/inventory'
TBLPROPERTIES (
  'STATS_GENERATED_VIA_STATS_TASK'='true', 
  'spark.sql.create.version'='2.2 or prior', 
  'spark.sql.sources.schema.numParts'='1', 
  'spark.sql.sources.schema.part.0'='{"type":"struct","fields":[{"name":"inv_date_sk","type":"long","nullable":true,"metadata":{}},{"name":"inv_item_sk","type":"long","nullable":true,"metadata":{}},{"name":"inv_warehouse_sk","type":"long","nullable":true,"metadata":{}},{"name":"inv_quantity_on_hand","type":"integer","nullable":true,"metadata":{}}]}', 
  'transient_lastDdlTime'='1550896559')


CREATE EXTERNAL TABLE item(
  i_item_sk bigint, 
  i_item_id string, 
  i_rec_start_date string, 
  i_rec_end_date string, 
  i_item_desc string, 
  i_current_price double, 
  i_wholesale_cost double, 
  i_brand_id int, 
  i_brand string, 
  i_class_id int, 
  i_class string, 
  i_category_id int, 
  i_category string, 
  i_manufact_id int, 
  i_manufact string, 
  i_size string, 
  i_formulation string, 
  i_color string, 
  i_units string, 
  i_container string, 
  i_manager_id int, 
  i_product_name string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3a://TCPDSPARQ/user/hive/warehouse/parq.db/item'
TBLPROPERTIES (
  'STATS_GENERATED_VIA_STATS_TASK'='true', 
  'spark.sql.create.version'='2.2 or prior', 
  'spark.sql.sources.schema.numParts'='1', 
  'spark.sql.sources.schema.part.0'='{"type":"struct","fields":[{"name":"i_item_sk","type":"long","nullable":true,"metadata":{}},{"name":"i_item_id","type":"string","nullable":true,"metadata":{}},{"name":"i_rec_start_date","type":"string","nullable":true,"metadata":{}},{"name":"i_rec_end_date","type":"string","nullable":true,"metadata":{}},{"name":"i_item_desc","type":"string","nullable":true,"metadata":{}},{"name":"i_current_price","type":"double","nullable":true,"metadata":{}},{"name":"i_wholesale_cost","type":"double","nullable":true,"metadata":{}},{"name":"i_brand_id","type":"integer","nullable":true,"metadata":{}},{"name":"i_brand","type":"string","nullable":true,"metadata":{}},{"name":"i_class_id","type":"integer","nullable":true,"metadata":{}},{"name":"i_class","type":"string","nullable":true,"metadata":{}},{"name":"i_category_id","type":"integer","nullable":true,"metadata":{}},{"name":"i_category","type":"string","nullable":true,"metadata":{}},{"name":"i_manufact_id","type":"integer","nullable":true,"metadata":{}},{"name":"i_manufact","type":"string","nullable":true,"metadata":{}},{"name":"i_size","type":"string","nullable":true,"metadata":{}},{"name":"i_formulation","type":"string","nullable":true,"metadata":{}},{"name":"i_color","type":"string","nullable":true,"metadata":{}},{"name":"i_units","type":"string","nullable":true,"metadata":{}},{"name":"i_container","type":"string","nullable":true,"metadata":{}},{"name":"i_manager_id","type":"integer","nullable":true,"metadata":{}},{"name":"i_product_name","type":"string","nullable":true,"metadata":{}}]}', 
  'transient_lastDdlTime'='1550896562')


CREATE EXTERNAL TABLE item_marketprices(
  imp_sk bigint, 
  imp_item_sk bigint, 
  imp_competitor string, 
  imp_competitor_price double, 
  imp_start_date bigint, 
  imp_end_date bigint)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3a://TCPDSPARQ/user/hive/warehouse/parq.db/item_marketprices'
TBLPROPERTIES (
  'STATS_GENERATED_VIA_STATS_TASK'='true', 
  'transient_lastDdlTime'='1550896568')


CREATE EXTERNAL TABLE product_reviews(
  pr_review_sk bigint, 
  pr_review_date string, 
  pr_review_time string, 
  pr_review_rating int, 
  pr_item_sk bigint, 
  pr_user_sk bigint, 
  pr_order_sk bigint, 
  pr_review_content string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3a://TCPDSPARQ/user/hive/warehouse/parq.db/product_reviews'
TBLPROPERTIES (
  'STATS_GENERATED_VIA_STATS_TASK'='true', 
  'transient_lastDdlTime'='1550896579')


CREATE EXTERNAL TABLE promotion(
  p_promo_sk bigint, 
  p_promo_id string, 
  p_start_date_sk bigint, 
  p_end_date_sk bigint, 
  p_item_sk bigint, 
  p_cost double, 
  p_response_target int, 
  p_promo_name string, 
  p_channel_dmail string, 
  p_channel_email string, 
  p_channel_catalog string, 
  p_channel_tv string, 
  p_channel_radio string, 
  p_channel_press string, 
  p_channel_event string, 
  p_channel_demo string, 
  p_channel_details string, 
  p_purpose string, 
  p_discount_active string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3a://TCPDSPARQ/user/hive/warehouse/parq.db/promotion'
TBLPROPERTIES (
  'STATS_GENERATED_VIA_STATS_TASK'='true', 
  'spark.sql.create.version'='2.2 or prior', 
  'spark.sql.sources.schema.numParts'='1', 
  'spark.sql.sources.schema.part.0'='{"type":"struct","fields":[{"name":"p_promo_sk","type":"long","nullable":true,"metadata":{}},{"name":"p_promo_id","type":"string","nullable":true,"metadata":{}},{"name":"p_start_date_sk","type":"long","nullable":true,"metadata":{}},{"name":"p_end_date_sk","type":"long","nullable":true,"metadata":{}},{"name":"p_item_sk","type":"long","nullable":true,"metadata":{}},{"name":"p_cost","type":"double","nullable":true,"metadata":{}},{"name":"p_response_target","type":"integer","nullable":true,"metadata":{}},{"name":"p_promo_name","type":"string","nullable":true,"metadata":{}},{"name":"p_channel_dmail","type":"string","nullable":true,"metadata":{}},{"name":"p_channel_email","type":"string","nullable":true,"metadata":{}},{"name":"p_channel_catalog","type":"string","nullable":true,"metadata":{}},{"name":"p_channel_tv","type":"string","nullable":true,"metadata":{}},{"name":"p_channel_radio","type":"string","nullable":true,"metadata":{}},{"name":"p_channel_press","type":"string","nullable":true,"metadata":{}},{"name":"p_channel_event","type":"string","nullable":true,"metadata":{}},{"name":"p_channel_demo","type":"string","nullable":true,"metadata":{}},{"name":"p_channel_details","type":"string","nullable":true,"metadata":{}},{"name":"p_purpose","type":"string","nullable":true,"metadata":{}},{"name":"p_discount_active","type":"string","nullable":true,"metadata":{}}]}', 
  'transient_lastDdlTime'='1550896586')


CREATE EXTERNAL TABLE reason(
  r_reason_sk bigint, 
  r_reason_id string, 
  r_reason_desc string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3a://TCPDSPARQ/user/hive/warehouse/parq.db/reason'
TBLPROPERTIES (
  'STATS_GENERATED_VIA_STATS_TASK'='true', 
  'spark.sql.create.version'='2.2 or prior', 
  'spark.sql.sources.schema.numParts'='1', 
  'spark.sql.sources.schema.part.0'='{"type":"struct","fields":[{"name":"r_reason_sk","type":"long","nullable":true,"metadata":{}},{"name":"r_reason_id","type":"string","nullable":true,"metadata":{}},{"name":"r_reason_desc","type":"string","nullable":true,"metadata":{}}]}', 
  'transient_lastDdlTime'='1550896591')


CREATE EXTERNAL TABLE ship_mode(
  sm_ship_mode_sk bigint, 
  sm_ship_mode_id string, 
  sm_type string, 
  sm_code string, 
  sm_carrier string, 
  sm_contract string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3a://TCPDSPARQ/user/hive/warehouse/parq.db/ship_mode'
TBLPROPERTIES (
  'STATS_GENERATED_VIA_STATS_TASK'='true', 
  'spark.sql.create.version'='2.2 or prior', 
  'spark.sql.sources.schema.numParts'='1', 
  'spark.sql.sources.schema.part.0'='{"type":"struct","fields":[{"name":"sm_ship_mode_sk","type":"long","nullable":true,"metadata":{}},{"name":"sm_ship_mode_id","type":"string","nullable":true,"metadata":{}},{"name":"sm_type","type":"string","nullable":true,"metadata":{}},{"name":"sm_code","type":"string","nullable":true,"metadata":{}},{"name":"sm_carrier","type":"string","nullable":true,"metadata":{}},{"name":"sm_contract","type":"string","nullable":true,"metadata":{}}]}', 
  'transient_lastDdlTime'='1550896597')


CREATE EXTERNAL TABLE store(
  s_store_sk bigint, 
  s_store_id string, 
  s_rec_start_date string, 
  s_rec_end_date string, 
  s_closed_date_sk bigint, 
  s_store_name string, 
  s_number_employees int, 
  s_floor_space int, 
  s_hours string, 
  s_manager string, 
  s_market_id int, 
  s_geography_class string, 
  s_market_desc string, 
  s_market_manager string, 
  s_division_id int, 
  s_division_name string, 
  s_company_id int, 
  s_company_name string, 
  s_street_number string, 
  s_street_name string, 
  s_street_type string, 
  s_suite_number string, 
  s_city string, 
  s_county string, 
  s_state string, 
  s_zip string, 
  s_country string, 
  s_gmt_offset double, 
  s_tax_precentage double)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3a://TCPDSPARQ/user/hive/warehouse/parq.db/store'
TBLPROPERTIES (
  'STATS_GENERATED_VIA_STATS_TASK'='true', 
  'spark.sql.create.version'='2.2 or prior', 
  'spark.sql.sources.schema.numParts'='1', 
  'spark.sql.sources.schema.part.0'='{"type":"struct","fields":[{"name":"s_store_sk","type":"long","nullable":true,"metadata":{}},{"name":"s_store_id","type":"string","nullable":true,"metadata":{}},{"name":"s_rec_start_date","type":"string","nullable":true,"metadata":{}},{"name":"s_rec_end_date","type":"string","nullable":true,"metadata":{}},{"name":"s_closed_date_sk","type":"long","nullable":true,"metadata":{}},{"name":"s_store_name","type":"string","nullable":true,"metadata":{}},{"name":"s_number_employees","type":"integer","nullable":true,"metadata":{}},{"name":"s_floor_space","type":"integer","nullable":true,"metadata":{}},{"name":"s_hours","type":"string","nullable":true,"metadata":{}},{"name":"s_manager","type":"string","nullable":true,"metadata":{}},{"name":"s_market_id","type":"integer","nullable":true,"metadata":{}},{"name":"s_geography_class","type":"string","nullable":true,"metadata":{}},{"name":"s_market_desc","type":"string","nullable":true,"metadata":{}},{"name":"s_market_manager","type":"string","nullable":true,"metadata":{}},{"name":"s_division_id","type":"integer","nullable":true,"metadata":{}},{"name":"s_division_name","type":"string","nullable":true,"metadata":{}},{"name":"s_company_id","type":"integer","nullable":true,"metadata":{}},{"name":"s_company_name","type":"string","nullable":true,"metadata":{}},{"name":"s_street_number","type":"string","nullable":true,"metadata":{}},{"name":"s_street_name","type":"string","nullable":true,"metadata":{}},{"name":"s_street_type","type":"string","nullable":true,"metadata":{}},{"name":"s_suite_number","type":"string","nullable":true,"metadata":{}},{"name":"s_city","type":"string","nullable":true,"metadata":{}},{"name":"s_county","type":"string","nullable":true,"metadata":{}},{"name":"s_state","type":"string","nullable":true,"metadata":{}},{"name":"s_zip","type":"string","nullable":true,"metadata":{}},{"name":"s_country","type":"string","nullable":true,"metadata":{}},{"name":"s_gmt_offset","type":"double","nullable":true,"metadata":{}},{"name":"s_tax_precentage","type":"double","nullable":true,"metadata":{}}]}', 
  'transient_lastDdlTime'='1550896598')


CREATE EXTERNAL TABLE store_returns(
  sr_returned_date_sk bigint, 
  sr_return_time_sk bigint, 
  sr_item_sk bigint, 
  sr_customer_sk bigint, 
  sr_cdemo_sk bigint, 
  sr_hdemo_sk bigint, 
  sr_addr_sk bigint, 
  sr_store_sk bigint, 
  sr_reason_sk bigint, 
  sr_ticket_number bigint, 
  sr_return_quantity int, 
  sr_return_amt double, 
  sr_return_tax double, 
  sr_return_amt_inc_tax double, 
  sr_fee double, 
  sr_return_ship_cost double, 
  sr_refunded_cash double, 
  sr_reversed_charge double, 
  sr_store_credit double, 
  sr_net_loss double)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3a://TCPDSPARQ/user/hive/warehouse/parq.db/store_returns'
TBLPROPERTIES (
  'STATS_GENERATED_VIA_STATS_TASK'='true', 
  'spark.sql.create.version'='2.2 or prior', 
  'spark.sql.sources.schema.numParts'='1', 
  'spark.sql.sources.schema.part.0'='{"type":"struct","fields":[{"name":"sr_returned_date_sk","type":"long","nullable":true,"metadata":{}},{"name":"sr_return_time_sk","type":"long","nullable":true,"metadata":{}},{"name":"sr_item_sk","type":"long","nullable":true,"metadata":{}},{"name":"sr_customer_sk","type":"long","nullable":true,"metadata":{}},{"name":"sr_cdemo_sk","type":"long","nullable":true,"metadata":{}},{"name":"sr_hdemo_sk","type":"long","nullable":true,"metadata":{}},{"name":"sr_addr_sk","type":"long","nullable":true,"metadata":{}},{"name":"sr_store_sk","type":"long","nullable":true,"metadata":{}},{"name":"sr_reason_sk","type":"long","nullable":true,"metadata":{}},{"name":"sr_ticket_number","type":"long","nullable":true,"metadata":{}},{"name":"sr_return_quantity","type":"integer","nullable":true,"metadata":{}},{"name":"sr_return_amt","type":"double","nullable":true,"metadata":{}},{"name":"sr_return_tax","type":"double","nullable":true,"metadata":{}},{"name":"sr_return_amt_inc_tax","type":"double","nullable":true,"metadata":{}},{"name":"sr_fee","type":"double","nullable":true,"metadata":{}},{"name":"sr_return_ship_cost","type":"double","nullable":true,"metadata":{}},{"name":"sr_refunded_cash","type":"double","nullable":true,"metadata":{}},{"name":"sr_reversed_charge","type":"double","nullable":true,"metadata":{}},{"name":"sr_store_credit","type":"double","nullable":true,"metadata":{}},{"name":"sr_net_loss","type":"double","nullable":true,"metadata":{}}]}', 
  'transient_lastDdlTime'='1550896622')


CREATE EXTERNAL TABLE store_sales(
  ss_sold_date_sk bigint, 
  ss_sold_time_sk bigint, 
  ss_item_sk bigint, 
  ss_customer_sk bigint, 
  ss_cdemo_sk bigint, 
  ss_hdemo_sk bigint, 
  ss_addr_sk bigint, 
  ss_store_sk bigint, 
  ss_promo_sk bigint, 
  ss_ticket_number bigint, 
  ss_quantity int, 
  ss_wholesale_cost double, 
  ss_list_price double, 
  ss_sales_price double, 
  ss_ext_discount_amt double, 
  ss_ext_sales_price double, 
  ss_ext_wholesale_cost double, 
  ss_ext_list_price double, 
  ss_ext_tax double, 
  ss_coupon_amt double, 
  ss_net_paid double, 
  ss_net_paid_inc_tax double, 
  ss_net_profit double)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3a://TCPDSPARQ/user/hive/warehouse/parq.db/store_sales'
TBLPROPERTIES (
  'STATS_GENERATED_VIA_STATS_TASK'='true', 
  'spark.sql.create.version'='2.2 or prior', 
  'spark.sql.sources.schema.numParts'='1', 
  'spark.sql.sources.schema.part.0'='{"type":"struct","fields":[{"name":"ss_sold_date_sk","type":"long","nullable":true,"metadata":{}},{"name":"ss_sold_time_sk","type":"long","nullable":true,"metadata":{}},{"name":"ss_item_sk","type":"long","nullable":true,"metadata":{}},{"name":"ss_customer_sk","type":"long","nullable":true,"metadata":{}},{"name":"ss_cdemo_sk","type":"long","nullable":true,"metadata":{}},{"name":"ss_hdemo_sk","type":"long","nullable":true,"metadata":{}},{"name":"ss_addr_sk","type":"long","nullable":true,"metadata":{}},{"name":"ss_store_sk","type":"long","nullable":true,"metadata":{}},{"name":"ss_promo_sk","type":"long","nullable":true,"metadata":{}},{"name":"ss_ticket_number","type":"long","nullable":true,"metadata":{}},{"name":"ss_quantity","type":"integer","nullable":true,"metadata":{}},{"name":"ss_wholesale_cost","type":"double","nullable":true,"metadata":{}},{"name":"ss_list_price","type":"double","nullable":true,"metadata":{}},{"name":"ss_sales_price","type":"double","nullable":true,"metadata":{}},{"name":"ss_ext_discount_amt","type":"double","nullable":true,"metadata":{}},{"name":"ss_ext_sales_price","type":"double","nullable":true,"metadata":{}},{"name":"ss_ext_wholesale_cost","type":"double","nullable":true,"metadata":{}},{"name":"ss_ext_list_price","type":"double","nullable":true,"metadata":{}},{"name":"ss_ext_tax","type":"double","nullable":true,"metadata":{}},{"name":"ss_coupon_amt","type":"double","nullable":true,"metadata":{}},{"name":"ss_net_paid","type":"double","nullable":true,"metadata":{}},{"name":"ss_net_paid_inc_tax","type":"double","nullable":true,"metadata":{}},{"name":"ss_net_profit","type":"double","nullable":true,"metadata":{}}]}', 
  'transient_lastDdlTime'='1550896823')


CREATE EXTERNAL TABLE time_dim(
  t_time_sk bigint, 
  t_time_id string, 
  t_time int, 
  t_hour int, 
  t_minute int, 
  t_second int, 
  t_am_pm string, 
  t_shift string, 
  t_sub_shift string, 
  t_meal_time string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3a://TCPDSPARQ/user/hive/warehouse/parq.db/time_dim'
TBLPROPERTIES (
  'STATS_GENERATED_VIA_STATS_TASK'='true', 
  'spark.sql.create.version'='2.2 or prior', 
  'spark.sql.sources.schema.numParts'='1', 
  'spark.sql.sources.schema.part.0'='{"type":"struct","fields":[{"name":"t_time_sk","type":"long","nullable":true,"metadata":{}},{"name":"t_time_id","type":"string","nullable":true,"metadata":{}},{"name":"t_time","type":"integer","nullable":true,"metadata":{}},{"name":"t_hour","type":"integer","nullable":true,"metadata":{}},{"name":"t_minute","type":"integer","nullable":true,"metadata":{}},{"name":"t_second","type":"integer","nullable":true,"metadata":{}},{"name":"t_am_pm","type":"string","nullable":true,"metadata":{}},{"name":"t_shift","type":"string","nullable":true,"metadata":{}},{"name":"t_sub_shift","type":"string","nullable":true,"metadata":{}},{"name":"t_meal_time","type":"string","nullable":true,"metadata":{}}]}', 
  'transient_lastDdlTime'='1550896829')


CREATE EXTERNAL TABLE warehouse(
  w_warehouse_sk bigint, 
  w_warehouse_id string, 
  w_warehouse_name string, 
  w_warehouse_sq_ft int, 
  w_street_number string, 
  w_street_name string, 
  w_street_type string, 
  w_suite_number string, 
  w_city string, 
  w_county string, 
  w_state string, 
  w_zip string, 
  w_country string, 
  w_gmt_offset double)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3a://TCPDSPARQ/user/hive/warehouse/parq.db/warehouse'
TBLPROPERTIES (
  'STATS_GENERATED_VIA_STATS_TASK'='true', 
  'spark.sql.create.version'='2.2 or prior', 
  'spark.sql.sources.schema.numParts'='1', 
  'spark.sql.sources.schema.part.0'='{"type":"struct","fields":[{"name":"w_warehouse_sk","type":"long","nullable":true,"metadata":{}},{"name":"w_warehouse_id","type":"string","nullable":true,"metadata":{}},{"name":"w_warehouse_name","type":"string","nullable":true,"metadata":{}},{"name":"w_warehouse_sq_ft","type":"integer","nullable":true,"metadata":{}},{"name":"w_street_number","type":"string","nullable":true,"metadata":{}},{"name":"w_street_name","type":"string","nullable":true,"metadata":{}},{"name":"w_street_type","type":"string","nullable":true,"metadata":{}},{"name":"w_suite_number","type":"string","nullable":true,"metadata":{}},{"name":"w_city","type":"string","nullable":true,"metadata":{}},{"name":"w_county","type":"string","nullable":true,"metadata":{}},{"name":"w_state","type":"string","nullable":true,"metadata":{}},{"name":"w_zip","type":"string","nullable":true,"metadata":{}},{"name":"w_country","type":"string","nullable":true,"metadata":{}},{"name":"w_gmt_offset","type":"double","nullable":true,"metadata":{}}]}', 
  'transient_lastDdlTime'='1550896835')


CREATE EXTERNAL TABLE web_clickstreams(
  wcs_click_date_sk bigint, 
  wcs_click_time_sk bigint, 
  wcs_sales_sk bigint, 
  wcs_item_sk bigint, 
  wcs_web_page_sk bigint, 
  wcs_user_sk bigint)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3a://TCPDSPARQ/user/hive/warehouse/parq.db/web_clickstreams'
TBLPROPERTIES (
  'STATS_GENERATED_VIA_STATS_TASK'='true', 
  'transient_lastDdlTime'='1550897257')


CREATE EXTERNAL TABLE web_page(
  wp_web_page_sk bigint, 
  wp_web_page_id string, 
  wp_rec_start_date string, 
  wp_rec_end_date string, 
  wp_creation_date_sk bigint, 
  wp_access_date_sk bigint, 
  wp_autogen_flag string, 
  wp_customer_sk bigint, 
  wp_url string, 
  wp_type string, 
  wp_char_count int, 
  wp_link_count int, 
  wp_image_count int, 
  wp_max_ad_count int)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3a://TCPDSPARQ/user/hive/warehouse/parq.db/web_page'
TBLPROPERTIES (
  'STATS_GENERATED_VIA_STATS_TASK'='true', 
  'spark.sql.create.version'='2.2 or prior', 
  'spark.sql.sources.schema.numParts'='1', 
  'spark.sql.sources.schema.part.0'='{"type":"struct","fields":[{"name":"wp_web_page_sk","type":"long","nullable":true,"metadata":{}},{"name":"wp_web_page_id","type":"string","nullable":true,"metadata":{}},{"name":"wp_rec_start_date","type":"string","nullable":true,"metadata":{}},{"name":"wp_rec_end_date","type":"string","nullable":true,"metadata":{}},{"name":"wp_creation_date_sk","type":"long","nullable":true,"metadata":{}},{"name":"wp_access_date_sk","type":"long","nullable":true,"metadata":{}},{"name":"wp_autogen_flag","type":"string","nullable":true,"metadata":{}},{"name":"wp_customer_sk","type":"long","nullable":true,"metadata":{}},{"name":"wp_url","type":"string","nullable":true,"metadata":{}},{"name":"wp_type","type":"string","nullable":true,"metadata":{}},{"name":"wp_char_count","type":"integer","nullable":true,"metadata":{}},{"name":"wp_link_count","type":"integer","nullable":true,"metadata":{}},{"name":"wp_image_count","type":"integer","nullable":true,"metadata":{}},{"name":"wp_max_ad_count","type":"integer","nullable":true,"metadata":{}}]}', 
  'transient_lastDdlTime'='1550897264')


CREATE EXTERNAL TABLE web_returns(
  wr_returned_date_sk bigint, 
  wr_returned_time_sk bigint, 
  wr_item_sk bigint, 
  wr_refunded_customer_sk bigint, 
  wr_refunded_cdemo_sk bigint, 
  wr_refunded_hdemo_sk bigint, 
  wr_refunded_addr_sk bigint, 
  wr_returning_customer_sk bigint, 
  wr_returning_cdemo_sk bigint, 
  wr_returning_hdemo_sk bigint, 
  wr_returning_addr_sk bigint, 
  wr_web_page_sk bigint, 
  wr_reason_sk bigint, 
  wr_order_number bigint, 
  wr_return_quantity int, 
  wr_return_amt double, 
  wr_return_tax double, 
  wr_return_amt_inc_tax double, 
  wr_fee double, 
  wr_return_ship_cost double, 
  wr_refunded_cash double, 
  wr_reversed_charge double, 
  wr_account_credit double, 
  wr_net_loss double)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3a://TCPDSPARQ/user/hive/warehouse/parq.db/web_returns'
TBLPROPERTIES (
  'STATS_GENERATED_VIA_STATS_TASK'='true', 
  'spark.sql.create.version'='2.2 or prior', 
  'spark.sql.sources.schema.numParts'='1', 
  'spark.sql.sources.schema.part.0'='{"type":"struct","fields":[{"name":"wr_returned_date_sk","type":"long","nullable":true,"metadata":{}},{"name":"wr_returned_time_sk","type":"long","nullable":true,"metadata":{}},{"name":"wr_item_sk","type":"long","nullable":true,"metadata":{}},{"name":"wr_refunded_customer_sk","type":"long","nullable":true,"metadata":{}},{"name":"wr_refunded_cdemo_sk","type":"long","nullable":true,"metadata":{}},{"name":"wr_refunded_hdemo_sk","type":"long","nullable":true,"metadata":{}},{"name":"wr_refunded_addr_sk","type":"long","nullable":true,"metadata":{}},{"name":"wr_returning_customer_sk","type":"long","nullable":true,"metadata":{}},{"name":"wr_returning_cdemo_sk","type":"long","nullable":true,"metadata":{}},{"name":"wr_returning_hdemo_sk","type":"long","nullable":true,"metadata":{}},{"name":"wr_returning_addr_sk","type":"long","nullable":true,"metadata":{}},{"name":"wr_web_page_sk","type":"long","nullable":true,"metadata":{}},{"name":"wr_reason_sk","type":"long","nullable":true,"metadata":{}},{"name":"wr_order_number","type":"long","nullable":true,"metadata":{}},{"name":"wr_return_quantity","type":"integer","nullable":true,"metadata":{}},{"name":"wr_return_amt","type":"double","nullable":true,"metadata":{}},{"name":"wr_return_tax","type":"double","nullable":true,"metadata":{}},{"name":"wr_return_amt_inc_tax","type":"double","nullable":true,"metadata":{}},{"name":"wr_fee","type":"double","nullable":true,"metadata":{}},{"name":"wr_return_ship_cost","type":"double","nullable":true,"metadata":{}},{"name":"wr_refunded_cash","type":"double","nullable":true,"metadata":{}},{"name":"wr_reversed_charge","type":"double","nullable":true,"metadata":{}},{"name":"wr_account_credit","type":"double","nullable":true,"metadata":{}},{"name":"wr_net_loss","type":"double","nullable":true,"metadata":{}}]}', 
  'transient_lastDdlTime'='1550897291')


CREATE EXTERNAL TABLE web_sales(
  ws_sold_date_sk bigint, 
  ws_sold_time_sk bigint, 
  ws_ship_date_sk bigint, 
  ws_item_sk bigint, 
  ws_bill_customer_sk bigint, 
  ws_bill_cdemo_sk bigint, 
  ws_bill_hdemo_sk bigint, 
  ws_bill_addr_sk bigint, 
  ws_ship_customer_sk bigint, 
  ws_ship_cdemo_sk bigint, 
  ws_ship_hdemo_sk bigint, 
  ws_ship_addr_sk bigint, 
  ws_web_page_sk bigint, 
  ws_web_site_sk bigint, 
  ws_ship_mode_sk bigint, 
  ws_warehouse_sk bigint, 
  ws_promo_sk bigint, 
  ws_order_number bigint, 
  ws_quantity int, 
  ws_wholesale_cost double, 
  ws_list_price double, 
  ws_sales_price double, 
  ws_ext_discount_amt double, 
  ws_ext_sales_price double, 
  ws_ext_wholesale_cost double, 
  ws_ext_list_price double, 
  ws_ext_tax double, 
  ws_coupon_amt double, 
  ws_ext_ship_cost double, 
  ws_net_paid double, 
  ws_net_paid_inc_tax double, 
  ws_net_paid_inc_ship double, 
  ws_net_paid_inc_ship_tax double, 
  ws_net_profit double)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3a://TCPDSPARQ/user/hive/warehouse/parq.db/web_sales'
TBLPROPERTIES (
  'STATS_GENERATED_VIA_STATS_TASK'='true', 
  'spark.sql.create.version'='2.2 or prior', 
  'spark.sql.sources.schema.numParts'='1', 
  'spark.sql.sources.schema.part.0'='{"type":"struct","fields":[{"name":"ws_sold_date_sk","type":"long","nullable":true,"metadata":{}},{"name":"ws_sold_time_sk","type":"long","nullable":true,"metadata":{}},{"name":"ws_ship_date_sk","type":"long","nullable":true,"metadata":{}},{"name":"ws_item_sk","type":"long","nullable":true,"metadata":{}},{"name":"ws_bill_customer_sk","type":"long","nullable":true,"metadata":{}},{"name":"ws_bill_cdemo_sk","type":"long","nullable":true,"metadata":{}},{"name":"ws_bill_hdemo_sk","type":"long","nullable":true,"metadata":{}},{"name":"ws_bill_addr_sk","type":"long","nullable":true,"metadata":{}},{"name":"ws_ship_customer_sk","type":"long","nullable":true,"metadata":{}},{"name":"ws_ship_cdemo_sk","type":"long","nullable":true,"metadata":{}},{"name":"ws_ship_hdemo_sk","type":"long","nullable":true,"metadata":{}},{"name":"ws_ship_addr_sk","type":"long","nullable":true,"metadata":{}},{"name":"ws_web_page_sk","type":"long","nullable":true,"metadata":{}},{"name":"ws_web_site_sk","type":"long","nullable":true,"metadata":{}},{"name":"ws_ship_mode_sk","type":"long","nullable":true,"metadata":{}},{"name":"ws_warehouse_sk","type":"long","nullable":true,"metadata":{}},{"name":"ws_promo_sk","type":"long","nullable":true,"metadata":{}},{"name":"ws_order_number","type":"long","nullable":true,"metadata":{}},{"name":"ws_quantity","type":"integer","nullable":true,"metadata":{}},{"name":"ws_wholesale_cost","type":"double","nullable":true,"metadata":{}},{"name":"ws_list_price","type":"double","nullable":true,"metadata":{}},{"name":"ws_sales_price","type":"double","nullable":true,"metadata":{}},{"name":"ws_ext_discount_amt","type":"double","nullable":true,"metadata":{}},{"name":"ws_ext_sales_price","type":"double","nullable":true,"metadata":{}},{"name":"ws_ext_wholesale_cost","type":"double","nullable":true,"metadata":{}},{"name":"ws_ext_list_price","type":"double","nullable":true,"metadata":{}},{"name":"ws_ext_tax","type":"double","nullable":true,"metadata":{}},{"name":"ws_coupon_amt","type":"double","nullable":true,"metadata":{}},{"name":"ws_ext_ship_cost","type":"double","nullable":true,"metadata":{}},{"name":"ws_net_paid","type":"double","nullable":true,"metadata":{}},{"name":"ws_net_paid_inc_tax","type":"double","nullable":true,"metadata":{}},{"name":"ws_net_paid_inc_ship","type":"double","nullable":true,"metadata":{}},{"name":"ws_net_paid_inc_ship_tax","type":"double","nullable":true,"metadata":{}},{"name":"ws_net_profit","type":"double","nullable":true,"metadata":{}}]}', 
  'transient_lastDdlTime'='1550897720')


CREATE EXTERNAL TABLE web_site(
  web_site_sk bigint, 
  web_site_id string, 
  web_rec_start_date string, 
  web_rec_end_date string, 
  web_name string, 
  web_open_date_sk bigint, 
  web_close_date_sk bigint, 
  web_class string, 
  web_manager string, 
  web_mkt_id int, 
  web_mkt_class string, 
  web_mkt_desc string, 
  web_market_manager string, 
  web_company_id int, 
  web_company_name string, 
  web_street_number string, 
  web_street_name string, 
  web_street_type string, 
  web_suite_number string, 
  web_city string, 
  web_county string, 
  web_state string, 
  web_zip string, 
  web_country string, 
  web_gmt_offset double, 
  web_tax_percentage double)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3a://TCPDSPARQ/user/hive/warehouse/parq.db/web_site'
TBLPROPERTIES (
  'STATS_GENERATED_VIA_STATS_TASK'='true', 
  'spark.sql.create.version'='2.2 or prior', 
  'spark.sql.sources.schema.numParts'='1', 
  'spark.sql.sources.schema.part.0'='{"type":"struct","fields":[{"name":"web_site_sk","type":"long","nullable":true,"metadata":{}},{"name":"web_site_id","type":"string","nullable":true,"metadata":{}},{"name":"web_rec_start_date","type":"string","nullable":true,"metadata":{}},{"name":"web_rec_end_date","type":"string","nullable":true,"metadata":{}},{"name":"web_name","type":"string","nullable":true,"metadata":{}},{"name":"web_open_date_sk","type":"long","nullable":true,"metadata":{}},{"name":"web_close_date_sk","type":"long","nullable":true,"metadata":{}},{"name":"web_class","type":"string","nullable":true,"metadata":{}},{"name":"web_manager","type":"string","nullable":true,"metadata":{}},{"name":"web_mkt_id","type":"integer","nullable":true,"metadata":{}},{"name":"web_mkt_class","type":"string","nullable":true,"metadata":{}},{"name":"web_mkt_desc","type":"string","nullable":true,"metadata":{}},{"name":"web_market_manager","type":"string","nullable":true,"metadata":{}},{"name":"web_company_id","type":"integer","nullable":true,"metadata":{}},{"name":"web_company_name","type":"string","nullable":true,"metadata":{}},{"name":"web_street_number","type":"string","nullable":true,"metadata":{}},{"name":"web_street_name","type":"string","nullable":true,"metadata":{}},{"name":"web_street_type","type":"string","nullable":true,"metadata":{}},{"name":"web_suite_number","type":"string","nullable":true,"metadata":{}},{"name":"web_city","type":"string","nullable":true,"metadata":{}},{"name":"web_county","type":"string","nullable":true,"metadata":{}},{"name":"web_state","type":"string","nullable":true,"metadata":{}},{"name":"web_zip","type":"string","nullable":true,"metadata":{}},{"name":"web_country","type":"string","nullable":true,"metadata":{}},{"name":"web_gmt_offset","type":"double","nullable":true,"metadata":{}},{"name":"web_tax_percentage","type":"double","nullable":true,"metadata":{}}]}', 
  'transient_lastDdlTime'='1550897726')


