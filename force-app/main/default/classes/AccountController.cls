//This controller is for Manage Contacts in Account Record page 
//Referenced in AccountandRelatedContactManagement lwc component
public class AccountController {
  
    @AuraEnabled
    public static list<Contact> getRelatedContacts(String accId)
    {
        List<Contact> contactList = [Select id,name,email from Contact where AccountId =: accId];
        if(contactList.size() > 0)
        {
            return contactList;
        }
        else {
             return null;
        }
    }
    @AuraEnabled
    public static String deleteContact(Contact con)
    {
        try{
             delete Con;
             return 'Contact Deleted Successfully';
        
        }Catch (exception e){
            
            throw e;
           // return 'Unable to delete contact - '+e.getMessage();
        }
        
       
        
    }
}