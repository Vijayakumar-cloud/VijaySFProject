//Example class for method Overriding.This is a parent class
public virtual class methodOverRiding {
	
    public virtual list<Contact> getContacts(string ContactId,string IDvalue)
    {
       // list<Contact> conList =[Select id,lastname,firstname,email from Contact where id=: conId];
        return UtilityClassCntrlr.getContacts(ContactId,IDvalue);
    }
    
    public virtual void sampleMethod()
    {
        system.debug('check sample method');
    }
}