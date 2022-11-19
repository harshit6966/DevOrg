trigger OpportunityTrigger1 on Opportunity (after insert, after update) {

    Map<Id, List<Opportunity>> acctoopp = new Map<Id, List<Opportunity>>();
    Set<Id> acctIds = new Set<Id>();
    List<Opportunity> opptyList = new List<Opportunity>();
    if(trigger.isUpdate || trigger.isInsert){
        for(Opportunity oppty : trigger.New){
            if(oppty.AccountId != null){
                acctIds.add(oppty.AccountId);
            }
        }    
    }
    
    if(acctIds.size() > 0){
        opptyList = [SELECT Amount, AccountId, StageName FROM Opportunity WHERE AccountId IN : acctIds];
        for(Opportunity oppty : opptyList){
            if(!acctoopp.containsKey(oppty.AccountId)){
                acctoopp.put(oppty.AccountId, new List<Opportunity>());
            }
            acctoopp.get(oppty.AccountId).add(oppty); 
        }   
        List<Account> acctList = new List<Account>();
        acctList = [SELECT Total_Amount_Won__c, Total_Amount_Lost__c, Total_Amount_In_Progress__c FROM Account WHERE Id IN: acctIds];
        for(Account acct : acctList){
            List<Opportunity> oppList = new List<Opportunity>();
            oppList = acctoopp.get(acct.Id);
            Double oppAmount = 0;
            for(Opportunity oppty : opplist){
                if(oppty.StageName == 'ClosedWon'){
                    acct.Total_Amount_Won__c = oppAmount + oppty.Amount;
                } else if(oppty.StageName == 'ClosedLost'){
                    acct.Total_Amount_Lost__c = oppAmount+oppty.Amount;
                } else if(oppty.StageName == 'Prospecting'|| 
                          oppty.StageName == 'Qualification'|| 
                          oppty.StageName == 'Proposal/Price Quote'||
                          oppty.StageName == 'Negotiation/Review'||
                          oppty.StageName == 'Awaiting Approval') {
                    acct.Total_Amount_In_Progress__c = oppAmount + oppty.Amount;
                } else {
                    acct.Total_Amount_In_Progress__c = 0;            
                }
            }
        }
        update acctList;
    }
}