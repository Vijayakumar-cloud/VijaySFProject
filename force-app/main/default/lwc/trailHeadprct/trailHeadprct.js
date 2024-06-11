import { LightningElement,track } from 'lwc';

export default class TrailHeadprct extends LightningElement {
    name = 'Electra X4';
   description = 'A sweet bike built for comfort.';
   category = 'Mountain';
   material = 'Steel';
   price = '$2,700';
   @track disVAlue= 0 ;
   @track amnt = 0;
  @track discountedPrice ;
   docheck(event)
   {
    const inputName = event.target.label;
    const inputValue = event.target.value;
    if(inputName === 'Amount')
    {
        this.amnt =inputValue;
    }
    else
    {
        this.disVAlue =inputValue;
    }
   }

   handleClick(event)
   {

        this.discountedPrice = (this.amnt)- (this.amnt)*(this.disVAlue) / 100;
        console.log('amountc'+this.amnt);
        console.log('discount'+this.disVAlue);
        console.log('result'+this.discountedPrice);

   }
   pictureUrl = 'https://s3-us-west-1.amazonaws.com/sfdc-demo/ebikes/electrax4.jpg';
   ready = false;
   connectedCallback() {
       setTimeout(() => {
           this.ready = true;
       }, 3000);
   }
}