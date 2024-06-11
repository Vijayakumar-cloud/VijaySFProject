/* Description - This controller is used to create and store test data for every test classes
 */ 
@istest
public class TestDataFactory {
	// Method to create test accound records;
    public static List<Account> insertAccount(){
        List<Account> accList = new List<Account>();
        Account acc1 = new Account(Name='Test acc5',Type='Prospect',city__c='Chennai');
        Account acc2 = new Account(Name='Test acc4',Type='Prospect',city__c='Chennai');
        Account acc3 = new Account(Name='Test acc3',Type='Prospect',city__c='Madurai');
        Account acc4 = new Account(Name='Test acc2',Type='Prospect',city__c='Madurai');
        Account acc5 = new Account(Name='Test acc',Type='Prospect',city__c='Trichy');
        Account acc6 = new Account(Name='Test acc',Type='Prospect',city__c='Trichy');
        Account acc7 = new Account(Name='Test acc',Type='Prospect',city__c='Chennai');
        accList.add(acc1);
        accList.add(acc2);
        accList.add(acc3);
        accList.add(acc4);
        accList.add(acc5);
        accList.add(acc6);
        accList.add(acc7);
        return accList;
    }
    // Method to create test case Records;
    public static list<case> testCaseRecords()
    {
        list<Account> testAccList = TestDataFactory.insertAccount();
        Case testCase = new Case (reason ='Other',AccountId =testAccList[0].Id);
        Case testCase2 = new case (reason ='Inquiry',AccountId = testAccList[0].id);
        List<Case> caseList = new list <case>();
        caseList.add(testCase);
        caseList.add(testCase2);
        insert caseList;
        return caseList;
    }
    
}