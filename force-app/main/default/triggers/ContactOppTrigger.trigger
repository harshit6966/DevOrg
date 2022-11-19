trigger ContactOppTrigger on Account (after insert) {
    if(Trigger.isAfter) {
        if(Trigger.isInsert) {
            ContactOppTriggerHandler.afterInsert(Trigger.new);
        }
    }
}