/* Test Class for PolymorphismController Class */
@istest
public class PolymorphismCntrlr_Test {

     @istest
    // testMethod for getAccountList Method
    public static void test_getAccountList ()
    {
        list<Account> testAccList = TestDataFactory.testAccountData();
        list<Account> accList = PolymorphismController.getAccountList();
        system.assertEquals(testAccList.size(), accList.size());
         list<Account> accList2 = PolymorphismController.getAccountList(testAccList[0].Id);
        system.assertEquals(testAccList[0].Name, accList2[0].Name);
       
    }
}