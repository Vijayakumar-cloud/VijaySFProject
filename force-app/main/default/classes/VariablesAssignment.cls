public class VariablesAssignment {

    public string storeText() {
        string instiName = 'Smartgence Academy';
        system.debug('The institute name is : '+instiName);
        return instiName;
        
    }
    public integer storeNumber(){
        integer value = 5;
        system.debug('The number is :'+value);
        return value;
    }
    public date storeDate(){
       date printDate =date.today();
       system.debug('Today date is :'+printDate);
        return printDate;     
    }
    public string storeDateAndTime(){
        dateTime printDateWithTime = datetime.now();
         system.debug('Time is :'+printDateWithTime);
        string convertedFormat = printDateWithTime.format('EEE MMM d yyyy HH mm ss', 'IST');
        system.debug('Time is :'+convertedFormat);
         return convertedFormat;
        
    }
    public decimal storeDecimal(){ 
      decimal printDecimal = 1.0004;
      system.debug('The decimal no is :'+printDecimal);
       return printDecimal;
    }
    public id storeId(){
        id salesforceId = '001D000001LH9d6IAD';
        system.debug('The record Id is :'+salesforceId);
        return salesforceId;
    }
   	 public boolean CheckValue(){
   	 boolean ifValue = True;
     system.debug('Condition is:'+ifValue) ;
     return ifValue;    
    }
    public string concetanateString(){
    string textOne ='Smartgence';
    string textTwo ='Academy';
    string combinedText=  textOne+textTwo;
    system.debug('Combined value is:'+combinedText);
    return combinedText; 
    }
    public decimal addNumbers(){
        integer numberOne= 500;
        decimal numberTwo= 100.10;
        decimal addition = numberOne+numberTwo;
        system.debug('The addition is:'+addition);
        return addition;
    }
    public void logicalOperators(){
     boolean checkOne= true;
     boolean checkTwo= false;
       boolean andOperator =checkOne && checkTwo;
     system.debug('returned value of And op is:'+andOperator);
        boolean orOperator = checkOne || checkTwo;
     system.debug('returned value of OR op is:'+orOperator);
        boolean notOperator1 =!checkOne;
     system.debug('returned value of NOT op1 is:'+notOperator1);
        boolean notOperator2 =!checkTwo;
     system.debug('returned value of NOT op2 is:'+notOperator2);
  
      }
    public void variablesWithoutValue(){
        integer Num;
        String  str;
        Boolean bln;
        Date d;
        dateTime DatewithTime;
        ID uniqueId;
        decimal decvalue;
        system.debug(Num);
        system.debug(str);
        system.debug(bln);
        system.debug(d);
        system.debug(DatewithTime);
        system.debug(uniqueId);
        system.debug(decvalue);

       /*VariablesAssignment callMethod1 = new VariablesAssignment();
string result1= callMethod1.storeText();
system.debug(result1);

VariablesAssignment c/allMethod2 = new VariablesAssignment();
integer result2= callMethod2.storeNumber();
system.debug(result2);

VariablesAssignment callMethod3 = new VariablesAssignment();
date result3= callMethod3.storeDate();
system.debug(result3);

VariablesAssignment callMethod4 = new VariablesAssignment();
dateTime result4= callMethod4.storeDateAndTime();
system.debug(result4);

VariablesAssignment callMethod5 = new VariablesAssignment();
decimal result5= callMethod5.storeDecimal();
system.debug(result5);

VariablesAssignment callMethod6 = new VariablesAssignment();
id result6= callMethod6.storeId();
system.debug(result6);

VariablesAssignment callMethod7 = new VariablesAssignment();
boolean result7= callMethod7.CheckValue();
system.debug(result7);

VariablesAssignment callMethod8 = new VariablesAssignment();
string result8= callMethod8.concetanateString();
system.debug(result8);

VariablesAssignment callMethod9 = new VariablesAssignment();
decimal result9= callMethod9.addNumbers();
system.debug(result9);

VariablesAssignment callMethod10 = new VariablesAssignment();
callMethod10.logicalOperators();

VariablesAssignment callMethod11 = new VariablesAssignment();
callMethod11.variablesWithoutValue();  */
        
    }
    
}