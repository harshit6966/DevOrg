trigger Trg1 on Course__c (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    // Validation
    System.debug('Trigger Context Variable : EVENTS');
    System.debug('Trigger is Before' + Trigger.isBefore);
    System.debug('Trigger is After' + Trigger.isAfter);
    System.debug('Trigger is Insert' + Trigger.isInsert);
    System.debug('Trigger is Update' + Trigger.isUpdate);
    System.debug('Trigger is Delete' + Trigger.isDelete);
    System.debug('Trigger is Undelete' + Trigger.isUndelete);
    
    System.debug('Trigger Context Variable : DATA');
    
    System.debug('Old Version of records' + Trigger.old);
    System.debug('New Version of records' + Trigger.new);
    System.debug('Old Map Version of records' + Trigger.oldMap);
    System.debug('New Map Version of records' + Trigger.newMap);
    

}