trigger AccountNumber on Account__c (before insert, before update) {
	List<Account__c> account = Trigger.new;
    if(Trigger.isInsert == true){
        for(Account__c a1 : account){
            if(a1.Account_Number__c < 11) {
                a1.Account_Number__c.addError('Account Number must be of 11 digits');
            }
        }
    }
}