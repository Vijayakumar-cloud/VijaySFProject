public class TriggerOnContactHandler {

    public static void whileContactCreation(list<contact> newContacts)
    {
        set<id> accIds = new set<id>();
        list<Account> toupdate = new list<Account>();
        for(contact con :newContacts)
        {
            accIds.add(con.AccountId);
        }
        list<account> AccountList= [SELECT count_of_contact__c,Id,Name,(SELECT Name from contacts) FROM Account WHERE ID in:accIds];
        for(account acc:AccountList)
        {
            acc.count_of_contact__c =acc.contacts.size();
            toUpdate.add(acc);
        }
        update toupdate;
    }
    public static void whileContactDeletion(list<contact> OldContacts)
    {
         set<id> accIds = new set<id>();
        list<Account> toupdate = new list<Account>();
        for(contact con :OldContacts)
        {
            accIds.add(con.AccountId);
        }
        list<account> AccountList= [SELECT count_of_contact__c,Id,Name,(SELECT Name from contacts) FROM Account WHERE ID in:accIds];
        for(account acc:AccountList)
        {
            acc.count_of_contact__c =acc.contacts.size();
            toUpdate.add(acc);
        }
        update toupdate;
    }
}