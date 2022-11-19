public class AnimalLocator {
    public static String getAnimalNameById(Integer id){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        String endpoint = 'https://th-apex-http-callout.herokuapp.com/animals/'+id;
        request.setEndpoint(endpoint);
        HttpResponse response = http.send(request);
        String strRes = '';
        System.debug('===StatusCode===' +response.getStatusCode());
        System.debug('===ResponseBody===' +response.getBody());
        
        if(response.getStatusCode() == 200){
            Map<String,Object> resMap = (Map<String,Object>)Json.deserializeUntyped(response.getBody());
            Map<String,Object> animalsMap = (Map<String,Object>)resMap.get('animal');
            System.debug('Animals recieved from response ' +animalsMap);
            strRes = string.valueOf(animalsMap.get('name'));
            System.debug('====StrResponse===' +strRes);
        }
        return strRes;
    }
}