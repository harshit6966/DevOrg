public class AccountTrigger1Handler {
    public static void afterInsert(List<Account> accList){
        List<Contact> conList = new List<Contact>();
        Contact con;
        for(Account a : accList){
            con = new Contact();
            con.AccountId = a.Id;
            con.LastName = a.Name;
            con.Phone = a.Phone;
            conList.add(con);
        }
        if(conList.size() > 0) insert conList;
    }
}