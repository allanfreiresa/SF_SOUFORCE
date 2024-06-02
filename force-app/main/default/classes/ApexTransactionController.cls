public with sharing class ApexTransactionController {
    public static void saveAccount() {
        System.debug('Method Started');

        //Inserir uma conta
        Account account = new Account(Name= 'Test Apex Transaction Acc', Phone= '11997617741');
        insert account;

        Contact contact = new Contact(Account= account, LastName= 'Test Apex Transaction Contact');
        insert contact;

        Case caseAccount = new Case(Account=account, Subject= 'Test Apex Transaction Case');
        insert caseAccount;

        System.debug('Method Finished');

        Contact accDelete = [SELECT Id, Name FROM Contact WHERE Id = '003aj000002jIXVAA2'];
        delete accDelete;
    }
}


//Schema sObject
//Informações de nome de tipo de registro
System.debug(Schema.SObjectType.Account.getRecordTypeInfosByName());

//Instancia do Fields da SObjects
System.debug(Schema.SObjectType.Account.fields);

//Vai mostrar informações desse campo
System.debug(Schema.SObjectType.Account.fields.Name);


//executar classe
//ApexTransactionController.saveAccount();
//[SELECT Id, Name, Phone FROM Account WHERE Name = 'Test Apex Transaction Acc']
//[SELECT Id, LastName, Name FROM Contact WHERE LastName= 'Test Apex Transaction Contact']