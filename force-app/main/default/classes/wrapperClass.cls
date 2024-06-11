public class wrapperClass implements comparable{
        
        public SObject record{get;set;}
        public string sortdirection {get;set;}
        public string sortField {get;set;}
     
        public wrapperClass (Sobject record)
        {
            this.record = record;
        }
        public wrapperClass(String sortField,string sortDirection,list<wrapperClass> wrapperRecordList)
        {
            this.sortdirection =sortdirection;
            this.sortField = sortField;
            system.debug('inside sortRecords sortField >> '+this.sortdirection);
            system.debug('inside sortRecords sortBy >> '+this.sortField);
           // wrapperRecordList.sort();
        }
        
      /*  public list<wrapperClass> sortRecords(String sortField,string sortDirection,list<wrapperClass> wrapperRecordList)
        {
            
            this.sortdirection =sortdirection;
            this.sortField = sortField;
            system.debug('inside sortRecords sortField >> '+sortdirection);
            system.debug('inside sortRecords sortBy >> '+sortField);
            wrapperRecordList.sort();
            return wrapperRecordList;
        } */
        public integer compareTo(Object compareTo)
        {
            integer returnvalue;
            wrapperClass wrap = (wrapperClass)compareTo;
            system.debug(' field>>  '+this.sortField);
            system.debug('direction >> '+this.sortdirection);
          /*  if(SortRecordsController.sortDirection == 'asc')
            {
                if((string)record.get(this.sortField) == (string)wrap.record.get(this.sortField)) returnValue = 0;
                if((string)record.get(this.sortField) > (string)wrap.record.get(this.sortField)) returnValue = -1;
                returnValue = 1; 
            } */
          
                if((string)record.get('Name') == (string)wrap.record.get('Name')) returnValue = 0;
                if((string)record.get('Name') > (string)wrap.record.get('Name')) returnValue = 1;
                returnValue = -1; 
         
            
            return returnvalue;
        }
    }