public class paginationExp {

public paginationExp(ApexPages.StandardSetController controller) {}

public ApexPages.StandardSetController controller {set;get;}
    public List<Course__c> getCor(){
        List<Course__c> crs=(List<Course__c>) controller.getRecords();
        return crs;
    }
    public paginationExp (){
        List<Course__c> crs=[select name,Duration_in_months__c,Fees__c from Course__c];
        controller=new Apexpages.StandardSetController(crs);
        controller.setPageSize(5);
    }
}