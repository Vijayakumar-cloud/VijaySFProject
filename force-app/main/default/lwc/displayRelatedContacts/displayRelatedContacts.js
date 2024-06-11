import { LightningElement,api,wire} from 'lwc';
import getContacts from '@salesforce/apex/ContactCOntroller.getContacts';


export default class DisplayRelatedContacts extends LightningElement {
    @api recordId;
    columns =[
                    {label:'First Name', fieldName:'FirstName'},
                    {label:'Last Name',fieldName:'LastName'},
                    {label: 'Email',fieldName:'Email'}

    ];

    @wire(getContacts,{accountid:'$recordId'}) contacts;

    deleteRow(event) {
        var rowIndex = event.currentTarget.dataset.index;
        if(this.contacts.length > 1) {
            this.contacts.splice(rowIndex, 1);
        } 
    }
    addRow() {
        this.contacts.push(JSON.parse(JSON.stringify(this.contacts)));

    }
     //update table row values in list
       updateValues(event){
            var foundelement = this.records.find(ele => ele.Id == event.target.dataset.id);
            if(event.target.name === 'FirstName'){
              foundelement.FirstName = event.target.value;
            } else if(event.target.name === 'LastName'){
              foundelement.LastName = event.target.value;
            } else if(event.target.name === 'Email'){
              foundelement.Email = event.target.value;
            }
          }
}