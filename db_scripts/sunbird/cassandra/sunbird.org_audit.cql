CREATE TABLE sunbird.org_audit ( 
orgId text, 
auditType text, 
createdBy text, 
createdDate text, 
updatedBy text, 
updatedDate text, 
transactionDetails text, 
PRIMARY KEY (orgId, auditType, createdDate, updatedDate) 
); 
