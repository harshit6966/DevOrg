public class BankAcct {
    private integer balance = 0;
    public String acctName;
    public String accttype;
    
    public void makeDeposit(integer deposit) {
        balance += deposit;
    }
    
    public integer getBalance() {
        return balance;
    }
}