begin
  DBMS_CLOUD.create_credential (
    credential_name => 'OBJ_STORE_CRED',
    username => 'alexey.filanovskiy@oracle.com',
    password => '15Wh[zZ]c93k_5X:JsHV'
  ) ;
end;
/

--customer
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'customer_ext',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/customer/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--customer_address
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'customer_address_ext',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/customer_address/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--customer_demographics
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'customer_demographics_ext',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/customer_demographics/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--date_dim
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'date_dim_ext',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/date_dim/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--household_demographics
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'household_demographics_ext',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/household_demographics/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--income_band
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'income_band_ext',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/income_band/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--inventory
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'inventory_ext',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/inventory/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--item
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'item_ext',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/item/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--item_marketprices
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'item_marketprices_ext',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/item_marketprices/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--product_reviews
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'product_reviews_ext',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/product_reviews/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--promotion
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'promotion_ext',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/promotion/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--reason
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'reason_ext',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/reason/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--ship_mode
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'ship_mode_ext',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/ship_mode/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--store
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'store_ext',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/store/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--store_returns
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'store_returns_ext',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/store_returns/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--store_sales
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'store_sales_ext',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/store_sales/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--time_dim
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'time_dim_ext',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/time_dim/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--warehouse
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'warehouse_ext',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/warehouse/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--web_clickstreams
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'web_clickstreams_ext',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/web_clickstreams/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--web_page
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'web_page_ext',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/web_page/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--web_returns
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'web_returns_ext',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/web_returns/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--web_sales
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'web_sales_ext',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/web_sales/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--web_site
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'web_site_ext',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/web_site/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/


create table customer as select * from customer_ext;
create table customer_address as select * from customer_address_ext;
create table customer_demographics as select * from customer_demographics_ext;
create table date_dim as select * from date_dim_ext;
create table household_demographics as select * from household_demographics_ext;
create table income_band as select * from income_band_ext;
create table inventory as select * from inventory_ext;
create table item as select * from item_ext;
create table item_marketprices as select * from item_marketprices_ext;
create table product_reviews as select * from product_reviews_ext;
create table promotion as select * from promotion_ext;
create table reason as select * from reason_ext;
create table ship_mode as select * from ship_mode_ext;
create table store as select * from store_ext;
create table store_returns as select * from store_returns_ext;
create table store_sales as select * from store_sales_ext;
create table time_dim as select * from time_dim_ext;
create table warehouse as select * from warehouse_ext;
create table web_clickstreams as select * from web_clickstreams_ext;
create table web_page as select * from web_page_ext;
create table web_returns as select * from web_returns_ext;
create table web_sales as select * from web_sales_ext;
create table web_site as select * from web_site_ext;
