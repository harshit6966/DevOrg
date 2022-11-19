trigger EmployeeCnt on Company__c (after insert, after delete) {
    List<Employee__c> emp = new List<Employee__c>();
    List<Company__c> countList = [SELECT Id, Number_of_Employees__c FROM Company__c];
    Integer count = countList.size();
    if(emp.size() > 0 && emp != null) {
    	count++;
    }
}