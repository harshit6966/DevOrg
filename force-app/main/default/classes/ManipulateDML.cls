public class ManipulateDML {
    public static void anyName() {
    	//create the account sObject
    	Account acc = new Account(
        	Name='Acme', Phone='(415)555-1212', NumberOfEmployees=100);
    	//Insert the account by using DML
        insert acc;
        //Get the ID on the new inserted sObject argument
        ID accID = acc.Id;
        //Display the ID in the debug console
        System.debug('ID = ' + accID);
		}
}