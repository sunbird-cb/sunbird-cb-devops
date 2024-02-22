CREATE TABLE sunbird.org_budget_scheme ( 
orgId text, 
budgetYear text, 
id text, 
schemeName text, 
salaryBudgetAllocated bigint, 
trainingBudgetAllocated bigint,  
trainingBudgetUtilization bigint,  
proofDocs frozen<list<map<text,text>>>, 
PRIMARY KEY (orgId, budgetYear, id) 
); 
