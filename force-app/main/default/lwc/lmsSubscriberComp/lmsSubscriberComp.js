import { LightningElement, wire,api,track } from 'lwc';
import TestLMSChannel from '@salesforce/messageChannel/LMSChannel__c';
import { subscribe, MessageContext } from 'lightning/messageService';
import getAccountContacts from '@salesforce/apex/StreamingApiCntrlr.getContacts';

const columns = [
    { label: 'FirstName', fieldName: 'FirstName',type:'text' },
    { label: 'lastName', fieldName: 'LastName', type: 'text' },
    { label: 'Email', fieldName: 'Email', type: 'text' },
];

export default class LmsSubscriberComp extends LightningElement {

    @wire(MessageContext,{})
    messageContext;
    subscription = null;
    getCount;
    @api recordId;
   @track conList =[];
    columns =columns;
    isTrue = false;

    connectedCallback() {
        this.conList =[];
        this.handleSubscribe();
    }
    handleSubscribe()
    {
    if(this.subscription)
    {
        return ;
    }
    this.subscription = subscribe(this.messageContext,TestLMSChannel,(message) =>{

        console.log('messsage received ',message.message);
        this.getCount = message.message;
        this.getContacts(this.getCount)
    })
    }
    getContacts(num)
    {
        getAccountContacts({countVal : num,accId:this.recordId})
        .then(result => {
            console.log('result returned ',result);
            console.log('checkk')
            console.log('check conList ',this.conList);
            this.conList = result;
            console.log('conlist ',JSON.stringify(this.conList));
            this.isTrue = result.length > 0 ? true : false;
            console.log('is Trueee ',this.isTrue)
        })
        .catch(err => {
            console.log('error occured ',err);
        })
    }
}