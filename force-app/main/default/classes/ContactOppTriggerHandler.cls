public class ContactOppTriggerHandler {
    public static void afterInsert(List<Account> accList) {
        List<Contact> conList = new List<Contact>();
        List<Opportunity> oppList = new List<Opportunity>();
        Contact con;
        Opportunity opp;
        for(Account acc : accList) {
            // Creating instance of contact and opportunity
            con = new Contact();
            opp = new Opportunity();
            
            //Adding data to the newly created contact and opportunity
            con.LastName = acc.Name;
            con.AccountId = acc.Id;
            opp.Name = acc.Name;
            opp.Amount = acc.AnnualRevenue;
            opp.CloseDate = System.today();
            opp.StageName = 'Qualification';
            opp.Type = 'New Customer';
            opp.AccountId = acc.Id;
            
            // Adding newly created instance in the list
            conList.add(con);
            oppList.add(opp);
        }
        if(conList.size() > 0 && conList != null && oppList.size() > 0 && oppList != null) {
            insert conList;
            insert oppList;
        }
    }
    
    public static void afterUpdate(List<Account> accList) {
    	List<Contact> conList = new List<Contact>();
        conList = [SELECT AccountId, Name FROM Contact];
        Map<Id,Contact> conMap = new Map<Id,Contact>();
        List<Opportunity> oppList =  new List<Opportunity>();
        for(Contact con : conList) {
            conMap.put(con.Id, con);
        }
        System.debug(conMap);
        for(Account acc : accList) {
            Opportunity opp = new Opportunity();
            opp.AccountId = acc.Id;
            opp.StageName = 'Closed Won';
            opp.Name = 'Test';
            opp.Amount = 500000;
            opp.CloseDate = System.today();
            opp.Type = 'New Customer';
            oppList.add(opp);
            
            Contact con = new Contact();
            con.AccountId = acc.Id;
            con.LastName = acc.Name;
            conList.add(con);
        }
        if(oppList.size() > 0) insert oppList;
        update conList;
        System.debug(oppList[0]);
        
    }
}