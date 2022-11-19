@isTest
private class TestRestrictContactByName {
	@isTest
    public static void testContact() {
        Contact con = new Contact();
        con.LastName = 'INVALIDNAME';
        Database.SaveResult res = Database.insert(con,false);
        
        System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML', res.getErrors()[0].getMessage());
    }
}