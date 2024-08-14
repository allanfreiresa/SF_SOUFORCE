public class AccountTriggerHandler {
   
    public static void onBeforeInsert(List<Account> newAccountList, Map<Id,Account> newAccountMap) {
        for ( Account newAccount : newAccountList) {
            if(newAccount.Phone == Null) {
                newAccount.addError('Favor informar o telefone');
            }else if (newAccount.Phone.length() < 11){
                newAccount.addError('Favor informar o telefone com DDD');
            }else{
                AccountTriggerHelper.formatPhone(newAccount);
            }
        }

    }


    public static void onAfterInsert(List<Account> newAccountList, Map<Id,Account> newAccountMap) {
        List<String> travelAccountList = new List<String>();

        for(Account newAccount : newAccountList){
            if(newAccount.RecordTypeId == Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Travel_Detail').getRecordTypeId())
            travelAccountList.add(newAccount.Id);
            if(!System.isFuture() && !System.isBatch()){
                TravelAccountHelper.filldress(newAccount.Id);
            }
            
            
        }     

        if(!System.isFuture() && !System.isBatch()){
            //(new TravelAccountHelper()).createOpportunities(travelAccountList);
            TravelAccountHelper.createOpportunities(travelAccountList);
        }

    }
}