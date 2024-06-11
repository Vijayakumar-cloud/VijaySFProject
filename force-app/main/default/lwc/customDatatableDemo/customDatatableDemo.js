import { LightningElement, track } from 'lwc';

export default class CustomDatatableDemo extends LightningElement {

    @track data = [];
    //have this attribute to track data changed
    //with custom picklist or custom lookup
    @track draftValues = [];

    connectedCallback() {
        this.columns = [
            { label: 'Name', fieldName: 'Name', editable: true },
            {
                label: 'files', fieldName: 'files', type: 'fileupload', typeAttributes: {
                    formats: ".pdf,.png",
                    recordId: { fieldName: 'Id' }, //pass Id of current record to fileupload for context
                }
            },
            {
                label: 'Rating', fieldName: 'Rating', type: 'picklist', typeAttributes: {
                    placeholder: 'Choose rating', options: [
                        { label: 'Hot', value: 'Hot' },
                        { label: 'Warm', value: 'Warm' },
                        { label: 'Cold', value: 'Cold' },
                    ] // list of all picklist options
                    , value: { fieldName: 'Rating' } // default value for picklist
                    , context: { fieldName: 'Id' } // binding account Id with context variable to be returned back
                },
                editable: true
            },
            {
                label: 'Parent', fieldName: 'ParentId', type: 'lookup', typeAttributes: {
                    placeholder: 'Select Parent Account',
                    uniqueId: { fieldName: 'Id' }, //pass Id of current record to lookup for context
                    object: "Account",
                    icon: "standard:account",
                    label: "Account",
                    displayFields: "Name, AccountNumber",
                    displayFormat: "Name (AccountNumber)",
                    filters: ""
                }
            }
        ];

        //sample data
        this.data = [
            { 'Id': '0019000000xDxtLAAS', 'Name': 'Acme', 'AccountNumber': 12345, 'Rating': 'Hot' },
            { 'Id': '00190000009J8mmAAC', 'Name': 'United Oil & Gas, UK', 'AccountNumber': 34567, 'Rating': 'Cold' }]
    }


    updateDataValues(updateItem) {
        let copyData = [... this.data];
        copyData.forEach(item => {
            if (item.Id === updateItem.Id) {
                for (let field in updateItem) {
                    item[field] = updateItem[field];
                }
            }
        });

        //write changes back to original data
        this.data = [...copyData];
    }

    updateDraftValues(updateItem) {
        let draftValueChanged = false;
        let copyDraftValues = [...this.draftValues];
        //store changed value to do operations
        //on save. This will enable inline editing &
        //show standard cancel & save button
        copyDraftValues.forEach(item => {
            if (item.Id === updateItem.Id) {
                for (let field in updateItem) {
                    item[field] = updateItem[field];
                }
                draftValueChanged = true;
            }
        });

        if (draftValueChanged) {
            this.draftValues = [...copyDraftValues];
        } else {
            this.draftValues = [...copyDraftValues, updateItem];
        }
    }

    //listener handler to get the context and data
    //updates datatable
    picklistChanged(event) {
        event.stopPropagation();
        let dataRecieved = event.detail.data;
        let updatedItem = { Id: dataRecieved.context, Rating: dataRecieved.value };
        this.updateDraftValues(updatedItem);
        this.updateDataValues(updatedItem);
    }

    handleSelection(event) {
        event.stopPropagation();
        let dataRecieved = event.detail.data;
        let updatedItem = { Id: dataRecieved.key, ParentId:  dataRecieved.selectedId };
        this.updateDraftValues(updatedItem);
        this.updateDataValues(updatedItem);
    }

    handleSave(event) {
        console.log('Updated items', this.draftValues);
    }
}