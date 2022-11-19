@isTest
public class EmployeeTest {
    static testMethod void main() {
        System.debug('First Test Method');
        Employee emp = new Employee();
        emp.getValues();
        emp.setValues('Harshit Kumar', 'IT', 'harshit6966@gmail.com', 500000);
        emp.getValues();
        Employee obj = new Employee('Dheeraj Kumar', 'Construction', 'dheeraj8.india@gmail.com', 5000000);
        obj.getValues();
    }
}