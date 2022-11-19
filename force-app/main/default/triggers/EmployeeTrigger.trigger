trigger EmployeeTrigger on Employee__c (after insert, after update, after delete) {
    List<Employee__c> emp = Trigger.isDelete ? Trigger.old : Trigger.new;
    Set<Id> cmpIds = new Set<Id>();
    
    for (Employee__c e : emp) {
        if (Trigger.isUpdate && Trigger.oldMap.get(e.Id).Company__c != e.Company__c) {
            cmpIds.add(e.Company__c);
            cmpIds.add(Trigger.oldMap.get(e.Id).Company__c);
        }             
        if (String.isNotEmpty(e.Company__c)) {
            cmpIds.add(e.Company__c);
        }
    }
    
    List<Company__c> empNo = new List<Company__c>();
    for (AggregateResult ar : [SELECT Company__c cmpId, Count(id) EmployeeCount FROM Employee__c WHERE Company__c in: cmpIds GROUP BY Company__c]){
        Company__c cmp = new Company__c();
        cmp.Id = (Id) ar.get('cmpId'); 
        cmp.Number_of_Employees__c = (Integer) ar.get('EmployeeCount');
        empNo.add(cmp);                       
    }
    update empNo;
}