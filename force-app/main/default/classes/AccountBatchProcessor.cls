public without sharing class AccountBatchProcessor implements Database.Batchable<sObject>, Database.Stateful {
	
    public Integer recordCount = 0;
	
    public Database.QueryLocator start(Database.BatchableContext dbc) {
        return Database.getQueryLocator([SELECT Id FROM Account__c]);
    }
    
    public void execute(Database.BatchableContext dbc, List<Account__c> accounts) {
        for(Account__c acc : accounts) {
            acc.Account_Status__c = 'Active';
        }
        update accounts;
        recordCount = recordCount + accounts.size();
    }
    
    public void finish(Database.BatchableContext dbc) {
        System.debug('Total records processed ' + recordCount);
    }
}