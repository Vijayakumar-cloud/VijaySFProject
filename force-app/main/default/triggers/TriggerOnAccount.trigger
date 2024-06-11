trigger TriggerOnAccount on Account (before insert,after insert,before update,after update,before delete,after delete,after undelete)
{
    if(trigger.isbefore &&  trigger.isinsert)
    {
        TriggerOnAccountHandler.accountDescriptionFieldPopulate(trigger.new);
    }
    if(trigger.isbefore && trigger.isdelete)
    {
        TriggerOnAccountHandler.preventActiveAccountDeletion(trigger.old);
    }
    if (trigger.isafter && trigger.isinsert)
{
   TriggerOnAccountHandler.conAndOppCreationWithAccount(trigger.new);
        
}
    if(trigger.isbefore && trigger.isupdate)
    {
        
        TriggerOnAccountHandler.handlerForOldAccountName(trigger.new,trigger.oldmap);
    }
   
    if(trigger.isAfter && trigger.isupdate)
    {
             TriggerOnAccountHandler.inactiveAccRelatedConDelete(trigger.new);
   
    }
}