public class AccountHandler {
    public static void insertAccount(Integer numOfNewAccounts) {
        List<Account> addAccounts = new List<Account>();
        Integer counter = 1;
        while(counter <= numOfNewAccounts) {
            Account acc = new Account();
            acc.Name = 'Acme Inc' + counter;
            acc.AccountNumber = 'A000' + counter;
            addAccounts.add(acc);
            counter = counter + 1;
        }
        insert addAccounts;
    }
}