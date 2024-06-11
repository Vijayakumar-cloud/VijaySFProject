import { LightningElement } from 'lwc';
import databaseCall from '@salesforce/apex/AccountSearch.databaseCall';
const columns = [
{ label: 'Label', fieldName: 'Name' },
{ label: 'Type', fieldName: 'Type', type: 'text' }
];
export default class AccountRecordFetch extends LightningElement {
AccName ='';
AccData =[];
columns = columns;
handleClick()
{
databaseCall({accSearchName:this.AccName})
.then(result =>{
     this.AccData= result;
     })
.catch(error =>{ 
    this.AccData= error;
})

}
handleChange(event) 
{
    this.AccName = event.target.value;
}
}