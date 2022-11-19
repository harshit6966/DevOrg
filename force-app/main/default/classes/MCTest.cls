@isTest
public class MCTest {
    @isTest
    public static void anyName() {
        /*Account ac1 = new Account();
        ac1.name = 'KFC';
        ac1.AnnualRevenue = 100000000;
        ac1.BillingCity = 'Noida';
        try {
            insert ac1;
        }
        catch(Exception e) {
            System.debug('Invaild data');
        }*/
        
        Course__c crs1 = new Course__c();
        crs1.Name = 'MCA';
        crs1.Fees__c = 800;
        crs1.Duration_in_months__c = 4;
        
        Course__c crs2 = new Course__c();
        crs2.Name = 'CA';
        crs2.Fees__c = 1800;
        crs2.Duration_in_months__c = 4000;
        
        Course__c crs3 = new Course__c();
        crs3.Name = 'MA';
        crs3.Fees__c = 900;
        crs3.Duration_in_months__c = 6;
        
        Course__c crs4 = new Course__c();
        crs4.Name = 'MSc';
        crs4.Fees__c = 180000;
        crs4.Duration_in_months__c = 24;
        
        List<Course__c> courses = new List<Course__c>();
        courses.add(crs1);
        courses.add(crs2);
        courses.add(crs3);
        courses.add(crs4);
        
        try{
            insert courses;
        }
        catch(Exception e) {
            System.debug('Invalid data');
        }
        
        List<Course__c> allCourses = new List<Course__c>();
        for(Course__c course : allCourses){
            System.debug(course.id);
            System.debug(course.name);
            System.debug(course.Duration_in_Months__c);
            System.debug(course.Fees__c);
        }
        System.debug(allCourses);
    }
}