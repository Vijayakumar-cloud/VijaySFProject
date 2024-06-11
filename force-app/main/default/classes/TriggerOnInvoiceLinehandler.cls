public class TriggerOnInvoiceLinehandler {
    
    public static void handlerOne(list<Invoice_Line_item__c> StartTrigger)
    {
        list<Invoice__c> updateinvoiceList = new list<Invoice__c>();
        map<id,Invoice__c> invoiceMap = new  map<id,Invoice__c>();
        set<id> invoiceIds =new set<id>();
        string transids ='';
        for(Invoice_Line_item__c invl:StartTrigger)
        {
         invoiceIds.add(invl.InvoiceTO__c);
        }
   		list<Invoice__c> invoiceList =[SELECT Id,Transaction_ID__c,(SELECT Id,InvoiceTO__c,Transactionid__c FROM Invoice_Line_items__r) FROM Invoice__c WHERE ID in:invoiceIds];
        for(Invoice__c inv:invoiceList )
        {
          for(Invoice_Line_item__c inl : inv.Invoice_Line_items__r)
          {
              transids = transids +' ' +inl.Transactionid__c;
              inv.Transaction_ID__c= transids;
              updateinvoiceList.add(inv);
              
          }
            invoiceMap.putall(updateinvoiceList);
        }
           
			update invoiceMap.values();
    }

}