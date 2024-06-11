/* Basic concepts of Polymorphism in oops concepts
* concepts of Method Overloading
*/
public class PolymorphismController {
    
    /* description - Example of explaining method overLoading
*/
    //Method overLoading - method with paramter;This method will have all the code logic,with all paramters.
    public static list<Account> getAccountList(string accId,string accType,string accIndustry)
    {
        string query = 'select id,name,industry,type from Account';
        if(accId != null && accType == null && accIndustry == null)
        {
            query += '  Where id = : accId ';
        }
        if(accType != null && accId == null && accIndustry == null)
        {
            query += '  Where type = : accType ';
        }
        if(accType != null && accId == null && accIndustry != null)
        {
            query += '  Where Industry = : accIndustry and type = : accType ';
        }
        list<Account> accList = database.query(query);
        system.debug('accountListSize >>>> '+accList.size());
        if(accList.size() > 0)
        {
            return accList;
        }
        else
        {
            return null;
        }      	
    }
    //Method overLoading - method without any paramter;This method returns all the accounts from the server
    Public static list<Account> getAccountList()
    {
        return PolymorphismController.getAccountList(null,null,null);
        
    }
    //Method overLoading - method with only one paramter;This method returns only mentioned type accounts from the server
    Public static list<Account> getAccountList(string accType)
    {
        return PolymorphismController.getAccountList(null,accType,null);
        
    }
    //Method overLoading - method with only one paramter;This method returns only mentioned accountId account from the server
    Public static list<Account> getAccountList(string accId,Integer num)
    {
        return PolymorphismController.getAccountList(accId,null,null);
        
    }
    //Method overLoading - method with only two parameters ;This method returns only mentioned type and Industry accounts from the server
    Public static list<Account> getAccountList(string accType,string accIndustry)
    {
        return PolymorphismController.getAccountList(null,accType,accIndustry);
        
    }
}