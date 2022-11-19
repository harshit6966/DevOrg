trigger OpportunityName on Opportunity (after insert, after update) {

    List<Id> newlist = new List<Id>();
    Map<Account,List<Opportunity>> accToOpp = new map <Account,List<Opportunity>>();
    List <Account> newlistDML = new List<Account>();
    public decimal AmountClosedWon=0;
    public decimal AmountClosedLost=0;
    public decimal AmountInProgress=0;

    for(Opportunity opp : trigger.new) {
        //if(opp.StageName == 'Closed Won' || opp.StageName == 'Closed Lost') {
        newlist.add(opp.AccountId);
        //}
    }
    for(Account a : [SELECT Id,Total_Amount_Won__c, Total_Amount_Lost__c, Total_Amount_In_Progress__c,(SELECT Id,Amount,StageName FROM Opportunities) from Account WHERE Id IN : newlist]) {
        accToOpp.put(a, a.Opportunities);
        //AmountClosedWon=0;
        //AmountClosedLost=0;
        //AmountInProgress=0;
        for(Opportunity oppList : accToOpp.get(a)) {
            if(oppList.StageName == 'Closed Won'){
                AmountClosedWon= AmountClosedWon + oppList.Amount;
            }
            else if(oppList.StageName == 'Closed Lost'){
                AmountClosedLost=AmountClosedLost + oppList.Amount;
            }
            else{
               AmountInProgress =AmountInProgress + oppList.Amount;
            }
        }
        a.Total_Amount_Won__c = AmountClosedWon;
        a.Total_Amount_Lost__c= AmountClosedLost;
        a.Total_Amount_In_Progress__c= AmountInProgress;
        newlistDML.add(a);
    }      
    if(newlistDML.size()>0) update newlistDML;
}