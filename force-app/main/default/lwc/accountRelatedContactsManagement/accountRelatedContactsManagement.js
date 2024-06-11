import { LightningElement,track,api } from 'lwc';
import getRelatedContacts from '@salesforce/apex/AccountController.getRelatedContacts';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class AccountRelatedContactsManagement extends LightningElement {
 
    @api recordId;
    @track getIndexNo;
    @track contactList =[];
    @track indexNo =0;
    @track isShowSpinner = false;
    connectedCallback()
    {
        getRelatedContacts({accId : this.recordId })
        .then(result => {
            console.log('returned res >> ',result);
            this.contactList= result.map(this.assignIndex)
            console.log('conList >> ',JSON.stringify(this.contactList));

        })
        .catch(error => {
            console.log('error ',error);
            this.handleShowToast('Error occured','fetch Contact Action Failed','error');

        })
    }
    assignIndex(element,index)
    { 
        return {
            ...element,
            rowIndex :index,
            index : index+1
        }
    }
    handleInputChange(event)
    {
        this.getIndexNo = event.target.value;
    }   

    handleDeleteContact()
    {
        this.isShowSpinner = true;
        this.template.querySelectorAll('c-contact-data-management').forEach((element,index) => {
           
            if(parseInt(this.getIndexNo-1) === index)
            {
                //console.log('elem > ',element);
                element.handleDeleteContact(this.getIndexNo);
            }
        })
        // let childComp = this.template.querySelector('c-contact-data-management');
        // childComp.handleDeleteContact(this.getIndexNo);
    }
    handleUpdateParent(event)
    {
        let eventData = event.detail;
        console.log('event detail >> ',JSON.stringify(eventData));
        if(eventData.elemId != null)
        { 
            let newArr =[];
            this.contactList.forEach(element => {
                if(element.Id !== eventData.elemId)
                {
                    delete element.index;
                    newArr.push(element);
                }
            })
            this.contactList =[];
            setTimeout(()=>{
                this.contactList = newArr.map(this.assignIndex);
                this.getIndexNo =null;
            },2000)
            console.log('newList ',JSON.stringify(this.contactList));
            this.getIndexNo =null;
            this.isShowSpinner = false;
            this.handleShowToast(eventData.toastMessage,eventData.toastTitle,eventData.toastVariant);
        }
        else {
            console.log('null conId')
            this.getIndexNo =null;
            this.isShowSpinner = false;
            
            this.handleShowToast(eventData.toastMessage,eventData.toastTitle,eventData.toastVariant);
        }

    }
    handleShowToast(message,title,variant)
   {
        this.dispatchEvent(
                new ShowToastEvent({
                        title: title,
                        message:message ,
                        variant: variant,
                       // mode: "dismissible"
         })
             );
}
}