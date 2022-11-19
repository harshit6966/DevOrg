public class BankAccount {
	// data members
	Integer ac_no;
    String ac_name;
    Integer ac_bal;
	// member Methods
	// Default constructor
    public BankAccount() {
        ac_no = 0;
        ac_name = 'no name';
        ac_bal = 0;
    }
    //Parameterized constructor
    public BankAccount(Integer ac_no, String ac_name, Integer ac_bal){
        this.ac_no = ac_no;
        this.ac_name = ac_name;
        this.ac_bal = ac_bal;
    }
	//input
	public void setValues(Integer ac_no, String ac_name, Integer ac_bal){
        this.ac_no = ac_no;
        this.ac_name = ac_name;
        this.ac_bal = ac_bal;
    }
    //action or process
    public void deposit(Integer amnt) {
        ac_bal += amnt;
    }
    public void withdraw(Integer amnt) {
        ac_bal -= amnt;
    }
    //output
    public void getValues() {
        System.debug('A/C Number: ' + ac_no);
        System.debug('A/C Name: ' + ac_name);
        System.debug('A/C Balance: ' + ac_bal);
    }
}