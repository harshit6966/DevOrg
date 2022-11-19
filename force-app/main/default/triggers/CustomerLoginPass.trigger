trigger CustomerLoginPass on Customer__c (before insert) {
	List<Customer__c> customer = Trigger.new;
    
    List<Account__c> acc = new List<Account__c>();
    for(Account__c a : acc){
        System.debug(a.Account_Status__c);
    }
    if(Trigger.isInsert == true){
        for(Customer__c c1 : customer){
            if(c1.Login_Id__c == null){
                c1.Login_Id__c.addError('Login ID must be provided');
            }
        }
    }
}