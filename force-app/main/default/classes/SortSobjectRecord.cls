public class SortSobjectRecord   {
    
    public list<recordWrapper> objectRecords;
    public Static string SortByField;
    public Static string SortDirection;
    
    public SortSobjectRecord(List<Sobject> objRecords){
        
        this.objectRecords = new list<recordWrapper>();
        
        for(Sobject record : objRecords)   
        {
            this.objectRecords.add(new recordWrapper(record));
        }
        
        
    } 
    public void sort(String fieldName,String sortDir)
    {
        SortByField =fieldName;
        SortDirection = sortDir;
        system.debug('list >>> '+this.objectRecords);
        system.debug('before sorting >>> ');
        for(recordWrapper wrap : this.objectRecords)
        {
            system.debug((String)wrap.Objrecord.get(fieldName));
        }
        this.objectRecords.sort();
        system.debug('after Sorting >>> ');
        for(recordWrapper wrap : this.objectRecords)
        {
            system.debug((String)wrap.Objrecord.get(fieldName));
        }
        
    }
    
    public class recordWrapper implements Comparable{
        
        public Sobject Objrecord {get;set;}
        
        public recordWrapper (Sobject rec)
        {
            this.Objrecord = rec;
        }
        
        public Integer compareTo(Object compareTo) {
            recordWrapper compareToEmp = (recordWrapper)compareTo;
            // integer returnValue ;
           // system.debug('sortField >> '+SortByField);
           // system.debug('direction >> '+SortDirection);
            if(SortDirection == 'desc')
            {
                if((string)Objrecord.get(SortByField) == (string)compareToEmp.Objrecord.get(SortByField)) return  0;
                if((string)Objrecord.get(SortByField) > (string)compareToEmp.Objrecord.get(SortByField)) return -1;
                return 1; 
            }
            if(SortDirection == 'asc')
            {
                if((string)Objrecord.get(SortByField) == (string)compareToEmp.Objrecord.get(SortByField)) return 0;
                if((string)Objrecord.get(SortByField) > (string)compareToEmp.Objrecord.get(SortByField)) return 1;
                return -1; 
            } 
            else 
            {
                return null;
            }
            
        }
        
    } 
    
    
}