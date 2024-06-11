@isTest
public class catchBlockApexTest {
    
	@TestSetup
static void setupTestData(){
    Profile profileId = [SELECT Id FROM Profile WHERE Name = 'Chatter External User' LIMIT 1];
    system.debug(profileId);
    
    User usr = new User(LastName = 'TEST',
                           FirstName='Fail',
                           Alias = 'ftest',
                           Email = 'f.test@asdf.com',
                           Username = 'f.test@asdf.com',
                           ProfileId = profileId.id,
                           TimeZoneSidKey = 'GMT',
                           LanguageLocaleKey = 'en_US',
                           EmailEncodingKey = 'UTF-8',
                           LocaleSidKey = 'en_US'
                           );
    insert usr;
    system.debug(usr.id);

    Account acc1 = new Account();
    acc1.Name='Sample Acc';
    acc1.Phone='8945634567';
    insert acc1;
    
}
    @IsTest
static void testSaveFail(){
	User testUser = [SELECT Id FROM User WHERE alias = 'ftest'];
    account testacc =[select id,name from Account Where Name='Sample Acc'];
     test.startTest();
	System.runAs(testUser){
        try{
            	catchBlockApex.insertAccount();
        } catch (DmlException ex) {
            System.assertEquals('expected text', ex.getMessage());
        }  
        test.stopTest();
   /* Account acc1 = new Account();
    acc1.Name='Sample Acc';
    acc1.Phone='8945634567';
    insert acc1;
    catchBlockApex.insertAccount();
     Account acc2 = new Account();
   
    acc2.Phone='8945634567';
    insert acc2;
    catchBlockApex.insertAccount(); */
    
}
}
}