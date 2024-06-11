trigger TriggerOnContact on Contact (after insert,after delete) {

    if(trigger.isafter && trigger.isinsert)
    {
        TriggerOnContactHandler.whileContactCreation(trigger.new);
    }
    if(trigger.isafter && trigger.isdelete)
    {
        TriggerOnContactHandler.whileContactDeletion(trigger.old);
    }
    
}