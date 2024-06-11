public class SoqlAssignments {
    
    //Write a query to count the total number of opportunity record.
    
    Integer opp=[Select count() from opportunity];
    
    //Write a soql query to return the name for all account,and for each account get the related contact lastname.

	Account acc =[Select Name,(Select lastname from contacts) from Account];
    
    //Write  a query to sum the amount field in opportunity object group by account name
	// Opportunity opty =[Select sum(Amount),Account.Name from Opportunity Group by Account.Name];
	
	// Write a soql query to return the name for all opportunity,and for each opportunity get the related account name.
		list<opportunity> opty1 =[Select name,Account.Name from Opportunity];
    
    //Create a account with the name ram,and write a soql query to print the account name ‘ram’.

    Account nameget =[Select name from Account Where Name ='Ram'];
    
   //Write a soql query to return a account name,type,phone for where the picklist field name type=other

	Account accs =[Select name ,type ,phone from Account Where type = 'other'];
    
    //Write a soql query to return a opportunity records lastname,accountname,stage where amount field is greater than 10000

	opportunity opps =[SELECT Id, Amount,Account.Name,Name, StageName FROM Opportunity where amount > 10000];
    
	//Create a 'name=swan' record in account object,and return the record in soql object
	
    account namechck =[Select id,name from account where name like '%swan'];
   
	//Write a soql query to return the last createdly two records using limits
	
		Contact con =[SELECT id,lastname FROM Contact order by createddate DESC limit 2];
    
    //Write a soql to return the account record groupby type(standard field)
	//	account accnt =[Select count(Name),type from Account Group by type];
	
    //Write a soql query to return a account record name in decending order(order by)
		Account accnts =[Select NAME,type from Account ORDER BY NAME DESC];
    
    //Write a soql query to return a account record name in decending order(order by and return a lastly created record.

    Account acct =[Select NAME,type,createdDate from Account ORDER BY createdDate Desc ];
    
    //Write a soql query to count the number of records in Account object
	integer accCount =[Select count() from Account];
    
    //Write a soql query to print the account object name contains 'kumar','ram','karthick'.
	Account accName =[SELECT Id,Name,Type FROM Account WHERE Name LIKE '%vijay%' or Name LIKE '%ram%' or Name LIKE '%karthick%'];
    
    //Write  a soql query to return the account record where the name is 'kumar' or 'karthick'.
	Account accNa =[SELECT Id,Name FROM Account WHERE Name in ('kumar','karthick')];
    
    //Write a soql query to return the contact record which name starts with letter 'a'
	contact conName =[Select id,name,lastname,Account.Name from contact where name like 'a%'];

}