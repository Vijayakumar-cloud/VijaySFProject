trigger ApexTriggerContextExample on Account (before insert,before update,after insert ,after update,before delete,after delete,after undelete) {

    if(Trigger.isBefore)
    {
        if(Trigger.isInsert)
        {
            system.debug('isExecuting ==> '+ Trigger.isExecuting);
            system.debug('isInsert ==> '+ Trigger.isInsert);
            system.debug('isUpdate ==> '+ Trigger.isUpdate);
            system.debug('isDelete ==> '+ Trigger.isDelete);
            system.debug('isBefore ==> '+ Trigger.isBefore);
            system.debug('isAfter ==> '+ Trigger.isAfter);
            system.debug('isUndelete ==> '+ Trigger.isUndelete);
            system.debug('new ==> '+ Trigger.new);
            system.debug('newMap ==> '+ Trigger.newMap);
            system.debug('old ==> '+ Trigger.old);
            system.debug('oldMap ==> '+ Trigger.oldMap);
            system.debug('operationType	==> '+ Trigger.operationType);
            system.debug('size ==> '+ Trigger.size);    
        }
        if(Trigger.isUpdate)
        {
            system.debug('isExecuting ==> '+ Trigger.isExecuting);
            system.debug('isInsert ==> '+ Trigger.isInsert);
            system.debug('isUpdate ==> '+ Trigger.isUpdate);
            system.debug('isDelete ==> '+ Trigger.isDelete);
            system.debug('isBefore ==> '+ Trigger.isBefore);
            system.debug('isAfter ==> '+ Trigger.isAfter);
            system.debug('isUndelete ==> '+ Trigger.isUndelete);
            system.debug('new ==> '+ Trigger.new);
            system.debug('newMap ==> '+ Trigger.newMap);
            system.debug('old ==> '+ Trigger.old);
            system.debug('oldMap ==> '+ Trigger.oldMap);
            system.debug('operationType	==> '+ Trigger.operationType);
            system.debug('size ==> '+ Trigger.size);
        }
        if(Trigger.isDelete)
        {
            system.debug('isExecuting ==> '+ Trigger.isExecuting);
            system.debug('isInsert ==> '+ Trigger.isInsert);
            system.debug('isUpdate ==> '+ Trigger.isUpdate);
            system.debug('isDelete ==> '+ Trigger.isDelete);
            system.debug('isBefore ==> '+ Trigger.isBefore);
            system.debug('isAfter ==> '+ Trigger.isAfter);
            system.debug('isUndelete ==> '+ Trigger.isUndelete);
            system.debug('new ==> '+ Trigger.new);
            system.debug('newMap ==> '+ Trigger.newMap);
            system.debug('old ==> '+ Trigger.old);
            system.debug('oldMap ==> '+ Trigger.oldMap);
            system.debug('operationType	==> '+ Trigger.operationType);
            system.debug('size ==> '+ Trigger.size);
        }
    }
    if(Trigger.isAfter)
    {
        if(Trigger.isInsert)
        {
            system.debug('isExecuting ==> '+ Trigger.isExecuting);
            system.debug('isInsert ==> '+ Trigger.isInsert);
            system.debug('isUpdate ==> '+ Trigger.isUpdate);
            system.debug('isDelete ==> '+ Trigger.isDelete);
            system.debug('isBefore ==> '+ Trigger.isBefore);
            system.debug('isAfter ==> '+ Trigger.isAfter);
            system.debug('isUndelete ==> '+ Trigger.isUndelete);
            system.debug('new ==> '+ Trigger.new);
            system.debug('newMap ==> '+ Trigger.newMap);
            system.debug('old ==> '+ Trigger.old);
            system.debug('oldMap ==> '+ Trigger.oldMap);
            system.debug('operationType	==> '+ Trigger.operationType);
            system.debug('size ==> '+ Trigger.size);
        }
        if(Trigger.isUpdate)
        {
            system.debug('isExecuting ==> '+ Trigger.isExecuting);
            system.debug('isInsert ==> '+ Trigger.isInsert);
            system.debug('isUpdate ==> '+ Trigger.isUpdate);
            system.debug('isDelete ==> '+ Trigger.isDelete);
            system.debug('isBefore ==> '+ Trigger.isBefore);
            system.debug('isAfter ==> '+ Trigger.isAfter);
            system.debug('isUndelete ==> '+ Trigger.isUndelete);
            system.debug('new ==> '+ Trigger.new);
            system.debug('newMap ==> '+ Trigger.newMap);
            system.debug('old ==> '+ Trigger.old);
            system.debug('oldMap ==> '+ Trigger.oldMap);
            system.debug('operationType	==> '+ Trigger.operationType);
            system.debug('size ==> '+ Trigger.size);
        }
        if(Trigger.isDelete)
        {
            system.debug('isExecuting ==> '+ Trigger.isExecuting);
            system.debug('isInsert ==> '+ Trigger.isInsert);
            system.debug('isUpdate ==> '+ Trigger.isUpdate);
            system.debug('isDelete ==> '+ Trigger.isDelete);
            system.debug('isBefore ==> '+ Trigger.isBefore);
            system.debug('isAfter ==> '+ Trigger.isAfter);
            system.debug('isUndelete ==> '+ Trigger.isUndelete);
            system.debug('new ==> '+ Trigger.new);
            system.debug('newMap ==> '+ Trigger.newMap);
            system.debug('old ==> '+ Trigger.old);
            system.debug('oldMap ==> '+ Trigger.oldMap);
            system.debug('operationType	==> '+ Trigger.operationType);
            system.debug('size ==> '+ Trigger.size);
        }
        if(Trigger.isUndelete)
        {
            system.debug('isExecuting ==> '+ Trigger.isExecuting);
            system.debug('isInsert ==> '+ Trigger.isInsert);
            system.debug('isUpdate ==> '+ Trigger.isUpdate);
            system.debug('isDelete ==> '+ Trigger.isDelete);
            system.debug('isBefore ==> '+ Trigger.isBefore);
            system.debug('isAfter ==> '+ Trigger.isAfter);
            system.debug('isUndelete ==> '+ Trigger.isUndelete);
            system.debug('new ==> '+ Trigger.new);
            system.debug('newMap ==> '+ Trigger.newMap);
            system.debug('old ==> '+ Trigger.old);
            system.debug('oldMap ==> '+ Trigger.oldMap);
            system.debug('operationType	==> '+ Trigger.operationType);
            system.debug('size ==> '+ Trigger.size);
        }
    }
    
}