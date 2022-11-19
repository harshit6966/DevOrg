@isTest
public class BankAccountTest {
    public static testMethod void anyName() {
        BankAccount b1 = new BankAccount();
        b1.getValues();
        b1.setValues(101, 'Harshit Kumar', 1500000);
    	b1.getValues();
        b1.deposit(300000);
        b1.getValues();
        b1.withdraw(75000);
        b1.getValues();
        
        BankAccount b2 = new BankAccount(102, 'Dheeraj', 5000000);
        b2.getValues();
    }
}