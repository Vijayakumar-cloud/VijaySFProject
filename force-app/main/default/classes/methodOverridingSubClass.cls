//This is the sub class for Method overriding example;
public class methodOverridingSubClass extends methodOverRiding{

     public override list<Contact> getContacts(string AccountId,string IDvalue)
    {
        list<contact> conList = UtilityClassCntrlr.getContacts(AccountId,IDvalue);
        for(Contact con : conList)
        {
            if(con.Email != null)
            {
                con.isEmailAvail__c = true;
            }
        }         update conList;
        return conList;
    }
    
}