public with sharing class soqlclass {
    public soqlclass() {

           //[SELECT id, Name, Type FROM Account LIMIT 10 ] 
           //[SELECT id, Name, Type, BillingState FROM Account WHERE (Type = 'Customer - Channel' OR Type = 'Customer - Direct') AND BillingState = 'CA'] 
           /*[SELECT id, Name, Type, BillingState 
           FROM Account 
           WHERE (Type = 'Customer - Channel' 
           OR Type = 'Customer - Direct') 
           AND (NOT BillingState LIKE '%C%')] */

        Account[] accts = [SELECT Name,Phone FROM Account 
                   WHERE (Name='SFDC Computing' AND NumberOfEmployees>25)
                   ORDER BY Name
                   LIMIT 10];
        System.debug(accts.size() + ' account(s) returned.');
// Write all account array info
        System.debug(accts);
        
           
    }
}