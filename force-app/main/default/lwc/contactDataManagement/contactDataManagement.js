import { LightningElement,api } from 'lwc';
import deleteContact from '@salesforce/apex/AccountController.deleteContact';

export default class ContactDataManagement extends LightningElement {
 
    @api contact;

    connectedCallback()
    {
        //this.contact.index = parseInt(this.contact.index)+1;
    }
  @api  handleDeleteContact(indexNo)
    {
        console.log('index >> ',indexNo);
        if(this.contact.index === parseInt(indexNo))
        {
            deleteContact({con:this.contact})
            .then(result => {
                console.log('result ',result);
                console.log('contatc deleted >> ',JSON.stringify(this.contact));
                this.updateParent(this.contact.Id,'Action Success',result,'success')
            })
            .catch(error => {
                console.log('error ',error);
                this.updateParent(null,'Action Failed',error.body.pageErrors[0].message,'error')
            })
        }
        else {
            console.log('not match > ',indexNo);
            console.log('contact >> ',JSON.stringify(this.contact));
            this.updateParent(null,'Action Failed','cannot found contact for given input','error')
        }
    }

    updateParent(conId,title ,message,variant){
        const updateParentEvent = new CustomEvent("itemchange", {
            detail: {elemId :conId,toastTitle:title,toastMessage :message,toastVariant :variant}
          });
      
          // Dispatches the event.
          this.dispatchEvent(updateParentEvent);
    }
}