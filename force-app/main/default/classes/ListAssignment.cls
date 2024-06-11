public class ListAssignment {

    public void studentNameList(){
        list<string> studentsName = new list<string>();
        studentsName.add('Micheal');
        studentsName.add('Jack');
        studentsName.add('June');
        studentsName.add('Arun');
        studentsName.add('Jack');
        studentsName.add('Ria');
        system.debug('Students Names are '+studentsName);
        system.debug('Third student is: '+studentsName.get(2));
        system.debug('Size of the List is: '+studentsName.size());
    }
    public void deptNameList(){
        list<string> deptName = new list<string>();
        deptName.add('ECE');
        deptName.add('Mech');
        deptName.add('EEE');
        deptName.add('CS');
        deptName.add('IT');
        system.debug('Departments available are '+deptName);
        deptName.sort();
        system.debug(+deptName);
        system.debug('Size of the deptList '+deptName.size());
        
    }
    public void rollNumbersList(){
        list<integer> rollNumbers= new list<integer>{
            90381,
            90382,  
            90383,
            90384,
            90385,
            90386, 
            90387,
            90388,
            90389,
            90390 };
           
            system.debug('rollnumbers : '+rollNumbers);
        	rollNumbers.add(4,90391);
        	system.debug('rollnumbers : '+rollNumbers);
        	rollNumbers.remove(8);
        	system.debug('rollnumbers : '+rollNumbers);
        	
       		 list<integer> clonedRollNumbers=rollNumbers.clone();
        	 clonedRollNumbers.add(90450);
             clonedRollNumbers.add(2,90460);
             system.debug(' Cloned rollnumbers : '+clonedRollNumbers);
        	 
    }
    
    public static void mobileBrandsList(){
        list<string> mobileBrandname = new list<string>{'Nokia','Vivo','Realme','Oppo','Apple','Redmi'};
         system.debug(' Mobile Brands : '+mobileBrandname);
         system.debug('Is Redmi there? '+mobileBrandname.contains('Redmi'));
         mobileBrandname.clear();
        system.debug(' Mobile Brands : '+mobileBrandname);
        
    }
    
    public static void DiffColoursList(){
        list<string> colourList1 = new list<string>{
            'Red',
            'Blue',
            'Green',
            'Blue',
            'Red',
            'Yellow'};
                system.debug(' Colours first : '+colourList1);
        
                list<string> colourList2 = new list<string>{
                    'Orange',
                    'Black',
                    'Red',
                    'White',
                    'Blue',
                    'Orange'   };
                        
                      system.debug(' Colours second : '+colourList2);
                        
        list<string> colourList3 = new list<string>();
        colourList3.addall(colourList1);
        colourList3.addall(colourList2);
        system.debug(' Colours third : '+colourList3);
        
    }
    public static void accountNameLooping()
    {
        List<account> accList=[SELECT Id,Name,Phone FROM Account];
        List<string> accNamesList= new List<string>();
       for(account accLoop : accList)
       {
           accNamesList.add(accLoop.Name);
       }
        system.debug(accNamesList);
    }
    public static void casesIdLooping()
    {
        List<id> caseIdList= new List<id>();
        List<case> caseList =[SELECT CaseNumber,Id,State__c FROM Case WHERE Priority = 'High'];
        for(case caseLoop : caseList )
        {
            caseIdList.add(caseLoop.Id);
        }
        system.debug(caseIdList);
    }
        
    public static void accountCreation(){
        
        list<account> accList = new list<account>();
        for(integer i=1;i<=20;i++)
        {
            Account acc= new Account();
            acc.Name='Test Account from apex-' +i;
            acc.RecordTypeId='0125j000000RLJ8AAO';
            acclist.add(acc);
        }
        insert accList;
        
    }
}