@RestResource(urlMapping='/Accounts/*/contacts')
global class AccountManager {
    
    @HttpGet
    global static account getAccount()
    {
        restRequest req = RestContext.request;
        system.debug('debugging request '+req);
        string AccId = req.requestURI.subStringBetween('/Accounts/','/contacts');
        Account result =[select id,name,(select id,lastname,name from contacts) from account where id =: AccId];
        
        return result;
    }

}