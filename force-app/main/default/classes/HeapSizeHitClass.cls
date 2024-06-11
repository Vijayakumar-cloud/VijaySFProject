public class HeapSizeHitClass {
	public class testException extends exception {}
    public static void hitHeapSize()
    {
        list<account> accList = new List<Account>();
        for(Integer i =0; i<=100000;i++ )
        {
           	accList.add(new Account(Name='TestString with values of many heapsize hit possibility '+i,Type ='Prospect'));
        }
        if(limits.getHeapSize() > limits.getLimitHeapSize())
            {
                throw new testException('heap size exceeded>>>> - Available Limit- '+limits.getLimitHeapSize()+' ;Used Size- '+limits.getHeapSize());
            }     
    }
}