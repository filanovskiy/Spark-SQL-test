--customer
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'customer',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-ashburn-1.oraclecloud.com/v1/oraclebigdatadb/tpcds_parq/customer/*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--customer_address
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'customer_address',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-ashburn-1.oraclecloud.com/v1/oraclebigdatadb/tpcds_parq/customer_address/*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--customer_demographics
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'customer_demographics',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-ashburn-1.oraclecloud.com/v1/oraclebigdatadb/tpcds_parq/customer_demographics/*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--date_dim
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'date_dim',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-ashburn-1.oraclecloud.com/v1/oraclebigdatadb/tpcds_parq/date_dim/*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--household_demographics
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'household_demographics',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-ashburn-1.oraclecloud.com/v1/oraclebigdatadb/tpcds_parq/household_demographics/*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--income_band
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'income_band',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-ashburn-1.oraclecloud.com/v1/oraclebigdatadb/tpcds_parq/income_band/*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--inventory
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'inventory',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-ashburn-1.oraclecloud.com/v1/oraclebigdatadb/tpcds_parq/inventory/*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--item
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'item',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-ashburn-1.oraclecloud.com/v1/oraclebigdatadb/tpcds_parq/item/*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--item_marketprices
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'item_marketprices',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-ashburn-1.oraclecloud.com/v1/oraclebigdatadb/tpcds_parq/item_marketprices/*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--product_reviews
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'product_reviews',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-ashburn-1.oraclecloud.com/v1/oraclebigdatadb/tpcds_parq/product_reviews/*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--promotion
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'promotion',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-ashburn-1.oraclecloud.com/v1/oraclebigdatadb/tpcds_parq/promotion/*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--reason
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'reason',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-ashburn-1.oraclecloud.com/v1/oraclebigdatadb/tpcds_parq/reason/*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--ship_mode
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'ship_mode',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-ashburn-1.oraclecloud.com/v1/oraclebigdatadb/tpcds_parq/ship_mode/*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--store
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'store',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-ashburn-1.oraclecloud.com/v1/oraclebigdatadb/tpcds_parq/store/*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--store_returns
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'store_returns',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-ashburn-1.oraclecloud.com/v1/oraclebigdatadb/tpcds_parq/store_returns/*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--store_sales
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'store_sales',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-ashburn-1.oraclecloud.com/v1/oraclebigdatadb/tpcds_parq/store_sales/*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--time_dim
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'time_dim',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-ashburn-1.oraclecloud.com/v1/oraclebigdatadb/tpcds_parq/time_dim/*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--warehouse
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'warehouse',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-ashburn-1.oraclecloud.com/v1/oraclebigdatadb/tpcds_parq/warehouse/*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--web_clickstreams
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'web_clickstreams',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-ashburn-1.oraclecloud.com/v1/oraclebigdatadb/tpcds_parq/web_clickstreams/*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--web_page
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'web_page',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-ashburn-1.oraclecloud.com/v1/oraclebigdatadb/tpcds_parq/web_page/*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--web_returns
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'web_returns',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-ashburn-1.oraclecloud.com/v1/oraclebigdatadb/tpcds_parq/web_returns/*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--web_sales
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'web_sales',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-ashburn-1.oraclecloud.com/v1/oraclebigdatadb/tpcds_parq/web_sales/*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/

--web_site
begin 
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(TABLE_NAME => 'web_site',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list => 'https://swiftobjectstorage.us-ashburn-1.oraclecloud.com/v1/oraclebigdatadb/tpcds_parq/web_site/*',
    format => '{"type":"parquet",  "schema": "first"}'); 
END;
/
