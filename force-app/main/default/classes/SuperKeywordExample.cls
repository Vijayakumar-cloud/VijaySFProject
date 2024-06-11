public class SuperKeywordExample {
	public integer count = 1;
    public string Name;
    private string Email;
    public SuperKeywordExample ()
    {
		system.debug('display count from Parent constructor >> '+count);
    }
    public SuperKeywordExample(String Name)
    {
        this.Name = Name;
        system.debug('name recieved from Child class >> '+Name);
    }
    
    public void setEmail (string Email)
    {
        this.Email =Email;
    }
    public list<Account> getAccounts()
    {
        list<Account> acclist =[Select id,name from Account];
        return acclist;
    }
}