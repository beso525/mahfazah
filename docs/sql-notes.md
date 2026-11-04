### SQL reseting order. schema-draft > constraints-draft > test-data

### What if the currency entry is not in EGP? 
- It would get accepted, but it should get rejected. Could try a composite foreign key to ensure that both the currency column in accounts and transactions match. If it's an international transaction, could be a different process where it converts the currency to the local currency

### What are triggers that raise an exception UPDATE or DELETE? Is it better that role privileges?
- Triggers listen for UPDATE or DELETE queries then raise an exception to prevent them from occuring. Role privileges would prevent them from happening in the first place, if the person doesn't have proper credentials.

