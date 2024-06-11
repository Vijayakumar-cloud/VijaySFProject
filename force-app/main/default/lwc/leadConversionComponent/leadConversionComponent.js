import { LightningElement,api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { CloseActionScreenEvent } from 'lightning/actions';
import convert from '@salesforce/apex/leadConvertController.convert';

export default class LeadConversionComponent extends LightningElement {
    @api recordId;

 /*   @api invoke()
    {
        this.handleApex
    } */



   handleApex()
    {
        console.log(this.recordId)
 convert({recId:this.recordId})
 
.then(result =>{

     console.log('RecResult'+result)
     console.log('**********')
     this.dispatchEvent(new ShowToastEvent({
        title:'Success',
        message: 'Lead has been converted successfully',
        variant:'success'
     }))
     })
.catch(error =>{ 
    console.log(error)
    console.log('?????????/////')
})

    } 

    closeAction()
    {
        this.dispatchEvent(new CloseActionScreenEvent());
    } 
}