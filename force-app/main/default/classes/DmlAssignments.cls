public class DmlAssignments {
		
    public static void insertAccount(){
        
        account acc = new account();
        acc.name = 'From apex class';
        acc.Pancard__c='edfkv4578r';
        acc.RecordTypeId='0125j000000RLJ8AAO';
        system.debug(acc);
        insert acc;
      }
    
    public static void mapAccountWithContact(){
        
        contact con = new contact(MobilePhone='7869934567',Email='rghyt@gmail.com',lastname ='vhiy');
        con.AccountId='0015j00000exAiaAAE';
        system.debug(con);
        insert con;
        
    }
    public static void addTestInAccountName(){
         
        list<account> accList =[SELECT name FROM account];
        for(account acc : acclist)
        {
            acc.name =acc.name +'Test';
            system.debug(acc.Name);
            update acc;
        }
        
        
    }
    public static void create250Records(){
        list<account> accountCreation =new list<account>();
        
           for (integer i=1;i<=250;i++)
            {
                account acc=new account();
                acc.Name ='Account number-'+i;
                accountCreation.add(acc);
            }
        		insert accountCreation;
    }
    public static void deleteAccounts(){
        List<account> accList = [SELECT Id,Name FROM Account WHERE CreatedDate = Today];
        delete accList;
    }
    public static void casePriorityUpdate(){
        list<case> caseList = [SELECT CaseNumber,Id,Origin,Priority FROM Case];
        for(case ca:caseList){
            if(ca.Origin=='Email')
            {
                ca.Priority='Medium';
            }
            else if(ca.Origin=='Web')
            {
                ca.Priority='Low';
            }
             else if(ca.Origin=='Phone')
             {
                  ca.Priority='High';
             }
        }
        update caseList;
    }
    	
    public static void caseDescriptionUpdate()
    {
        list<case> caseLists = [SELECT CaseNumber,Description,Id,Origin,Priority FROM Case];
        for(case ca:caseLists){
            if(ca.Origin=='Phone')
            {
                ca.Description=ca.Origin;
            }
    }
        update caseLists;
}
    public static void deleteCases(){
        List<case> toDeleteList=new List<case>();
        List<case> caseList=[SELECT Id,Origin,Priority FROM Case WHERE CreatedDate = yesterday ];
        for(case ca:caseList){
            if(ca.status=='Closed')
            {
                toDeleteList.add(ca);
            }      
    }
        delete toDeleteList;
}	
    public static void updateContactField(){
        list<contact> conList=[SELECT AccountId,Account_Industry__c,Department,Id,LastName FROM Contact];
        list<account> accList=[SELECT Id,Industry,Name FROM Account];
        for(contact con:conList){
            for(account acc:accList)
            {
                if(con.AccountId==acc.Id)
            {
                con.Account_Industry__c =acc.Industry;
            }
            } 
        }
        	update conList;
    }
   
}