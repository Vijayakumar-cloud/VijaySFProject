public class limitClassCntrlr {
    
    public class testException extends exception {}
    public static map<iD,list<contact>> accoundIdWithContact()
    {
        system.debug('check heap size  '+limits.getHeapSize());
        list<Account> accList=[SELECT Id, name,Type, (SELECT id, Lastname FROM Contacts) FROM Account];
        map<id,list<contact>> mapContacts=new map<id,list<contact>>();
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
        system.debug('used callouts statements '+limits.getCallouts());
        system.debug('Total callouts statements '+limits.getlimitCallouts());
        if(limits.getHeapSize() > 2000000 || limits.getCpuTime() > 20000)
        {
           throw new testException('Too much usage of memory / too much cpu limit time taking');
          
        }
        else
        {
            // Other Logics Here
            return mapContacts;
        }
       	
    }
}