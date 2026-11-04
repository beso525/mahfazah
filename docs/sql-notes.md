### SQL reseting order. schema-draft > constraints-draft > test-data

### What if the currency entry is not in EGP? 
- It would get accepted, but it should get rejected. Could try a composite foreign key to ensure that both the currency column in accounts and ledger_entries match. If it's an international transaction, could be a different process where it converts the currency to the local currency

### What are triggers that raise an exception UPDATE or DELETE? Is it better that role privileges?
- Triggers listen for UPDATE or DELETE queries then raise an exception to prevent them from occuring. Role privileges would prevent them from happening in the first place, if the person doesn't have proper credentials.

### Why can't a CHECK enforce a balanced transaction?
- A CHECK only operates at the row level, checking one row at a time. But in double-entry bookkeeping, credits must equal debits across multiple rows, so we can't check it on a broader context. Also, we can't use aggregate functions inside CHECK constraints so we can't ensure that debits and credits are equal.
- To fix it, we can use deferred constraints so we would check the constraint after the transaction fully commits and we can use database triggers to query the entire table to ensure the transaction's balance nets to zero before saving.

### What's the difference between foreign keys and indexes?
- Foreign key is the rule that a column like {account_id} must exist in a table like {accounts}, so a query would check every row until it finds it.
- Index is a speed structure. Since postgres automatically indexes primary keys and unique columns, it is faster to find query those instead. The trade-off is slower writes.