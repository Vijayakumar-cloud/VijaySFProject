//This controller is sample one for sorting records based on multiple fields
public class RecordsController {
    
 
    
    public static void sortAccountmethod()
    {
        list<Account> accList = [select id,name,city__c,type,industry,isEmailAvail__c,yearStarted,typeName__c,Agetxt__c,NameFirstLetter__c,createdDate,DateCreated__c from Account  order by lastmodifiedDate desc limit 80];
        map<string,string> sortMap = new map<string,string>();
		sortMap.put('name','asc');
        sortMap.put('isEmailAvail__c','asc');
		sortMap.put('city__c','asc'); 
        sortMap.put('Agetxt__c','desc');
        sortMap.put('NameFirstLetter__c','asc');
        sortMap.put('DateCreated__c','desc');
        SobjectSortbyLoopCntrlr sobjSort = new SobjectSortbyLoopCntrlr(accList);
        sobjSort.sort(sortMap);
       
    }
}