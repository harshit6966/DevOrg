public class Demo1 {
    public void CreateAccount(String Name, String Phone, String Active) {
        Account acc = new Account();
        acc.Name = Name;
        acc.Phone = Phone;
        acc.Active__c = Active;
        
        insert acc;
        System.debug('Account Inserted Successfully' +acc.Name);
    }
}