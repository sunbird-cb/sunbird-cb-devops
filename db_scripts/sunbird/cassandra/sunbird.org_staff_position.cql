CREATE TABLE sunbird.org_staff_position ( 
orgId text, 
id text, 
position text,  
totalPositionsFilled int, 
totalPositionsVacant int, 
PRIMARY KEY (orgId, id) 
); 
