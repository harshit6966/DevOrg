// Create Related Contact When Account Is Created.
// Object: Account.
// Based on account do something to contact - after.
// At time of insertion - (after insert).
// Logic Inside - AccountTrigger1Handler.
// Written by - Harshit Kumar

trigger AccountTrigger1 on Account (after insert) {
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            AccountTrigger1Handler.afterInsert(Trigger.new);
        }
    }
}