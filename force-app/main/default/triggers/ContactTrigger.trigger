trigger ContactTrigger on Contact (after insert, after update, after delete) {
	ContactTriggerHandler.updateAccount(Trigger.new, Trigger.oldMap, Trigger.old);
}