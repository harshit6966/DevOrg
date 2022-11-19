trigger ATrigger on Account (before insert) {
    if(Trigger.isBefore) {
        if(Trigger.isInsert) {
            ATriggerHandler.beforeInsert(Trigger.new);
        }
    }
}