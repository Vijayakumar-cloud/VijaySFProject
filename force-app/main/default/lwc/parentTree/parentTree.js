import { LightningElement, track, wire, api } from 'lwc';
import getdocs from '@salesforce/apex/DocsClass.getdocs';
export default class parentComponentDocs extends LightningElement {
    @api recordId;
    @track conta;
    @api folderid
   showNew=false;
   
    @wire(getdocs, {oppid:'$recordId'}) 
  
    WiredocRecords({data,error }){
        console.log('recid '+this.recordId);
        console.log('test '+JSON.stringify(data));
        if(data){
            console.log('if parent')
            this.conta = data;
           
        }else{
            console.log('else parent')
            this.error = error;  
            this.conta = undefined;

        }
    }
    handleClick(event)

    {
        this.showNew=true;
        this.folderid = event.target.dataset.id
     
        
   // this.template.querySelector("c-fileschildcomponent").handlevalue();

    }
    handleshownew(event){
        console.log("shownew "+event.detail);
        this.showNew=event.detail;

    }
}