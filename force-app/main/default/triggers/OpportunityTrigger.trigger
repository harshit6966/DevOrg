trigger OpportunityTrigger on Opportunity (before insert) {
    if(Trigger.isBefore) {
        if(Trigger.isInsert || Trigger.isUpdate) {
            //OpportunityTriggerHandler.calculateExpRevenue(Trigger.new);
        }
    }
}