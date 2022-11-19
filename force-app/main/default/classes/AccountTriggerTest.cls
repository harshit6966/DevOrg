@isTest
public class AccountTriggerTest {
    @isTest static void TestCreateNewAccountInBulk() {
        List<Account> accList = new List<Account>();
        Account acc;
        for(Integer i=0; i<200; i++) {
            acc = new Account();
            acc.Name = 'Test ' + i;
            acc.BillingState = 'CA';
            accList.add(acc);
        }
        Test.startTest();
        insert accList;
        Test.stopTest();
        
        System.assertEquals(200, [SELECT Count() FROM Account WHERE ShippingState = 'CA' ]);
    }  
}