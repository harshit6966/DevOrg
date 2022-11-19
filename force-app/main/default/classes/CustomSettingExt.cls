public class CustomSettingExt {
    public List<State_Code__c> stcode {get;set;}
    
    public CustomSettingExt() {
        Map<String, State_Code__c> code = State_Code__c.getAll();
        stcode = code.values();
    }
}