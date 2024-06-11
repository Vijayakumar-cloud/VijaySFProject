public with sharing class AccountSearchHand {
    public AccountSearchHand() {}

        @AuraEnabled(cacheable =true)
        public static List<Account> databaseCall(String accSearchName)
        { 
            String SoqlVar = '%'+accSearchName+'%';
             List<Account> AccList =[Select id,Name,Type from Account Where Name like :SoqlVar];
            return AccList;
    }
       
    
}