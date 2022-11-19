public class AccountUtils {
    public static List<Account> accountsByState(String state) {
        List<Account> accList = [SELECT Id, Name, BillingState FROM Account WHERE BillingState = :state];
        return accList;
    }
}