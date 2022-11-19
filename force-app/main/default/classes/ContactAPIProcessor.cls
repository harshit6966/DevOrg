public without sharing class ContactAPIProcessor implements Database.Batchable<sObject>, Database.Stateful, Database.AllowsCallouts {
    public static Integer recordsProcessed = 0;

    public static List<sObject> start(Database.BatchableContext bc){
        List<Contact> conList = new List<Contact>();
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://gorest.co.in/public/v1/users');
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200){
            String jsonString = response.getBody();
            Map<String,Object> resMap = (Map<String,Object>)Json.deserializeUntyped(jsonString);
            System.debug('==========' +resMap);
            List<Object> dataList = (List<Object>)resMap.get('data');
            for(Integer i = 0; i < dataList.size(); i++){
                Map<String,Object> conMap = (Map<String,Object>)dataList[i];
                System.debug('=========' +conMap);
                Id id = (Id)conMap.get('Id');
                String name = (String)conMap.get('name');
                String email = (String)conMap.get('email');
                String status = (String)conMap.get('status');
                String gender = (String)conMap.get('gender');

                Contact con = new Contact();
                con.Id = id;
                con.LastName = name;
                con.Email = email;
                con.Status__c = status;
                con.Gender__c = gender;
                conList.add(con);
            }
        }
        return conList;
    }

    public static void execute(Database.BatchableContext bc, List<Contact> conList){
        recordsProcessed++;
        if(conList.size() > 0){
            upsert conList;
        }
    }

    public static void finish(Database.BatchableContext bc){
        System.debug(recordsProcessed + ' records Processed!');
    }
}