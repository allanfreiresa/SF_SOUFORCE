public with sharing class AccountController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountsByName(String accountName) {
        String query = '%' + accountName + '%';
        return [SELECT Id, Name, Industry, Phone FROM Account WHERE Name LIKE :query];
    }
}
