public with sharing class CLC_Controller {
    public PageReference first() {
        return null;   
    }

    public PageReference last() {
        return null;   
    }

    public PageReference next() {
        return null;   
    }

    public PageReference previous() {
        return null;   
    }

    public PageReference fetchRecords() {
        my_courses = [SELECT Id, Name, Duration_in_months__c, Fees__c FROM Course__c];
        return null;
    }

    public List<Course__c> my_courses {get; set;}
}