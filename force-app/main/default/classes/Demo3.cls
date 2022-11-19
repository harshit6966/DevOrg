public class Demo3 {
    public static void FetchAccName(String p) {
        Set<String> s1 = new Set<String>();
        List<Account> acc = [SELECT Id, Name FROM Account WHERE Phone=:p];
        
        for(Account a:acc) {
            String s = a.Name;
            s1.add(s);
        }
        System.debug('The Account Record Matching the Phone' +s1);
    }
}