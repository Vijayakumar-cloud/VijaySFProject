import { LightningElement,api,wire} from 'lwc';
import convert from '@salesforce/apex/leadConvertController.convert';
//import { ShowToastEvent } from 'lightning/platformShowToastEvent';


export default class LeadAction extends LightningElement {
    @api recordId;
     
    @wire(convert,{recId:this.recordId})
    wiredrecord({data,error})
    {
        if(data)
        {
            console.log('showdata')
        }
        if(error)
        {
            console.log('showerrornw')
        }
    }
   /*  this.dispatchEvent
    (new ShowToastEvent({
        title:'Success',
        message: 'Lead has been converted successfully',
        variant:'success'
     }),
     );*/

}