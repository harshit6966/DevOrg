public class AccountOppStagesSum {
    public static void Calculate() {
        List<Account> accountList = [SELECT Id, Total_Amount_Won__c, Total_Amount_Lost__c, Total_Amount_In_Progress__c FROM Account];
        List<Opportunity> oppList = new List<Opportunity>([SELECT AccountId, Amount, StageName FROM Opportunity WHERE AccountId IN : accountList]);
        for(Account acc : accountList) {
            for(Opportunity opp : oppList) {
                if(opp.StageName == 'Closed Won') {
                    acc.Total_Amount_Won__c += opp.Amount;
                } else if(opp.StageName == 'Closed Lost') {
                    acc.Total_Amount_Lost__c += opp.Amount;
                } else {
                    acc.Total_Amount_In_Progress__c += opp.Amount;
                }
            }
        }
    }
}