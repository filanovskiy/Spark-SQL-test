
begin
dbms_credential.drop_credential(
credential_name => 'OBJ_STORE_CRED'
);
end;
/

begin
dbms_credential.create_credential(
credential_name => 'OBJ_STORE_CRED',
username        => 'alexey.filanovskiy@oracle.com', 
password        => 'wErbaALrA-MQd9UI{6jR'
);
end;
/

