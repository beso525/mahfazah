### SQL reseting order. schema-draft > constraints-draft > test-data

### What if the currency entry is not in EGP? 
- It would get accepted, but it should get rejected. Could try a composite foreign key to ensure that both the currency column in accounts and ledger_entries match. If it's an international transaction, could be a different process where it converts the currency to the local currency

### What are triggers that raise an exception UPDATE or DELETE? Is it better that role privileges?
- Triggers listen for UPDATE or DELETE queries then raise an exception to prevent them from occuring. Role privileges would prevent them from happening in the first place, if the person doesn't have proper credentials. A table owner can also switch a trigger off, whereas a role without that privilege can't. So we use both privileges and triggers.

### Why can't a CHECK enforce a balanced transaction?
- A CHECK only operates at the row level, checking one row at a time. But in double-entry bookkeeping, credits must equal debits across multiple rows, so we can't check it on a broader context. Also, we can't use aggregate functions inside CHECK constraints so we can't ensure that debits and credits are equal.
- To fix it, we can use deferred constraints so we would check the constraint at commit time and if it fails, everything rolls back. We can use database triggers to query the entire table to ensure the transaction's balance nets to zero before saving.

### What's the difference between foreign keys and indexes?
- Since postgreSQL doesn't automatically index referencing columns like account_id, we add indexes for faster retrieval.

### Why do NULL values slip past UNIQUE keyword?
- UNIQUE only compares real values, if an id is NULL it passes automatically since 2 NULL values don't equal each other.