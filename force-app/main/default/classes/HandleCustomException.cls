public class HandleCustomException extends Exception {
    public static void LogException(Database.Error e, String recordId, String objectName, String className, String methodName) {
        try {
            System.debug('Exception-----'+e);
            CustomException__c exc = new CustomException__c();
            if(recordId != null) {
                exc.Record_Id__c = recordId;
            }
            exc.Exception_Message__c = e.getMessage();
            exc.Object_Name__c = objectName;
            exc.Log_Time__c = System.now();
            exc.User__c = userInfo.getUserId();
            exc.Status_Code__c = String.valueOf(e.getStatusCode());
            exc.MethodName__c = methodName;
            exc.ClassName__c = className;
            Database.insert(exc);
        } finally {
        }
    }
}