import { LightningElement } from 'lwc';
import databaseCall from '@salesforce/apex/AccountSearchHand.databaseCall';
const columns = [
    { label: 'Label', fieldName: 'Name' },
    { label: 'Website', fieldName: 'Type', type: 'text' }
   
];

export default class AccountSearch extends LightningElement {}

AccName ='';
AccData =[];
columns = columns;
handleClick(event)
{
    this.ImperativeCall();
}
ImperativeCall()
{
    databaseCall({accSearchName:this.AccName})
    .then((result)=>{
        this.AccData= result;
    })
    .catch((error)=>{
        this.AccData= error;
    })

    



    
}