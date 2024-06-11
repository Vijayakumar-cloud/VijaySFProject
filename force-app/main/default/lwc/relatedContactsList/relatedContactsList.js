import { LightningElement, api, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { createRecord } from 'lightning/uiRecordApi';
import Contact from '@salesforce/schema/Contact';
import FirstName from '@salesforce/schema/Contact.FirstName';
import LastName from '@salesforce/schema/Contact.LastName';
import Email from '@salesforce/schema/Contact.Email';


export default class RelatedContactsList extends LightningElement {
    @api recordId;
    @track contactList = [{
        FirstName:'',
        LastName:'',
        Email:'' 
    }];

  
    addRow() {
        this.contactList.push(JSON.parse(JSON.stringify(this.contactList)));
    }

    deleteRow(event) {
        var rowIndex = event.currentTarget.dataset.index;
        if(this.contactList.length > 1) {
            this.contactList.splice(rowIndex, 1);
        } 
    }

    handleChange(event) {
        var rowIndex = event.currentTarget.dataset.index;
        if(event.target.name === 'FirstName') {
            this.contactList[rowIndex].FirstName = event.target.value;
        } else if(event.target.name === 'LastName') {
            this.contactList[rowIndex].LastName = event.target.value;
        } else if(event.target.name === 'Email') {
            this.contactList[rowIndex].Email = event.target.value;
        } 
    }


    handleSave() { 
        var emptyCheck = false; 
        for(let rowIndex in this.contactList) { 
            if(this.contactList[rowIndex].FirstName == null ||
                this.contactList[rowIndex].LastName == null ||    
                this.contactList[rowIndex].Email == null || 
                this.contactList[rowIndex].FirstName == '' ||
                this.contactList[rowIndex].LastName == '' ||
                this.contactList[rowIndex].Email == '' ) {
                emptyCheck = true;
                this.dispatchEvent(new ShowToastEvent({
                    title: 'Error',
                    message: 'Please fill all empty fields',
                    variant: 'error',
                }));
                return false;
            } else {
                console.log('pass');
            }
        }
       
        if(emptyCheck === false) {
        const fields = {}; 
        for(let rowIndex in this.contactList) {
            fields[FirstName.fieldApiName] = this.contactList[rowIndex].FirstName;
            fields[LastName.fieldApiName] = this.contactList[rowIndex].LastName;
            fields[Email.fieldApiName] = this.contactList[rowIndex].Email;
           
            const recordInput = { apiName: Contact.objectApiName, fields};
            createRecord(recordInput)
            .then(result => {
                if(result !== undefined) { 
                    this.contactList[rowIndex].FirstName = '';
                    this.contactList[rowIndex].LastName = '';
                    this.contactList[rowIndex].Email = '';
                    this.dispatchEvent(new ShowToastEvent({
                        title: 'Success',
                        message: 'Contact created Successfully',
                        variant: 'success',
                    }));
                }
            })
            .catch(error => {
                this.dispatchEvent(new ShowToastEvent({
                    title: 'Error creating record',
                    message: error.body.message,
                    variant: 'error',
                }));
            });
          }
       }
    }

}