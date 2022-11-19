@isTest
private class AccountBatchProcessorTest {
    @isTest
    private static void testAccountBatchClass() {
        
        List<Account__c> accounts = new List<Account__c>();
        for (Integer i=0; i<100; i++) {
            accounts.add(new Account__c());
        }
        insert accounts;
        
        Test.startTest();
        AccountBatchProcessor abp = new AccountBatchProcessor();
        Id batchId = Database.executeBatch(abp, 200);
        Test.stopTest();
        
        List<Account__c> updateAccounts = [SELECT Id FROM Account__c WHERE Account_Status__c = 'Active'];
        System.assertEquals(100, updateAccounts.size(), 'ERROR: At least 1 Account record not updated correctly');
    }
}