import { LightningElement,api,track,wire } from 'lwc';
import getFiles from '@salesforce/apex/DocsClass.getFiles';
import {ShowToastEvent} from 'lightning/platformShowToastEvent'
import { NavigationMixin } from 'lightning/navigation';
import getRelatedFiles from '@salesforce/apex/FileUploadViewController.getRelatedFiles';


export default class childComponentDocs extends NavigationMixin(LightningElement) {

@track files;
@api folderidfromparent
@api filePreviewId;
@api getidfromparent
@track lstAllFiles = [];
 fileId;
 preview=false;
 @api showKeyFromChild
@track error;
@track result;
@api filesTwo=[];



handlePreview(id) {
    // Naviagation Service to the show preview
    console.log('without current:'+id)
    this[NavigationMixin.GenerateUrl]({
        type: 'standard__namedPage',
        attributes: {
            pageName: 'filePreview'
        },
        state: {
            // assigning ContentDocumentId to show the preview of file
            selectedRecordId: id
        }
    }).then(url => { window.open(url) });
}
/*@track columns = [
    
    { label: 'Name', fieldName: 'Name', type: 'text'} ,
    { label: 'Document', fieldName: 'Document_Data__c', type: 'text'} ,
    {
        label:'upload file',
        type: 'file',
        typeAttributes:
        {
            iconName: 'utility:attachment',
            name: 'upload files',
           
        }
    },
    
];*/

@wire(getFiles, {oppid:'$getidfromparent',folderid:'$folderidfromparent'})
WiredocRecords({data,error}){
   
  console.log('data '+JSON.stringify(data));
    if(data){        
        console.log('if child'+JSON.stringify(data))      
        this.files = data;      
    }
    else{
        console.log('else child')
        this.error = error;
        this.files = undefined;
    }
   }
   handleApex(event){

    this.preview =true;
    getRelatedFiles({recordId: event.target.dataset.id})
        .then(result =>{
            console.log('woooo:'+JSON.stringify(result));
          // this.handlePreview(Object.keys(result)[0])
           console.log('ShowData:'+Object.keys(result)[0]);
          // this.filesTwo = Object.keys(result).map(item=>({"label":result[item],
           // "value": item,
           // "url" : `/sfc/servlet.shepherd/document/download/${item}`
       // }))
        this.handlePreview(Object.keys(result)[0])
       // console.log('datatwooo:'+this.filesTwo);
            })
       .catch(error =>{ 
        console.log(error);
       })
   }
   
get acceptedFormats() {
    return ['.pdf','.png','.jpg'];
}

       handleUploadFinished(event) {

        
    /*    const fileid=event.target.dataset.id
        this.fileid=event.target.dataset.id;
        console.log( this.fileid)       
        const lstUploadedFiles = event.detail.files;
        console.log(lstUploadedFiles);
        lstUploadedFiles.forEach(fileIterator => this.lstAllFiles.push(fileIterator.name));*/
      

        
       // this.fileId=event.target.dataset.id;
       // console.log('eventid '+this.fileId)
        const uploadedFiles = event.detail.files;
        console.log(uploadedFiles)
        let uploadedFileNames = '';
        for(let i = 0; i < uploadedFiles.length; i++) {
            uploadedFileNames += uploadedFiles[i].name + ', ';
        }
            this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: uploadedFiles.length + ' Files uploaded Successfully: ' + uploadedFileNames,
                variant: 'success',
            }),
        );      
        
    }
    handleClick()
    {
        
        this.showKeyFromChild=false
        const selectedevent=new CustomEvent("shownewchange",{
    
           detail:this.showKeyFromChild
    
    
        });
        this.dispatchEvent(selectedevent);
        console.log('handleclick');
    }
    
}