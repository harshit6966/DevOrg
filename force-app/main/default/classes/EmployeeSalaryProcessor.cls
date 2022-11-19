public class EmployeeSalaryProcessor implements Schedulable {
	
    public void execute(SchedulableContext ctx) {
        //System.debug('Context ' + ctx.getTriggerId()); // Returns the ID of the CronTrigger schedule
        
        //Get 200 Lead records and modify the LeadSource field
        List<Employee__c> emps = [SELECT Id, Employee_Name__c, Account__c FROM Employee__c];
        for ( Employee__c emp : emps) {
             emp.Employee_Salary__c += 1000;
        }
        
        // Update the modified records
        update emps;
    }
}