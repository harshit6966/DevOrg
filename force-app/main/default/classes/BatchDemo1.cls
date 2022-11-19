global class BatchDemo1 implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc){
		return Database.getQueryLocator('Select Id, Name, Description From Account WHERE Id=\'0015j0000088T9GAAU\'');
	}
	
	global void execute(Database.BatchableContext bc, List<Account> scope){
        for(Account acc : scope) {
            acc.Description = 'BATCH_EXEC';
        }
	}

	global void finish(Database.BatchableContext bc){
        System.debug('Updated Description');
	}
}