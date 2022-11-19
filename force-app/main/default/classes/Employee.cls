public class Employee {
	// data members
	private String empName;
    private String empDepartment;
    private String empEmail;
   	private Integer empSalary;
    
	// member Methods
    public Employee() {
        empName = 'Gaurav Kumar Sinha';
        empDepartment = 'Public Service';
        empEmail = 'gauravksinha@gmail.com';
        empSalary = 1500000;
    }
    
    public Employee(String name, String dept, String email, Integer salary) {
        empName = name;
        empDepartment = dept;
        empEmail = email;
        empSalary = salary;
    }
    
    public void setValues(String name, String dept, String email, Integer salary) {
        empName = name;
        empDepartment = dept;
        empEmail = email;
        empSalary = salary;
    }
    
    public void getValues() {
        System.debug('Employee Name: ' + empName);
        System.debug('Employee Dept: ' + empDepartment);
        System.debug('Email Address: ' + empEmail);
        System.debug('Employee Salary: ' + empSalary);
    }
}