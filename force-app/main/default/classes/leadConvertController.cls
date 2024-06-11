public with sharing class leadConvertController
 {
    @AuraEnabled()
    
    public static list<Id> convert(String recId)
    {
       Lead l =[Select Name,Company from Lead where id=:recId];

       Database.LeadConvert lc = new Database.LeadConvert();

       lc.setLeadId(l.id);

       system.debug('Id of record inserted:'+l.id);

       lc.convertedstatus ='Closed - Converted';

       Database.LeadConvertResult lcr = Database.convertLead(lc);
       list<Id> retIds = new list<Id>();
       id accId = lcr.getAccountId();
        id conId = lcr.getcontactId();
        retIds.add(accId);
        retIds.add(conId);

        System.debug('doConvert AccountId Result: ' +accId);
        System.debug('doConvert ContactId Result: ' +conId);

        return retIds;
    }
}