trigger AccountPlatformEvent on Account (after insert,after update) {
    
    if((trigger.isafter&& trigger.isupdate) || (trigger.isafter&& trigger.isupdate))
    {
        list<Account_Platform_Event__e> AccountPlatformEventsList= new list<Account_Platform_Event__e>();
        for(Account acc : trigger.new)
        {
            Account_Platform_Event__e accEvent =  new Account_Platform_Event__e();
            accEvent.Account_Industry__c = acc.Industry;
            accEvent.Account_Name__c = acc.Name;
            accEvent.Account_Status__c = acc.Status__c;
            accEvent.Account_Type__c = acc.Type;
            AccountPlatformEventsList.add(accEvent);
        }
        EventBus.publish(AccountPlatformEventsList);
    }
}