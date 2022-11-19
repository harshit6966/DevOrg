trigger AccountTrigger01 on Account (before insert, before update) {
    try {
        Set<String> accNames = new Set<String>();
        for(Account acc : Trigger.new) {
            accNames.add(acc.Name);
        }
    
        List<Account> accountList = new List<Account>([SELECT Id, Name FROM Account WHERE Name IN : accNames]);
        for(Account ac : Trigger.new) {
            ac.Name.addError('An account record with the name - ' +ac.Name+ ' already exists.');
        }
    } catch (Exception e) {
        System.debug('Error' + e.getMessage() + 'Line no. : ' + e.getLineNumber());
    }
}