public with sharing class ContentVersionClass {
        @AuraEnabled(cacheable=true)
        public static List<ContentVersion> getfilesrecord(string fileId){
        list<id> conlinkid=new list<id>();
        list<id> conVersionId= new list<Id>();
        list<ContentDocumentLink> Conlink = [select id, ContentDocumentId ,LinkedEntityId from ContentDocumentLink where LinkedEntityId=:fileId];
        for(ContentDocumentLink clink:conlink)
        {
            system.debug(clink.ContentDocumentId);


            conlinkid.add(clink.ContentDocumentId);
        }

        system.debug(conlinkid);
        list<ContentDocument> docLink= [select Id, FileType,LatestPublishedVersionId,Title from ContentDocument where id =:conlinkid];
        for(ContentDocument dLink: docLink)
        {
            system.debug(dLink.Title);
            conVersionId.add(dLink.LatestPublishedVersionId);
        }

        List<ContentVersion> contVers = new list<ContentVersion>();
        list<ContentVersion> Conver= [select id, ContentDocumentId,FirstPublishLocationId,PathOnClient, FileType from ContentVersion where id=:conVersionId ];

        for(ContentVersion cver: Conver)
        {
            system.debug(cver.PathOnClient);
            contVers.add(cver);

        }
        return contVers;
    }


    }