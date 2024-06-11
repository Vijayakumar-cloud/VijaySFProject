public with sharing class ContactCOntroller {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(String accountid)
    
    {
       return [Select FirstName,LastName,Email from Contact where AccountId =: accountid];
    }
}