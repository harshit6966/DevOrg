public without sharing class TransactionBatchProcessing implements Database.Batchable<sObject>, Database.Stateful {
	
    public Integer recordCount = 0;
	
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([SELECT Id FROM Transaction__c]);
    }
    
    public void execute(Database.BatchableContext dbc, List<Transaction__c> transactions) {
        for(Transaction__c tr : transactions) {
            tr.Payment_Gateway__c = 'Bill Desk';
        }
        update transactions;
        recordCount = recordCount + transactions.size();
    }
    
    public void finish(Database.BatchableContext bc) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
		String[] toAddresses = new String[] {'harshit6966@gmail.com'};
		mail.setToAddresses(toAddresses);
		mail.setSubject('Apex Batch Job is done');
        mail.setPlainTextBody('The batch Apex job processed');
		Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        
        System.debug('Total records processed ' + recordCount);
    }
}