public with sharing class DocsClass {
    @AuraEnabled(cacheable=true)
    public static list<Document__c> getdocs(String oppid){
        try {
            id recotdtypeid=Schema.SObjectType.Document__c.getRecordTypeInfosByDeveloperName().get('Folder').getRecordTypeId();
        return [SELECT Id,Name FROM Document__c WHERE Opp_Name__c =:oppid AND RecordTypeId=:recotdtypeid ];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<Document__c> getFiles(string oppid,string folderid){
        try {
            id recotdtypeid=Schema.SObjectType.Document__c.getRecordTypeInfosByDeveloperName().get('Files').getRecordTypeId();
            return [SELECT Id,Name FROM Document__c WHERE Opp_Name__c =:oppid AND RecordTypeId=:recotdtypeid AND Related_Document__c=:folderid];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

}