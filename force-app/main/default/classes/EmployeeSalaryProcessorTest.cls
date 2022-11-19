@isTest
private class EmployeeSalaryProcessorTest {
	
    private static String CRON_EXP = '0 0 17 ? * 6L'; //runs the last friday of every month at 5:00 PM
    
    @isTest
    private static void testSchedulableClass() {
        
        // Load test data
        List<Employee__c> emps = new List<Employee__c>();
        for (Integer i=0; i<500; i++) {
            
        }
        insert emps;
        
        // Perform the test
        Test.startTest();
        String jobId = System.schedule('Process Employee Salary', CRON_EXP, new EmployeeSalaryProcessor());
        Test.stopTest();
        
        // Check the result
        List<Employee__c> updateEmployee = [SELECT Id, Employee_Name__c, Account__c FROM Employee__c];
        System.assertEquals(200, updateEmployee.size(), 'ERROR: At least 1 record not updated correctly');
        
        // Check the scheduled time
        List<CronTrigger> cts = [SELECT Id, TimesTriggered, NextFireTime FROM CronTrigger WHERE Id = :jobId];
    	System.debug('Next Fire Time ' + cts[0].NextFireTime);
    }
}