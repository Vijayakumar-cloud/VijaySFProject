public class LoopAssignments {
    
    
    public static void StringLooping(){
        
        for(integer i=0;i<=6;i++)
        {
            system.debug('SmartGence Academy');
        }
    }
    
    public static void StringLoopingWithNumbersAsc(){
        
        for(integer i=1;i<=5;i++)
        {
            system.debug('SmartGence Academy - '+i);
        }
    }
    public static void StringLoopingWithNumbersDsc(){
        
        for(integer i=5;i>0;i--)
        {
            system.debug('SmartGence Academy - '+i);
        }
    }
    public static void multiplicationWithloop(integer multiplier){
        
        for(integer i=1;i<=10;i++)
        {
            integer result = multiplier*i;
            system.debug(result);
        }
    }
    public static void oddEvenLooping()
    {
        for(integer i=1;i<=10;i++)
        {
            if(math.mod(i,2)== 0)
            {
                system.debug(i+ 'is even');
            }
            else
            {
               system.debug(i+ 'is odd'); 
            }
        }
    }
    public static void switchConcept(integer i)
    {
        switch on i
        {
            when 1
            {
                system.debug('Monday');
            }
            when 2
            {
               system.debug('Tuesday'); 
            }
            when 3
            {
                system.debug('Wednesday');
            }
            when 4
            {
                system.debug('Thursday');
            }
            when 5
            {
                system.debug('Friday');
            }
            when 6
            {
                system.debug('Saturday');
            }
            when 7
            {
                system.debug('Sunday');
            }
            when else
            {
                system.debug('Invalid Day');
            }
        }
    }
}