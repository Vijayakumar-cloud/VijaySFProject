// This class is used as utility for all generic apex action like soql query etc
public class UtilityClassCntrlr {

    //This method returns accountList from server;
    Public static list<Account> getAccounts(string fieldName1,list<string> value1,string fieldName2,list<string> value2)
    {

       	String query = 'select id,Name,type,Industry from Account ';
        if(fieldName1 != null && fieldName2 == null)
        {
            query += ' Where ' +fieldName1+' =: value1 ';
        }
        if(fieldName2 != null && fieldName1 == null)
        {
            query += ' Where ' +fieldName2+'=: value2 ';
        }
        if(fieldName2 != null && fieldName1 != null)
        {
            query += ' Where ' +fieldName2+' =: value2 and ' +fieldName1+' =: value1';
        }
        list<Account> accList =Database.query(query);
        if(accList.size() > 0)
        {
            return accList;
        }
        else 
        {
            return new list<Account>();
        }
        
    }
    public static list<Contact> getContacts(string fieldName,string fieldValue)
    {
        string query ='Select id,Name,FirstName,lastName,isEmailAvail__c,AccountId,Account.Name,Email from Contact ';
        if(fieldName != null & fieldValue != null)
        {
            query += ' Where ' +fieldName+' =: fieldValue ';
            
        }
        return  Database.query(query);
    }
    
}