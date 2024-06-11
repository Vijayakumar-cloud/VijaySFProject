import { LightningElement,wire,api } from 'lwc';
import { getRecords } from 'lightning/uiRecordApi';

export default class GetRecordComp extends LightningElement {

    @api recordId;
    @wire(getRecords, {recordId: '$recordId'})
    wiredResults({data,error})
    {
        if(data)
        {
            console.log('getData  ',data);
        }
        if(error)
        {
            console.log('error ',error)
        }
    }
    connectedCallback()
    {
        console.log('checkkk >>> ',this.recordId)
    }
}