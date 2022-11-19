public with sharing class MVC_Controller {

    public Decimal crs_fees { get; set; }

    public Decimal crs_duration { get; set; }

    public String crs_name { get; set; }

    public PageReference cancel() {
        return null;
    }


    public PageReference quickSave() {
        Course__c crs4 = new Course__c();
        crs4.Name = crs_name;
        crs4.Fees__c = crs_fees;
        crs4.Duration_in_months__c = crs_duration;
        insert crs4;
        PageReference pr = new PageReference('/' + crs4.id);
        return pr;
    }


    public PageReference Save() {
        Course__c crs4 = new Course__c();
        crs4.Name = crs_name;
        crs4.Fees__c = crs_fees;
        crs4.Duration_in_months__c = crs_duration;
        insert crs4;
        /*PageReference pr = new PageReference(link to the page);
        return pr;*/
        return null;
    }

}