-- Indexes

/*
Index on customer_id
*/

CREATE INDEX idx_customer_id
ON billing(customer_id);


/*
Index on contract_type
*/

CREATE INDEX idx_contract
ON contracts(contract_type);


/*
Index on internet_service
*/

CREATE INDEX idx_internet
ON services(internet_service);


/*
Index on churn
*/

CREATE INDEX idx_churn
ON churn_status(churn);

























