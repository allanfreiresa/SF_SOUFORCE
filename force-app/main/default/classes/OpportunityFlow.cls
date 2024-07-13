public with sharing class OpportunityFlow {
    @InvocableMethod(label= 'Opportunity Flow' description = 'Run Opportunity Flow by Apex')
    public static void OpportunityFlow(List<Opportunity> records) {
        //Regra de negocio
        System.debug(records);
    }
}