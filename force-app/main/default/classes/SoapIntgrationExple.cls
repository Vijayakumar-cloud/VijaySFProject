global class SoapIntgrationExple {
	
    webservice static list<string> getAccounts(string accName)
    {
        string accntname = '%'+accName+'%';
        list<Account> accList = [select id,name from account where Name like : accntname];
        list<string> accNames = new list<String>();
        for(Account acc: acclist)
        {
            accNames.add(acc.name);
        }
        if(accList.size() > 0)
        {
            return accNames;
        }
        else {
            return new list<string>();
        }
        
    }
}