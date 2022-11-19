public class ATriggerHandler {
	public static void beforeInsert(List<Account> accList) {
		Set<String> accNameSet = new Set<String>(); 
		for(Account acc : accList) {
			accNameSet.add(acc.Name);
		}
		
		List<Account> acList = [SELECT Id, Name
                                FROM Account
                                WHERE Name IN :accNameSet];
        
        for(Account a : accList) {
            if(acList.size() > 0) {
                a.addError('Account already exists with the name: ' +a.Name);
            }
        }
	}
}