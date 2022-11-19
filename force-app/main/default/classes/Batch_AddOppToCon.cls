public class Batch_AddOppToCon implements Database.Batchable <sObject>, Database.Stateful {
    //Batch_AddConToAcc
    Integer recordsProcessed = 0;
    List<Opportunity> oppList = new List<Opportunity>();
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        String query = 'SELECT Id, Name, LastActivityDate FROM Contact WHERE Id NOT IN (SELECT ContactId FROM Opportunity) AND Id=\'0035j000001mn11AAA\'';
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext bc,List<Contact> conList) {
        List<Opportunity> opList = [SELECT Name, Type, Amount, CloseDate, StageName FROM Opportunity];
        Opportunity opp;
        for (Contact c : conList) {
            opp =  new Opportunity();
			opp.Name = c.Name;
			opp.Type = 'New Customer';
			opp.Amount = 1000;
			opp.CloseDate = c.LastActivityDate;
            opp.StageName = 'Prospecting';
            opp.ContactId = c.Id;
            oppList.add(opp);
            recordsProcessed = recordsProcessed + 1;
        }
        insert oppList;
    }
    
    public void finish(Database.BatchableContext bc) {
        System.debug(recordsProcessed + ' records processed.');
    }
}