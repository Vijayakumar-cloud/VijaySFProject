public class DocumentsClass {

    	public static list<Document__c> DocMethod()
        {
            list<Document__c> IdProofList = new list<Document__c>();
            list<Document__c> finProofList = new list<Document__c>();
            list<Document__c> propProofList = new list<Document__c>();
            id recordtypid= Schema.SObjectType.Document__c.getRecordTypeInfosByDeveloperName().get('Files').getRecordTypeId();
            List<Document__C> docList =[Select id,Name,Related_Document__c from  Document__c];
            for(Document__c Doc: docList)
            {
                if(Doc.Recordtypeid == recordtypid && Doc.Related_Document__c == 'ID PROOF')
                {
                    IdProofList.add(Doc);
                }
               else if(Doc.Recordtypeid == recordtypid && Doc.Related_Document__c == 'FINANCE PROOF')
               {
                   finProofList.add(Doc);
               }
                else if(Doc.Recordtypeid == recordtypid && Doc.Related_Document__c == 'PROPERTY DOCS')
                {
                    propProofList.add(Doc);
                }

            }
            	return IdProofList;
        }
}