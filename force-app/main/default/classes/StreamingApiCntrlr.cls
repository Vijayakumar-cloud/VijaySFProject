public class StreamingApiCntrlr {

    	public static void pushTopicEvents()
        {
            pushTopic ptEvent = new PushTopic();
            ptEvent.Name ='PushTopicData';
            ptEvent.Query = 'Select id,Name,Type from Account';
            ptEvent.ApiVersion = 58.0;
            ptEvent.NotifyForFields ='Referenced';
            ptEvent.NotifyForOperationCreate =true;
            ptEvent.NotifyForOperationDelete =true;
            ptEvent.NotifyForOperationUndelete = true;
            ptEvent.NotifyForOperationUpdate = true;
            
            Insert ptEvent;
        }
    @AuraEnabled
    public static list<Contact> getContacts(string countVal,string accId)
    {
        return [select id,lastName,FirstName,Email from Contact where AccountId =: accId limit : Integer.valueOf(countVal)];
    }
}