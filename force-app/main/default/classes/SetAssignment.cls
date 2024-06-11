public class SetAssignment {
    
    public static void studentNameSet(){
        set<string> studentsName = new set<string>();
        studentsName.add('Micheal');
        studentsName.add('Jack');
        studentsName.add('June');
        studentsName.add('Arun');
        studentsName.add('Jack');
        studentsName.add('Ria');
        system.debug('Students Names are '+studentsName);
        system.debug('Size of the Set is: '+studentsName.size());
    }
    public static void deptNameSet(){
        set<string> deptName = new set<string>();
        deptName.add('ECE');
        deptName.add('Mech');
        deptName.add('EEE');
        deptName.add('CS');
        deptName.add('IT');
        system.debug('Departments available are '+deptName);
        system.debug(+deptName);
        system.debug('Size of the deptSet '+deptName.size());
        
    }
    public static void rollNumbersSet(){
        set<integer> rollNumbers= new set<integer>{
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
        	system.debug('rollnumbers : '+rollNumbers);
        	rollNumbers.remove(8);
        	system.debug('rollnumbers : '+rollNumbers);
        	
       		 set<integer> clonedRollNumbers=rollNumbers.clone();
        	 clonedRollNumbers.add(90450);
             system.debug(' Cloned rollnumbers : '+clonedRollNumbers);
        	 
    }
    
    public static void mobileBrandsSet(){
        set<string> mobileBrandname = new set<string>{'Nokia','Vivo','Realme','Oppo','Apple','Redmi'};
         system.debug(' Mobile Brands : '+mobileBrandname);
         system.debug('Is Redmi there? '+mobileBrandname.contains('Redmi'));
         mobileBrandname.clear();
        system.debug(' Mobile Brands : '+mobileBrandname);
        
    }
    
    public static void DiffColoursSet(){
        set<string> colourSet1 = new set<string>{
            'Red',
            'Blue',
            'Green',
            'Blue',
            'Red',
            'Yellow'};
                system.debug(' Colours first : '+colourSet1);
        
                set<string> colourSet2 = new set<string>{
                    'Orange',
                    'Black',
                    'Red',
                    'White',
                    'Blue',
                    'Orange'   };
                        
                      system.debug(' Colours second : '+colourSet2);
                        
        set<string> colourSet3 = new set<string>();
        colourSet3.addall(colourSet1);
        colourSet3.addall(colourSet2);
        system.debug(' Colours third : '+colourSet3);

}
   public static void setNames()
   {
       List<Account> accList =[SELECT Id,Name FROM Account LIMIT 10];
       set<string> NameSet= new set<string>();
       for(Account acc: accList)
       {
           NameSet.add(acc.Name);
       }
       system.debug(NameSet);
   }
    public static void caseIdSet(){
        List<case> caseList=[SELECT CaseNumber,Id,Priority FROM Case WHERE Priority = 'High'];
        set<id> idSet= new set<id>();
        for(case ca:caseList ){
            idSet.add(ca.Id);
        }
        system.debug(idSet);
    }
}