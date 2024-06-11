public class SortRecordsController implements comparable{
	
    public list<wrapperClass> wrapperRecordList;
    public static  String sortField;
    Public static String sortDirection;
    
    public SortRecordsController()
    {
        
    }
  /*  public SortRecordsController (String sortField,string sortDirection,list<wrapperClass> wrapperRecordList)
    {
        this.sortField = sortField;
        this.sortDirection = sortDirection;
        this.wrapperRecordList =wrapperRecordList;
        system.debug('before sort >> '+wrapperRecordList);
        wrapperRecordList.sort();
        system.debug('after sort >>> '+wrapperRecordList);
    }*/
    public static void setParams(String sortField,string sortDirection,list<wrapperClass> wrapperRecordList)
    {
        sortField =sortField;
        sortDirection = sortDirection;
        wrapperRecordList =wrapperRecordList;
        system.debug('field to sort >> '+sortField);
        system.debug('direction to sort >> '+sortDirection);
        system.debug('before sort >> '+wrapperRecordList);
         for(wrapperClass wrap : wrapperRecordList)
        {
            system.debug('Name >> '+(string)wrap.record.get(sortField));
        }
        wrapperClass newWrapper = new wrapperClass(sortField,sortDirection,wrapperRecordList);
        wrapperRecordList.sort();
       	//list<wrapperClass> sortedWrapperList = newWrapper.sortRecords(sortField,sortDirection,wrapperRecordList);
        system.debug('after sort >>> '+wrapperRecordList);
        for(wrapperClass wrap : wrapperRecordList)
        {
            system.debug('Name >> '+(string)wrap.record.get('Name'));
        }
    }
   
     public integer compareTo(Object compareTo)
        {
            integer returnvalue;
            wrapperClass wrap = (wrapperClass)compareTo;
            system.debug('check field>>  '+sortField);
            system.debug('check  direction >> '+sortdirection);
          /*  if(SortRecordsController.sortDirection == 'asc')
            {
                if((string)record.get(this.sortField) == (string)wrap.record.get(this.sortField)) returnValue = 0;
                if((string)record.get(this.sortField) > (string)wrap.record.get(this.sortField)) returnValue = -1;
                returnValue = 1; 
            } */
          		 return returnvalue;
                    
      }
  
  
}