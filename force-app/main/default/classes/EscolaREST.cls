@RestResource(urlMapping='/Escola')
global with sharing class EscolaREST {

    @HttpGet
    global static List<Escola__c> getEscolas() {
        return [SELECT Id, Name, Idioma__c, Valor_Semana_General__c, Valor_Semana_Part_Time__c FROM Escola__c];
    }

    @HttpPost
    global static Escola__c insertEscola(Escola__c escola){
        insert escola;
        return escola;
    }

    @httpPut
    global static Escola__c upsertEscola(Escola__c escola){
        upsert escola;
        return escola;
    }

    @HttpPatch
    global static Escola__c updateEscola(Escola__c escola){
       update escola;
       return escola;
    }

    @httpDelete

    global static Boolean deleteEscola(){

        try{
        Id idEscola = (Id)RestContext.request.params.get('Id');
        Escola__c escolaToDelete = new Escola__c(Id = idEscola);
        
        delete escolaToDelete;

        return true;

        } catch(Exception ex) {

            return false;
        }
        /*try{
            delete [SELECT Id, Name, Idioma__c, Valor_Semana_General__c, Valor_Semana_Part_Time__c FROM Escola__c WHERE Id = :escolaId];
            return true;
        }
       */
    }
}