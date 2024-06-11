//This class is used to store all exceptions in salesforce custom object
public class CustomExceptionClass {
 
    public static void storeExceptions(String className,string methodName,string errorMessage,Integer stackTrace,String lineNo)
    {
        //String line =String.valueOf(stackTrace);
        String trace = String.valueOf(stackTrace);
        ExceptionBase__c exceptionBase = new ExceptionBase__c();
        exceptionBase.ErrorMessage__c = errorMessage;
        exceptionBase.Name = className;
        exceptionBase.lineNumber__c = lineNo;
        exceptionBase.MethodName__c = methodName;
        exceptionBase.StackTrace__c = trace;
        Insert exceptionBase;
    }
}