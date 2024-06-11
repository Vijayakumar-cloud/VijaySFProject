public class MapAssignments {

    public static void MapAssignmentOne()
    {
        map<integer,string> studentsMap = new map<integer,string>();
        studentsMap.put(90811,'Raja');
        studentsMap.put(90812,'Ajay');
        studentsMap.put(90813,'Jai');
        studentsMap.put(90814,'Ram');
        studentsMap.put(90815,'Mano');
        studentsMap.put(90816,'Ramya');
        studentsMap.put(90817,'Priya');
        studentsMap.put(90818,'Jeya');
        studentsMap.put(90819,'Roja');
        studentsMap.put(90820,'Pooja');
        system.debug(studentsMap);
        set<integer> keySets =studentsMap.keySet();
		 system.debug('keys' +keySets);
        list<string> valueList=studentsMap.values();
        system.debug('values' +valueList);
    }
    public static void SubjectMarks()
    {
        map<string,integer> subjectmarks = new map<string,integer>();
        subjectmarks.put('Maths',190);
        subjectmarks.put('Physics',185);
        subjectmarks.put('Biology',170);
        subjectmarks.put('Chemistry',190);
        subjectmarks.put('Com.sci',185);
        system.debug(subjectmarks);
        system.debug(subjectmarks.isEmpty());
        list<integer> markList= subjectmarks.values();
        integer sum=0;
        for(integer i=0;i<=4;i++)
        {
            integer mark=markList.get(i);
            sum=sum + mark;
        }
        
        system.debug('Total sum= '+sum);
    }		
    public static void colorsMap()
    {
         map<integer,string> colorsMap = new map<integer,string>();
        colorsMap.put(110 , 'Red');
        colorsMap.put(112 , 'Yellow');
        colorsMap.put(115 , 'Blue');
        colorsMap.put(119 , 'Orange');
        colorsMap.put(120 , 'Green');
        system.debug(colorsMap);
        system.debug('Size of the Map is '+colorsMap.size());
        if(colorsMap.containskey(119))
        {
            system.debug(colorsMap.get(119));
        }
        system.debug(colorsMap.get(115));
    }
    public static void mapWithoutPut()
    {
        map<integer,string> monthsMap = new map<integer,string>{
            1 =>  'Jan',
			2 =>  'Feb',
			3 =>  'Mar',
			4 =>  'Apr',
			5 =>  'May' };
            system.debug(monthsMap);
    }
    public static void mapWithPut()
    {
        map<integer,string> monthsMap = new map<integer,string>();
        monthsMap.put(1 ,'Jan');
        monthsMap.put(2 ,'Feb');
        monthsMap.put(3, 'Mar');
        monthsMap.put(4 ,'apr');
        monthsMap.put(5, 'May');
        system.debug('Keys '+monthsMap.keySet());
        system.debug('Values '+monthsMap.values());
    }
    public static void countriesAndStates()
    {
        list<string> statesListIndia= new list<string>{'Tamil Nadu','Karnataka','Andhra'};
        list<string> statesListUSA= new list<string>{'California','Texas'};
        map<string,list<string>> mapstatesAndCountry = new map<string,list<string>>();
        mapstatesAndCountry.put('US',statesListUSA);
        mapstatesAndCountry.put('India ',statesListIndia);
        system.debug(mapstatesAndCountry);

    }
    public static void accountMapping()
    {
        list<account> accountList= [SELECT id,Name from Account];
        map<id,Account> mapAccount =new map<id,Account>();
        for(Account acc:accountList)
        {
          mapAccount.put(acc.Id,acc);
          
        }
        system.debug(mapAccount);
    }
    public static map<iD,list<contact>> accoundIdWithContact()
    {
        list<Account> accList=[SELECT Id, name, (SELECT Lastname FROM Contacts) FROM Account];
       // list<account> accList=[SELECT Id,Industry,Name FROM Account];
        map<id,list<contact>> mapContacts=new map<id,list<contact>>();
        //list<contact> idMatch=new list<contact>();
        for(Account acc: accList)
        {
           mapContacts.put(acc.Id,acc.Contacts);
        }
        system.debug(mapContacts);
        system.debug('Total HeapSize Limit '+limits.getLimitHeapSize());
        system.debug('used heapSize '+limits.getHeapSize());
        system.debug('Total cpu time limit '+limits.getLimitCpuTime());
        system.debug('cpu time usage '+limits.getCpuTime());
        system.debug('total dml Rows '+limits.getLimitDmlRows());
        system.debug('queried dml Rows '+limits.getDmlRows());
        accList = null;
        system.debug('used heapSize after empty array '+limits.getHeapSize());
        system.debug('total dml statements '+limits.getLimitDmlStatements());
        system.debug('used dml statements '+limits.getDmlStatements());
        return mapContacts;
    }
}