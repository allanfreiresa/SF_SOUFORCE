public with sharing class dmlClass {
    public dmlClass() {

        Account acc = new Account();
        acc.Name = 'Aula Dml';
        Savepoint sp = Database.setSavepoint();
        try {
            insert acc;    
            integer i = 1/0;
        } catch (Exception ex) {
            System.debug('Roollback');
            Database.rollback(sp);            
        }
        

        Account accUpdate = [SELECT Id, Name FROM Account WHERE Name = 'Aula Dml'];
        accUpdate.Type = 'aula';
        update accUpdate;

        Account accDelete = [SELECT Id, Name FROM Account WHERE Name = 'Aula Dml'];
        delete accDelete;

        Account accUpsert = new Account();
        accUpsert.Name = 'UPSERT';
        upsert accUpsert;

        Account accUpsert = [SELECT Id, Name FROM Account WHERE Name = 'UPSERT'];
        accUpsert.Type = 'aula upsert';
        upsert accUpsert;

        [SELECT Id, Name, Type FROM Account WHERE Name = 'Aula Dml']
        [SELECT Id, Name, Type FROM Account WHERE Name = 'UPSERT']
    }
}