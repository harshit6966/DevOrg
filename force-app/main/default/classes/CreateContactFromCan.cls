public class CreateContactFromCan {
    public static void createContact(List<Candidate__c> candsFromTrigger) {
        List<Account> candAccts = [SELECT Id, Name FROM Account WHERE Name = 'Recruiting'];
        List<Contact> conList = new List<Contact>();
        Contact con;
        for(Candidate__c currentCandidate : candsFromTrigger) {
            //Create a Contact and add it to conList
            //Set the FirstName, LastName, and Email attributes to match the
            //corresponding attributes of the currentCandidate object (First_Name__c,
            //Last_Name__c, and Email__c)
            
            //1st way
            con = new Contact();
            con.AccountId = candAccts[0].id;
            con.FirstName = currentCandidate.First_Name__c;
            con.LastName = currentCandidate.Last_Name__c;
            con.Email = currentCandidate.Email__c;
            conList.add(con);
            
            //Outside for loop
            //insert conList;
            
            //2nd way
            conList.add(new Contact(
            	AccountId = candAccts [0].id,
            	FirstName = currentCandidate.First_Name__c,
            	LastName = currentCandidate.Last_Name__c,
            	Email = currentCandidate.Email__c)
            );
        }
        //Save conList to database
        Database.insert(conList);
    }
}