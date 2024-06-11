//This is a test class for SobjectSortbyLoopCntrlr class.
@isTest
public class SobjectSortbyLoopCntrlr_Test {
    @isTest
    static void testSorting()
    {
        List<Account> AccList = new List<Account>();
        AccList.add(new Account(Name = 'John', city__c = 'New York', Dob__c = Date.Today().addYears(-20) ,TimeZone__c = DateTime.newInstance(2011, 11, 18, 3, 3, 3),AnnualRevenue =30000,NumberofLocations__c =5,NumberOfEmployees =200, DateCreated__c = Date.today()));
        AccList.add(new Account(Name = 'Alice', city__c = 'San Francisco',Dob__c = Date.Today().addYears(-23) ,TimeZone__c = DateTime.newInstance(2011, 11, 18, 3, 3, 3),AnnualRevenue =40000,NumberofLocations__c=6,NumberOfEmployees =230, DateCreated__c = Date.today().addDays(-1)));
        AccList.add(new Account(Name = 'John', city__c = 'San Francisco',Dob__c = Date.Today().addYears(-22) ,TimeZone__c = DateTime.newInstance(2011, 11, 18, 3, 3, 3),AnnualRevenue =41000,NumberofLocations__c=5,NumberOfEmployees =300, DateCreated__c = Date.today().addDays(-2)));
        AccList.add(new Account(Name = 'Alice', city__c = 'New York',Dob__c = Date.Today().addYears(-21) ,TimeZone__c = DateTime.newInstance(2011, 11, 18, 3, 3, 3),AnnualRevenue =30000,NumberofLocations__c=6,NumberOfEmployees =290, DateCreated__c = Date.today().addDays(-1)));
        AccList.add(new Account(Name = 'Alice', city__c = 'New York',Dob__c = Date.Today().addYears(-20) ,TimeZone__c = DateTime.newInstance(2011, 11, 18, 3, 3, 3),AnnualRevenue =30000,NumberofLocations__c =8,NumberOfEmployees =290, DateCreated__c = Date.today().addDays(-1)));
        AccList.add(new Account(Name = 'Alice', city__c = 'New York',Dob__c = Date.Today().addYears(-20) ,TimeZone__c = DateTime.newInstance(2011, 11, 18, 3, 3, 3),AnnualRevenue =30000,NumberofLocations__c =8,NumberOfEmployees =290, DateCreated__c = Date.today().addDays(-1)));
        AccList.add(new Account(Name = 'John', city__c = 'San Francisco',Dob__c = Date.Today().addYears(-22) ,TimeZone__c = DateTime.newInstance(2011, 11, 18, 3, 3, 3),AnnualRevenue =41000,NumberofLocations__c=5,NumberOfEmployees =310, DateCreated__c = Date.today().addDays(-2)));
        AccList.add(new Account(Name = 'Alice', city__c = 'New York',Dob__c = Date.Today().addYears(-20) ,TimeZone__c = DateTime.newInstance(2011, 11, 18, 3, 3, 3),AnnualRevenue =30000,NumberofLocations__c =8,NumberOfEmployees =310, DateCreated__c = Date.today().addDays(-1)));
        AccList.add(new Account(Name = 'John', city__c = 'San Francisco',Dob__c = Date.Today().addYears(-22) ,TimeZone__c = DateTime.newInstance(2011, 11, 18, 3, 3, 3),AnnualRevenue =41000,NumberofLocations__c=6,NumberOfEmployees =310, DateCreated__c = Date.today().addDays(-2)));
        insert AccList;

        SobjectSortbyLoopCntrlr controller = new SobjectSortbyLoopCntrlr(AccList);
        SobjectSortbyLoopCntrlr controller1 = new SobjectSortbyLoopCntrlr();

        Map<String, String> sortByMap = new Map<String, String>();
        sortByMap.put('Name', 'asc');
        sortByMap.put('City__c', 'desc');
        sortByMap.put('DateCreated__c', 'desc');
        sortByMap.put('Dob__c', 'asc');
        sortByMap.put('NumberOfEmployees', 'desc');
        sortByMap.put('AnnualRevenue', 'asc');
       // sortByMap.put('createdDate', 'asc');
        sortByMap.put('NumberofLocations__c', 'asc');
        
       
        Test.startTest();
        controller.sort(sortByMap);
        Test.stopTest();

        List<SObjectSortbyLoopCntrlr.SObjectComparable2> sortedData = controller.data;
        System.assertEquals('Alice', (String)sortedData[0].item.get('Name'));
        System.assertEquals('Alice', (String)sortedData[1].item.get('Name'));
    }

}