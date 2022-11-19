public class ContactTriggerHandler {
    /* Parameters:
    * conList -> Trigger.new
    * oldConMap -> Trigger.oldMap
    * oldConList -> Trigger.old
    */
    public static void updateAccount(List<Contact> conList, Map<Id,Contact> oldConMap, List<Contact> oldConList) {
        List<Account> accListToUpdate = new List<Account>();
        // accIdSet for storing accountId related to the contact
        Set<Id> accIdSet = new Set<Id>();
        // Using trigger context variable to ensure trigger is fired on after insert
		if(Trigger.isInsert) {
			if(Trigger.isAfter) {
			// looping on conList having values from Trigger.new
				for(Contact con : conList) {
            		if(con.AccountId != null) {
                	// adding accountId to accIdSet
						accIdSet.add(con.AccountId);
					}
				}
			}	
		}
		// Using trigger context variable to ensure trigger is fired on after update
		if(Trigger.isUpdate) {
			if(Trigger.isAfter) {
				for(Contact con : conList) {
				// checking old values from oldMap
					if(con.AccountId != oldConMap.get(con.Id).AccountId) {
						accIdSet.add(con.AccountId);
						accIdSet.add(oldConMap.get(con.Id).AccountId);
					}
				}
			}
		}
		// Using trigger context variable to ensure trigger is fired on after delete
		if(Trigger.isDelete) {
			if(Trigger.isAfter) {
				for(Contact con : oldConList) {
					if(con.AccountId != null) {
						accIdSet.add(con.AccountId);
					}
				}
			}
		}
		// query to fetch No_of_Insured__c and related contacts from account
		List<Account> accList = [SELECT Id, No_of_Insured__c, (SELECT Id FROM Contacts) FROM Account WHERE Id IN : accIdSet];
        for(Account acc : accList) {
            acc.No_of_Insured__c = acc.Contacts.size();
            accListToUpdate.add(acc);
        }
		// check to make sure list is not empty
		if(accListToUpdate.size() > 0) {
        	update accListToUpdate;
        }
		// query to fetch No_of_Active_Policies__c, No_of_Approved_Claims__c from account and subquery to
		// fetch Policy__r.Status__c, Claim__r.Status__c based on the business requirement.
		List<Account> policyClaimList = [SELECT No_of_Active_Policies__c, No_of_Approved_Claims__c, (SELECT AccountId, Policy__r.Status__c, Claim__r.Status__c FROM Contacts WHERE (Policy__r.Status__c = 'Active' OR Claim__r.Status__c = 'Approved') AND Id IN : conList) FROM Account WHERE Id IN : accIdSet];
        for(Account acc : policyClaimList) {
        	for(Contact con : acc.Contacts) {
        		if(con.Policy__r.Status__c == 'Active') {
        			acc.No_of_Active_Policies__c += 1;
        		}
				if(con.Claim__r.Status__c == 'Approved') {
					acc.No_of_Approved_Claims__c += 1;
				}
			}
			update policyClaimList;
		}
	}
}