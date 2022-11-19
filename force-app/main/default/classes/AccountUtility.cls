public class AccountUtility {
    public static void viewAnnualRevenue() {
        List<Account> accountsList = [SELECT Name, AnnualRevenue FROM Account];
        for (Account accnt : accountsList) {
            String acctRev = accnt.Name + ':' + accnt.AnnualRevenue;
            System.debug(acctRev);
        }
    }
}