public class Pagination {

    public ApexPages.StandardSetController props { get; set; }
    
    public Pagination(ApexPages.StandardSetController controller) {
        props = new ApexPages.StandardSetController(
          [SELECT Name, Duration_in_months__c FROM Course__c ]);
    }
}