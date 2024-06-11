import { LightningElement,track } from 'lwc';
import {
    subscribe,
    unsubscribe,
    onError,
    setDebugFlag,
    isEmpEnabled,
} from 'lightning/empApi';

export default class ManageStreamingAPiDashBoard extends LightningElement {

     channelName = '/event/DML_Exception_Event__e';
    @track  getCount =0;  
    replayId = -2;
     @track DmlExceptionList =[];
     openDashBoard = true;
     showData = false;
     @track getLimitCount =0;
     @track getDmlCount = 0;
     @track storeArr =[];

 connectedCallback()
     {
        console.log('check from callback  ',JSON.stringify(this.DmlExceptionList));
        this.DmlExceptionList =[];
        this.storeArr =[];
        console.log('check from callback 2 ',JSON.stringify(this.DmlExceptionList));
        this.replayId = -2;
        this.handleSubscribe();
     }

      handleSubscribe() {
        // Callback invoked whenever a new event message is received
        let tempArr =[...this.DmlExceptionList];
        const messageCallback = (response) => {
            console.log('New message received: ', JSON.stringify(response));
            console.log('checkkkk ',JSON.stringify(this.DmlExceptionList))
            tempArr.push(response);
            console.log('check tempArr ',JSON.stringify(tempArr));
            this.DmlExceptionList =[];
            this.storeArr =[];
            this.DmlExceptionList = [...tempArr];
            this.storeArr =[...tempArr]
            console.log('check list  ',JSON.stringify(this.DmlExceptionList));
            console.log('check length  ',tempArr.length);
            this.getDmlCount =0;
            this.getLimitCount = 0;
            tempArr.forEach(elem => {
                console.log('inside elem ',JSON.stringify(elem));
                if(elem.data.payload.ExceptionType__c.toLowerCase() === 'dml')
                {
                    console.log('inside dml')
                    this.getDmlCount = this.getDmlCount+1;
                }
                if(elem.data.payload.ExceptionType__c.toLowerCase() === 'limit')
                {
                    console.log('inside limit')
                    this.getLimitCount = this.getLimitCount+1;
                }
            })
            this.getCount = tempArr.length;
            console.log('check count  ',this.getCount);
            this.openDashBoard = true;
            this.showData = false;
            // Response contains the payload of the new message received
        };

        // Invoke subscribe method of empApi. Pass reference to messageCallback
        subscribe(this.channelName,this.replayId,messageCallback).then((response) => {
            // Response contains the subscription information on subscribe call
            console.log(
                'Subscription request sent to: ',
                JSON.stringify(response.channel)
            );
           // this.subscription = response;
           
        });
    }
    handleClick(event)
    {
        this.storeArr = [];
        console.log('event ',event.target.dataset.id);
        let exceptionType = event.target.dataset.id;
        this.showData = true;
        const result = this.DmlExceptionList.filter(elem => {
             return (elem.data.payload.ExceptionType__c.toLowerCase() === exceptionType);
        })
        // this.storeArr = [];
        this.storeArr = result;
        console.log('filtered array >>' ,JSON.stringify(this.storeArr));
    }
}