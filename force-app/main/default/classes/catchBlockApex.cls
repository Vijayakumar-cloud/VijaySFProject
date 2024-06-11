public class catchBlockApex {

    
    public static void insertAccount()
    {
        Account acc = new Account();
        acc.Name ='Test Catch block';
        acc.Phone= '9003603840';
        try
        {
            insert acc;
        }
        catch(exception e)
        {
            system.debug('error--'+e.getMessage());
        }
            
            
    }
}