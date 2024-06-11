//This is the example controller for accessing UtilityClass for generic apex actions
public class getUtitlityClassDataCntrlr {

    //This method is used to getAllAccounts type mentioned;
    public static list<Account> getAccountByType(list<string> valueList)
    {	
        return UtilityClassCntrlr.getAccounts('type',valueList,null,null);
    }
    //This method is used to getAllAccounts type and Industry mentioned;
    public static list<Account> getAccountbyIndustryAndType(list<string> valueTypeList ,list<string> valueIndustryList)
    {
        return UtilityClassCntrlr.getAccounts('type',valueTypeList,'Industry',valueIndustryList);
    }
    //This method is used to getAllAccounts from server;
    public static list<Account> getAllAccounts()
    {
        return UtilityClassCntrlr.getAccounts(null,null,null,null);
    }
    //This method is used to getAllAccounts that ids have been passed;
     public static list<Account> getAccountsById(list<string> accIdList)
    {
        return UtilityClassCntrlr.getAccounts('id',accIdList,null,null);
    }
}