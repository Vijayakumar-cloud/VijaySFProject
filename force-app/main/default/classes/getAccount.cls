public class getAccount {

    @AuraEnabled
    public static list<Account> getAccountList(string accName)
    {
        string accntname = '%'+accName+'%';
        list<Account> accList = [select id,name,Type,Industry,SG_ID__c from account where Name like : accntname];
       	return accList;
       
	}
}