//This controller is used as sorting Sobject records throug wrapper class by multiple sorting fields
public class SObjectCollection {
    public List<SObjectComparable> data {get; set;}
    public static map<String,String> sortMap;
    
    public class sortException extends exception {}
    
    public SObjectCollection(List<SObject> recs){
        this.data = new List<SObjectComparable>();
        for(SObject rec : recs){
            this.data.add(new SObjectComparable(rec));
        }
        sortMap = new map<string,string>();
        
    }
    public SObjectCollection()
    {
        
    }
    
    
    public void sort(map<string,string> sortBymap){
        
        sortMap = sortBymap;
        system.debug('before sort >>>>>>');
        //system.debug('sortMap c>>> '+sortMap);
        system.debug('map size >> '+sortMap.size());
        for(SObjectComparable wrap : this.data)
        {
            system.debug('Name - '+wrap.item.get('name')+';'+' City - '+wrap.item.get('city__c')+' ;Age -  '+wrap.item.get('Agetxt__c'));
        }
        this.data.sort();
        system.debug('after sort >>>>>>');
        for(SObjectComparable wrap : this.data)
        {
            system.debug('Name - '+wrap.item.get('name')+';'+' City - '+wrap.item.get('city__c')+' ;Age -  '+wrap.item.get('Agetxt__c'));
            //system.debug(wrap);
        }
    }
    
    public class SObjectComparable  implements Comparable  {
        public SObject item {get; set;}
        
        public SObjectComparable(SObject item){
            this.item = item;
        }
        
        public Integer compareTo(Object compareTo) {
            
            SObjectComparable compareObj = (SObjectComparable)compareTo;
            // Integer returnValue = 0;
            list<string> sortKeys = new list<String>();
            sortKeys.addAll(sortMap.keySet());
            //system.debug('list size >> '+sortKeys.size());
            
            if(sortKeys.size() > 0)
            {
                switch on sortKeys.size() {
                    
                    when 1 {
                        
                        return compareToHelper(compareObj,sortKeys[0],null,null);
                    }
                    when 2 {
                        
                        return compareToHelper(compareObj,sortKeys[0],sortKeys[1],null);
                    }
                    when 3 {
                        
                        return compareToHelper(compareObj,sortKeys[0],sortKeys[1],sortKeys[2]);
                    }
                    when else {
                        
                        throw new sortException ('Please choose upto 3 fields to sort');
                    }
                }
            }
            
            else {
                return null;
            }  
        }
        
        //This method checks keys and helps sorting based on multiple conditions;
        public Integer compareToHelper(SObjectComparable compareObj ,String key1,string key2,string key3)
        {
            
            Integer returnValue ;
            if(key1 != null)
            {
                returnValue =  helperSort(compareObj,key1);
                if(returnValue == 0 && key2 != null)
                {
                    returnValue = helperSort(compareObj,key2);
                    if(returnValue == 0 && key3 != null) return helperSort(compareObj,key3);
                    return returnValue;
                }
                else {
                    return returnValue;
                }
            }  
            else {
                
                return null;
            }
 
        }
        //This is where actual sorting happens by getting sort key from parameter
        public Integer helperSort(SObjectComparable compareObj ,String key)
        {
            if((string)item.get(key) != null  && (string)compareObj.item.get(key) != null)
            {
                if(sortMap.get(key) == 'asc')
                {
                    if((string)item.get(key) == (string)compareObj.item.get(key)) return 0;
                    if((string)item.get(key) > (string)compareObj.item.get(key)) return 1;
                    return -1;
                    
                }
                if(sortMap.get(key) == 'desc')
                {
                    if((string)item.get(key) == (string)compareObj.item.get(key)) return 0;
                    if((string)item.get(key) > (string)compareObj.item.get(key))  return -1;
                    return 1;
                    
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