// Update Account description, number of employees, 
// contact last name using batch apex. 
// Get the failure record ids in the email.
// Also, schedule the job for every Monday.

public without sharing class AccProcessor implements Database.Batchable<sObject>, Database.Stateful, Schedulable {
    
    public AccProcessor(){}
    Set<Id> successRecordSet = new Set<Id>();
    Set<Id> failRecordSet = new Set<Id>();
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        String query = 'SELECT Id, Description, NumberOfEmployees, (SELECT LastName FROM Contacts) FROM Account';
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext bc, List<Account> accList){
        
        List<Account> accToUpdate = new List<Account>();
        List<Contact> conToUpdate = new List<Contact>();
        
        for(Account acc : accList){
            acc.Description = 'Updated through batch Apex';
            acc.NumberOfEmployees = 100;
            accToUpdate.add(acc);

            for(Contact c : acc.contacts){
                c.LastName = 'Test + acc';
                conToUpdate.add(c);
            }
        }

        Database.SaveResult[] accSaveList = Database.update(accToUpdate, false);
        Database.SaveResult[] conSaveList = Database.update(conToUpdate, false);

        for(Database.SaveResult sr : accSaveList){
            if(sr.isSuccess()){
                successRecordSet.add(sr.getId());
            }
            else{
                for(Database.Error err : sr.getErrors()){
                    failRecordSet.add(sr.getId());
                }
            }
        }

        for(Database.SaveResult sr : conSaveList){
            if(sr.isSuccess()){
                successRecordSet.add(sr.getId());
            }
            else{
                for(Database.Error err : sr.getErrors()){
                    failRecordSet.add(sr.getId());
                }
            }
        }
    }

    public void finish(Database.BatchableContext bc){
        AsyncApexJob a = [SELECT Id, 
                            Status, 
                            NumberOfErrors, 
                            JobItemsProcessed,
                            TotalJobItems, 
                            CreatedBy.Email 
                            FROM AsyncApexJob 
                            WHERE Id = : bc.getJobId()];
       	Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {a.CreatedBy.Email};
        mail.setToAddresses(toAddresses);
        mail.setSubject('Account and contact update' + a.Status);
        mail.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems +
        ' batches with '+ a.NumberOfErrors + ' failures.'+successRecordSet+'successRecordids: '+ 'failRecordids: '+ failRecordSet);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }

    public void execute(SchedulableContext sc){
        database.executeBatch(new AccProcessor(),100);
       //for cron expression
        // String cronexpression = ‘0 0 0 ? * * *’
       // System.schedule(‘Testing’, cronexpression, testobj);    
    }
}