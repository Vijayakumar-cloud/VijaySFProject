public class TriggerOnAccountHandler {

    public static void conAndOppCreationWithAccount(list<account> accList)
    {
    	list<contact> conList = new list<contact>();
    	list<Opportunity> oppList = new list <Opportunity>();
    	for(account acc: accList)
    {
        Opportunity opp = new Opportunity();
        opp.Name = acc.Name;
        opp.AccountId=acc.Id;
        opp.CloseDate=date.today()+30;
        opp.StageName='prospecting';
        oppList.add(opp);
        Contact con =new Contact();
        con.AccountId = acc.Id;
        con.FirstName = acc.Name;
        con.Lastname= 'account';
        conList.add(con);
                 
    }
    	insert oppList;
    	insert conList;
    }
    
   public static void handlerForOldAccountName(list<account> acclist,map<id,account> oldAccountmap)
   {
        for(account acc: accList)
        {
            Account oldaccount = oldAccountmap.get(acc.id);
            if(acc.Name != oldaccount.Name)
            {
                acc.Previous_Name__c= oldaccount.Name;
            }
        }
   }
    public static void accountDescriptionFieldPopulate(list<account> newaccount)
    {
        for(account acc:newaccount)
        {
            acc.Description ='New account created';
        }
    }
    public static void preventActiveAccountDeletion(list<account> AccountsCalledForDelete)
    {
        for(account acc:AccountsCalledForDelete)
        {
            if(acc.Active__c== 'yes')
            {
                acc.addError('Active account cannot be deleted.Please contact System Admin');
            }
        }
    }
    public static void inactiveAccRelatedConDelete(list <account> accList)
    {
        Set<id> accIds = new set<id>();
        for(Account a:accList)
        {
            if(a.Active__c == 'No')
            {
                accIds.add(a.Id);
            }
        }
        list<contact> conList = [Select Name,AccountId,LastName from Contact Where AccountId in:accIds];
        list<Contact> toDeleteConList = new list<Contact> ();
        for(Contact con:conList)
        {
            toDeleteConList.add(con);
        }
        delete toDeleteConList;
    }
}