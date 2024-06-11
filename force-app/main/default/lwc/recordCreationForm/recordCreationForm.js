import {  LightningElement } from 'lwc';
import Account_Name from '@salesforce/schema/Account.Name';
import Account_Site from '@salesforce/schema/Account.Site';
import Account_AccountSource from '@salesforce/schema/Account.AccountSource';
import Account_Email__c from '@salesforce/schema/Account.Email__c';
import Account_Industry from '@salesforce/schema/Account.Industry';
import Account_Tier from '@salesforce/schema/Account.Tier';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';

export default class RecordCreationForm extends NavigationMixin(LightningElement) {
   objectApiName ='Account';
   fieldList =[Account_Name,Account_Site,Account_AccountSource,Account_Email__c,Account_Industry,Account_Tier];

   handleSuccess(event)
   {
    const evt = new ShowToastEvent({
        title: 'New Record Created successfully',
        message: 'Record id'+event.detail.id,
        variant: 'sucess'
    });
    this.dispatchEvent(evt);
    this[NavigationMixin.Navigate]({
        type: 'standard__recordPage',
        attributes: {
            recordId: event.detail.id,
            objectApiName:'Account',
            actionName: 'view'
        },
    });

   }

}