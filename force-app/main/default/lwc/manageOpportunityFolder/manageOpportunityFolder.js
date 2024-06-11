import { LightningElement,api,wire,track } from 'lwc';
import getdocs from '@salesforce/apex/DocsClass.getdocs';

export default class ManageOpportunityFolder extends LightningElement {
    @api recordId;
    @track folderData;
    @api folderId
    @api showNew=false;
    
    @wire(getdocs, {oppid:'$recordId'}) 
  
    WiredocRecords({data,error }){
        console.log('recid '+this.recordId);
        console.log('test '+JSON.stringify(data));
        if(data){
            console.log('if parent')
            this.folderData = data;
            this.showNew = true;
            this.folderId = this.folderData[0].Id;
           
        }else{
            console.log('else parent')
            this.error = error;  
            this.folderData = undefined;

        }
    }
    handleClick(event)

    {     
        this.showNew=true;

        this.folderId = event.target.dataset.id
     
        console.log(this.folderId)
   // this.template.querySelector("c-fileschildcomponent").handlevalue();

    }
}