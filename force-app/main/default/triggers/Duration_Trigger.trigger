trigger Duration_Trigger on Course__c (before insert, before update, before delete, after insert) {
    // Validation
    //List<Course__c> courses = Trigger.new;
   
    // Insert event
    if(Trigger.isInsert){
        for (Course__c c1 : Trigger.new) {
        	if(c1.Duration_in_months__c > 10) {
            	c1.Duration_in_months__c.addError('Such long courses are not allowed');
        	}
    	}
    }
    
    // Update event
    if(Trigger.isUpdate){
        for (Course__c c1 : Trigger.new) {
        	if(c1.Duration_in_months__c > 8) {
            	c1.Duration_in_months__c.addError('Such long courses are not allowed');
        	}
    	}
    }
    
    if(Trigger.isDelete) {
    //List<Course__c> myCourses = Trigger.old;
    	for (Course__c c1 : Trigger.old) {
        	if(c1.Fees__c > 500) {
            	c1.Fees__c.addError('Deletion of expensive courses not allowed');
        	}
    	}
    }

	// Automation
    if(Trigger.isAfter) {
        //List<Course__c> myCourses = Trigger.new;
        Contact con1 = [SELECT Id, FirstName FROM Contact LIMIT 1];
        for(Course__c c1 : Trigger.new) {
            con1.FirstName = c1.Name;
        }
        update con1;
    }    
}