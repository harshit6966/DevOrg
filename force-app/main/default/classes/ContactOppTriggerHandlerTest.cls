@isTest(SeeAllData = false)
public class ContactOppTriggerHandlerTest {
	public static testMethod void testAccountMethod() {
        List<Account> accList = new List<Account>([SELECT Id, Name, AnnualRevenue FROM Account]);
        List<Contact> conList = new List<Contact>();
        List<Opportunity> oppList = new List<Opportunity>();
        
        Contact con = new Contact();
        Opportunity opp = new Opportunity();
        /*
        con.AccountId = accList[1].Id;
        con.LastName = accList[0].Name;
        
        opp.AccountId = accList[0].Id; 
        opp.Amount = accList[0].AnnualRevenue;
		*/
        con.LastName = 'Test Contact';
        opp.Name = 'Test Opportunity';
        opp.Amount = 500000;
        opp.StageName = 'Qualification';
        opp.Type = 'New Customer';
        opp.CloseDate = System.today();
        
        conList.add(con);
        oppList.add(opp);
        
        Test.startTest();
        insert conList;
        insert oppList;
        Test.stopTest();
        
        //System.assertEquals(opp.AccountId, accList[0].Id);
        //System.assertEquals(con.AccountId, accList[0].Id);
    }
}