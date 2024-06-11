public class CallMethodOverridingCntrl {

   public static list<Contact> getContacts(string fieldname,string fieldValue)
   {
       methodOverRiding obj = new methodOverridingSubClass();
      return obj.getContacts(fieldname,fieldValue);
   }
}