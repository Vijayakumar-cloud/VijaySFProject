trigger Lead_Trigger on Lead (before insert) {

    	list<Lead> LeadInsert=Trigger.New;
    	list<Lead> LeadList  =[SELECT Email,Name,Phone FROM Lead];
    	for(Lead le:LeadInsert)
        {
            for(Lead lea:LeadList)
            {
                if(le.Email==lea.Email)
            {
                system.debug('Record already Exists.Please Check with your inputs');
            }
        }
}
}