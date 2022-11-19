global class batchExample implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT Id,Name FROM Account WHERE Id=\'0015j0000088T9GAAU\'';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Account> accList) {
        for(Account acc : accList){
            acc.Name = acc.Name + 'Updated';
        }
        try {
            update accList;
        } catch(Exception e) {
            System.debug(e);
        }
    }
    global void finish(Database.BatchableContext BC) {
        // execute any post-processing operations
  	}
}