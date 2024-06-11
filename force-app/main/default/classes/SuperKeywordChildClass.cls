public class SuperKeywordChildClass extends SuperKeywordExample {
	
    public SuperKeywordChildClass(string Name)
    {
       // 
        super(Name);
        system.debug('inside SuperKeywordChildClass');
        
    }
    public SuperKeywordChildClass()
    {
        super();
    }
    public void accountData()
    {
        list<Account> acclist = super.getAccounts();
        system.debug('super keyword returned result >>> '+acclist);
        super.SetEmail('test@gmail.com');
    }
}