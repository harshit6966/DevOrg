public class zipValidationCtrl {
    
    public zipValidationCtrl(){
        zipCode = '';
        City = '';
        State = '';
    }
    
    public class zipReturn {
        String City;
    	String State;
    }
    
    public String zipCode { 
        get {return zipCode;}
        set {zipCode = value;} 
    }
    
    public String City { 
        get {return City;}
        private set {City = value;} 
    }
    public String State { 
        get {return State;}
        private set {State = value;} 
    }
    
    public PageReference zipCodeValidate(){
        String USERID = '087TRANT3273';
        String xmlBody = '<CityStateLookupRequest USERID="' + USERID +'"><ZipCode><Zip5>' + zipCode + '</Zip5></ZipCode></CityStateLookupRequest>';
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        String encoded = EncodingUtil.urlEncode(xmlBody, 'UTF-8');
        xmlBody = encoded;
        request.setEndpoint('http://production.shippingapis.com/ShippingApi.dll?API=CityStateLookup&XML='+xmlBody);
        HttpResponse response = http.send(request);
        String res = response.getBody();
        System.debug(res);
        
        Dom.Document doc = new Dom.Document();
        Dom.XmlNode xml = doc.getRootElement();
        doc.load(res);
        String state = xml.getChildElement('ZipCode', null).getChildElement('State', null).getText();
        String city = xml.getChildElement('ZipCode', null).getChildElement('State', null).getText();
        
        System.debug('State: '+state);
        System.debug('City: '+city);
        
        State = state;
        City = city;
        return null;
    }
}