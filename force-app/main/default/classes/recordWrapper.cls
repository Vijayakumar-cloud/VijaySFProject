public class recordWrapper implements comparable{
    
    public SObject record {get;set;}
    
    public recordWrapper()
    {
        
    }
    public recordWrapper (SObject record)
    {
        this.record = record;
    }
    public Integer compareTo(Object compObj)
    {
        recordWrapper wrapper = (recordWrapper)compObj;
        return null;
    }
}