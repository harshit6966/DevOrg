trigger AssignmentTrigger on Account (before update, after update) {
    
    List<Task> taskList = new List<Task>();
    
    for(Account acc : Trigger.new) {
        if(acc.Status__c == 'Completed'){
            List<Contact> contacts = [SELECT Id, OwnerId FROM Contact WHERE AccountID =: acc.Id LIMIT 1];
        
            for(Contact ct : contacts){
                Task t = new Task();
                t.WhatId = acc.Id;
                t.Subject = acc.Name + acc.Status__c;
                t.Priority = 'High';
                t.Status = 'In Progress';
                t.ownerid = ct.ownerid;
                if(contacts != NULL){
                    t.WhoId = contacts[0].id;
                }
                taskList.add(t);
        }
            insert taskList;
        }
    }
    
    for(Account acc : Trigger.new ){
      List<Contact> conlist = [SELECT FirstName, Email from Contact where AccountID =:acc.Id];
        
        List<String> emails = new List<String>();
    
    
        for(Contact c : conlist){
            emails.add(c.Email); //Get the email addresses of Contacts
        }
        
        Messaging.SingleEmailMessage mail=new Messaging.SingleEmailMessage();
        mail.setSaveAsActivity(true);
        mail.setSubject('Congratulations!!');
        mail.setPlainTextBody('Your account' + acc.Name + 'has completed the final stage.');
        mail.setToAddresses(emails) ; //list of emails
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
    }
}