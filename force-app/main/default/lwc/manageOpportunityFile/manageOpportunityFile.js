import { LightningElement,api,wire,track } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getFiles from '@salesforce/apex/DocsClass.getFiles';
import getRelatedFiles from '@salesforce/apex/FileUploadViewController.getRelatedFiles';

export default class ManageOpportunityFile extends NavigationMixin(LightningElement) {
    @track files;
    @api folderidfromparent
    @api getidfromparent
    @track error;
    filePreviewUrl = []
    @wire(getFiles, { oppid: '$getidfromparent', folderid: '$folderidfromparent' })
    WiredocRecords({ data, error }) {     
        if (data) {
            console.log('if ' + JSON.stringify(data))
            this.files = data;
        }
        else {
            console.log('else ')
            this.error = error;
            this.files = undefined;
        }
    }
    handleCallApexToPreview(event) {
        console.log('handle apex ' + event.target.dataset.id)
        getRelatedFiles({ recordId: event.target.dataset.id })
            .then((result => {
                this.filePreviewUrl = Object.keys(result).map(item => ({
                  
                    " url ": `/sfc/servlet.shepherd/document/download/${item}`

                }))
                this.handleFilePreviewWithId(Object.keys(result)[0]);
                console.log(this.filePreviewUrl)

            }))
            .catch((error) => {
                const events = new ShowToastEvent({

                    title: 'Error',
                    Varient: 'Error',
                    message: error.body.message,
                })
                this.dispatchEvent(events);
                this.filePreviewProperty = null;
            })
    }

    handleFilePreviewWithId(id) {
        console.log('handle preview id ' + id)
        this[NavigationMixin.GenerateUrl]({
            type: 'standard__namedPage',
            attributes: {
                pageName: 'filePreview'

            },
            state: {
                selectedRecordId: id

            }
        })
            .then(url => { window.open(url) });

    }

    get acceptedFormats() {
        return ['.pdf', '.png', '.jpg'];
    }
    handleUploadFinished(event) {

        const uploadedFiles = event.detail.files;
        console.log(uploadedFiles)
        let uploadedFileNames = '';
        for (let i = 0; i < uploadedFiles.length; i++) {
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

}