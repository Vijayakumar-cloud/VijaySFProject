public with sharing class AccountSearch {
    public AccountSearch() {

    }
    @AuraEnabled
public static List<Account> databaseCall(String accSearchName)
{
String SoqlVar = '%'+accSearchName+'%';
List<Account> AccList =[Select id,Name,Type from Account Where

Name like :SoqlVar];
return AccList;
}

}