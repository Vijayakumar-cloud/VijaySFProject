trigger TriggerOnInvoiceLine on Invoice_Line_item__c (before insert,after insert,before update,after update,before delete,after delete,after undelete)
{
	if(trigger.isafter && (trigger.isInsert || trigger.isUpdate || trigger.isUndelete))
    {	
        TriggerOnInvoiceLinehandler.handlerOne(trigger.new);
    }
    if(trigger.isafter && trigger.isdelete)
    {
       TriggerOnInvoiceLinehandler.handlerOne(trigger.old);

    }
}