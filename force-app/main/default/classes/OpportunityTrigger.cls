public class OpportunityTrigger {

    public static void OpportunityUpdation(list<opportunity> oppList)
    {
       Set<Id> accIdSet = new Set<Id>(); 
       for(Opportunity opp : oppList)
       {
               accIdSet.add(opp.AccountId);
       }  
   
        	list<Account> updateAccList = new list<Account>();
           list<account> AccList = [Select id,Name,Number_of_Closed_opp__c,(Select Name,StageName from Opportunities)From Account Where Id in :accIdSet];
           for(Account acc : accList)
          	 {
               list<opportunity> closedWonList = new list<opportunity>();
               for(Opportunity Opps : acc.Opportunities)
                   
              	 {
                   if(opps.stageName == 'Closed Won')
                  	 	{
                      		 closedWonList.add(opps);
                       
                   		}
                 }   
              	 
                   integer count = closedWonList.size();
                   acc.Number_of_Closed_opp__c = count;
                   updateAcclist.add(acc);
                
             }  
               update updateAccList;
       }
    }