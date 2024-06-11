//This controller is used as sorting Sobject records throug wrapper class by multiple sorting fields
public class SobjectSortbyLoopCntrlr {
    public List<SObjectComparable2> data {get; set;}
    public static map<String,String> sortMap;
    
    public class sortException extends exception {}
    
    public SobjectSortbyLoopCntrlr(List<SObject> recs){
        this.data = new List<SObjectComparable2>();
        for(SObject rec : recs){
            this.data.add(new SObjectComparable2(rec));
        }
        sortMap = new map<string,string>();
        
    }
    public SobjectSortbyLoopCntrlr()
    {
        
    }
   
    public void sort(map<string,string> sortBymap){
        
        sortMap = sortBymap;
        system.debug('before sort >>>>>>');
        //system.debug('sortMap c>>> '+sortMap);
        system.debug('map size >> '+sortMap.size());
        for(SObjectComparable2 wrap : this.data)
        {
            //system.debug('check wrap>>> ' + wrap);
            system.debug('Name - '+wrap.item.get('name')+';isEmailAvail - '+wrap.item.get('isEmailAvail__c')+' ;City - '+wrap.item.get('city__c')+' ;Age -  '+wrap.item.get('Agetxt__c')+';Code - '+wrap.item.get('NameFirstLetter__c')+' ;Date -'+wrap.item.get('DateCreated__c'));
        }
        this.data.sort();
        system.debug('after sort >>>>>>');
        for(SObjectComparable2 wrap : this.data)
        {
            system.debug('Name - '+wrap.item.get('name')+';isEmailAvail - '+wrap.item.get('isEmailAvail__c')+' ;City - '+wrap.item.get('city__c')+' ;Age -  '+wrap.item.get('Agetxt__c')+';Code - '+wrap.item.get('NameFirstLetter__c')+' ;Date -'+wrap.item.get('DateCreated__c'));
            //system.debug(wrap);
        }
    }
    
    public class SObjectComparable2  implements Comparable  {
        public SObject item {get; set;}
        
        public SObjectComparable2 (SObject item){
            this.item = item;
        }
        
        public Integer compareTo(Object compareTo) {
            
            SObjectComparable2 compareObj = (SObjectComparable2)compareTo;
            list<string> sortKeys = new list<String>();
            sortKeys.addAll(sortMap.keySet());
            //system.debug('keyset  '+ sortKeys);
            //Integer listCount =0;
            Integer returnValue =0 ;
            if(sortKeys.size() > 0)
            {
                try {
                  /*  returnValue =helperSort(compareObj,sortKeys[listCount]);
                    listCount++ ;
                    while(listCount < sortKeys.size())
                    {
                        
                        if(returnValue == 0 )
                        {
                            returnValue = helperSort(compareObj,sortKeys[listCount]);
                            listCount++ ;      
                        } 
                        else {
                            break;
                        } 
                    } */
                   
                    for(Integer i=0 ;i < sortKeys.size();i++)
                    {
                        if(returnValue == 0)
                        {
                            returnValue = helperSort(compareObj,sortKeys[i]);
                        }
                        else {
                            
                            break;
                        }
                       
                      
                    }
                }  catch (exception e){
                    
                    system.debug('error >> '+e.getMessage());
                    CustomExceptionClass.storeExceptions('SobjectSortbyLoopCntrl','compareTo',e.getMessage(),e.getLineNumber(),e.getStackTraceString());
                }
                 return returnValue ;
            }
            
            else {
                return null;
            }  
        }
        
        //This is where actual sorting happens by getting sort key from parameter
        public Integer helperSort(SObjectComparable2 compareObj ,String key)
        {
           
            if((Object)item.get(key) != null  && (Object)compareObj.item.get(key) != null)
            {
                if(sortMap.get(key) == 'asc')
                {
                    if(compareObj.item.get(key) instanceOf Date)
                    {
                        if((Date)item.get(key) == (Date)compareObj.item.get(key)) return 0;
                        if((Date)item.get(key) > (Date)compareObj.item.get(key)) return 1;
                        return -1;
                    }
                    if(compareObj.item.get(key) instanceOf DateTime)
                    {
                        if((DateTime)item.get(key) == (DateTime)compareObj.item.get(key)) return 0;
                        if((DateTime)item.get(key) > (DateTime)compareObj.item.get(key)) return 1;
                        return -1;
                    }
                    if(compareObj.item.get(key) instanceOf Decimal)
                    {
                        if((Decimal)item.get(key) == (Decimal)compareObj.item.get(key)) return 0;
                        if((Decimal)item.get(key) > (Decimal)compareObj.item.get(key)) return 1;
                        return -1;
                    }
                    if(compareObj.item.get(key) instanceOf Integer)
                    {
                        if((Integer)item.get(key) == (Integer)compareObj.item.get(key)) return 0;
                        if((Integer)item.get(key) > (Integer)compareObj.item.get(key)) return 1;
                        return -1;
                    }
                    if(compareObj.item.get(key) instanceOf Boolean)
                    {
                        
                        if((Boolean)item.get(key) == (Boolean)compareObj.item.get(key)) return 0;
                        if((Boolean)compareObj.item.get(key)) return 1;
                        return -1;
                    } 
                    else {
                        if((String)item.get(key) == (String)compareObj.item.get(key)) return 0;
                        if((String)item.get(key) > (String)compareObj.item.get(key)) return 1;
                        return -1;
                    }
                }
                
                if(sortMap.get(key) == 'desc')
                {
                    if(compareObj.item.get(key) instanceOf Date)
                    {
                        if((Date)item.get(key) == (Date)compareObj.item.get(key)) return 0;
                        if((Date)item.get(key) > (Date)compareObj.item.get(key)) return -1;
                        return 1;
                    }
                    if(compareObj.item.get(key) instanceOf DateTime)
                    {
                        if((DateTime)item.get(key) == (DateTime)compareObj.item.get(key)) return 0;
                        if((DateTime)item.get(key) > (DateTime)compareObj.item.get(key)) return -1;
                        return 1;
                    }
                    if(compareObj.item.get(key) instanceOf Decimal)
                    {
                        if((Decimal)item.get(key) == (Decimal)compareObj.item.get(key)) return 0;
                        if((Decimal)item.get(key) > (Decimal)compareObj.item.get(key)) return -1;
                        return 1;
                    }
                    if(compareObj.item.get(key) instanceOf Integer)
                    {
                        if((Integer)item.get(key) == (Integer)compareObj.item.get(key)) return 0;
                        if((Integer)item.get(key) > (Integer)compareObj.item.get(key)) return -1;
                        return 1;
                    }
                   if(compareObj.item.get(key) instanceOf Boolean)
                    {
                        if((Boolean)item.get(key) == (Boolean)compareObj.item.get(key)) return 0;
                        if((Boolean)compareObj.item.get(key)) return -1;
                        return 1;
                    } 
                    else {
                        if((String)item.get(key) == (String)compareObj.item.get(key)) return 0;
                        if((String)item.get(key) > (String)compareObj.item.get(key)) return -1;
                        return 1;
                    }
                }
                
                else {
                    return null;
                }
            }
            
            else {
                
                return null;
            }
        } 
    }
}