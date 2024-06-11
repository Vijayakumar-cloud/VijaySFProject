public with sharing class FileUploadViewController {
    @AuraEnabled(cacheable=true)
    public static map<ID,String> getRelatedFiles(String recordId){
         // Get record file IDs        
         List<ContentDocumentLink> files = [SELECT ContentDocumentId FROM ContentDocumentLink WHERE LinkedEntityId = :recordId];
         List<ID> fileIDs = new List<ID>();
         for (ContentDocumentLink docLink : files) {
             fileIDs.add(docLink.ContentDocumentId);
         }
  
         List<ContentVersion> docs = [SELECT ContentDocumentId, FileExtension, Title 
             FROM ContentVersion WHERE ContentDocumentId = : fileIDs];
        Map<ID, String> mapIdTitle = new Map<ID, String>();
      //  list<string> fileList = new list<string>();
         for (ContentVersion docLink : docs) {
             mapIdTitle.put(docLink.ContentDocumentId, docLink.Title);
               //FileList.add(docLink.ContentDocumentId);
         }
         return mapIdTitle;
    }


    
}