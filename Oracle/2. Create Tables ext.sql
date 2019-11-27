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
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'customer',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/customer/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--customer_address
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'customer_address',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/customer_address/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--customer_demographics
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'customer_demographics',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/customer_demographics/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--date_dim
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'date_dim',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/date_dim/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--household_demographics
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'household_demographics',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/household_demographics/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--income_band
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'income_band',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/income_band/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--inventory
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'inventory',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/inventory/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--item
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'item',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/item/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--item_marketprices
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'item_marketprices',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/item_marketprices/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--product_reviews
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'product_reviews',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/product_reviews/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--promotion
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'promotion',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/promotion/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--reason
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'reason',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/reason/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--ship_mode
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'ship_mode',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/ship_mode/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--store
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'store',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/store/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--store_returns
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'store_returns',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/store_returns/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--store_sales
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'store_sales',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/store_sales/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--time_dim
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'time_dim',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/time_dim/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--warehouse
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'warehouse',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/warehouse/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--web_clickstreams
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'web_clickstreams',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/web_clickstreams/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--web_page
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'web_page',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/web_page/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--web_returns
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'web_returns',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/web_returns/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--web_sales
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'web_sales',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/web_sales/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--web_site
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'web_site',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-phoenix-1.oraclecloud.com/v1/oraclebigdatadb/TCPDSPARQ/user/hive/warehouse/parq.db/web_site/00*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

