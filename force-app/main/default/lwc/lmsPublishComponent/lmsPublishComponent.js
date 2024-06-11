import { LightningElement, wire,api,track } from 'lwc';
import TestLMSChannel from '@salesforce/messageChannel/LMSChannel__c';
import {publish, MessageContext} from 'lightning/messageService'
import { loadScript } from 'lightning/platformResourceLoader';
import HTML2CANVAS from '@salesforce/resourceUrl/HTML2CANVAS';
export default class LmsPublishComponent extends LightningElement {

    @wire(MessageContext,{})
    messageContext;
    getCount;
    @api recordId;
    imgsrc ='';
    connectedCallback() {
 
        loadScript(this, HTML2CANVAS).then(() => {
            console.log('html2canvas loaded  check ',HTML2CANVAS);
        });
    } 
    handleChange(event){
        this.getCount = event.target.value;
    }
 
    handleClick() {
        let message = {message: this.getCount};
        publish(this.messageContext, TestLMSChannel, message);
    }
    handleSnapClick()
    {
        this.imgsrc = '';
        console.log('inside snap ');
        console.log('inside snap 2222 ');
        console.log('select q >> ',JSON.stringify(this.refs.mainDiv));
        HTML2CANVAS(this.template.querySelector('.captureid'),{ 
            scale: "5",
            onrendered: (canvas)=> {
                //show image
                console.log('inside canvas');
                let myCanvas = this.template.querySelector('.my_canvas_id');
                let ctx = myCanvas.getContext('2d');
                ctx.webkitImageSmoothingEnabled = false;
                ctx.mozImageSmoothingEnabled = false;
                ctx.imageSmoothingEnabled = false;
                let img = new Image;
                img.onload = function(){
                    ctx.drawImage(img,0,0,270,350); // Or at whatever offset you like
                };
                console.log('img >> ', canvas.toDataURL());
                img.src = canvas.toDataURL();
                this.imgsrc = img.src;
            }
        });
    }

   @track videoElem;
   @track startElem;
   @track stopElem;
   @track canvas;
    takeScreenShot()
    {

        console.log('inside takePicture ')
        console.log('init check ')
        this.videoElem = this.template.querySelector(".video");
        this.startElem = this.template.querySelector("start");
        this.stopElem = this.template.querySelector("stop");

        this.canvas = document.createElement('canvas');

        let displayMediaOptions = {
            video: {
                cursor: "never"
            },
            audio: false
        };
        console.log('check ')
        console.log('check 2')
        this.startCapture(displayMediaOptions);
       /* this.startElem.addEventListener("click", (e) => {
            console.log('startCapture calling fr initiated1')
             this.startCapture(displayMediaOptions);
        }, false); */
    // console.log('startCapture calling initiated')
    
        console.log('check start')
       /* this.stopElem.addEventListener("click", () =>  {

            console.log('stopCapture calling initiated2')
            this.stopCapture();
            
        }, false); */
        console.log('check stop')
    }

   startCapture(displayMediaOptions){
      
    try 
    {
        console.log('inside start')
        console.log('displayMediaOptions ',displayMediaOptions);
        console.log('navigator  ' ,navigator.mediaDevices.getUserMedia(displayMediaOptions))
        navigator.mediaDevices.getDisplayMedia(displayMediaOptions)
        .then( mediaStream => {	
            console.log('mediastream >> ',mediaStream);
            this.videoElem.srcObject = mediaStream;
            this.videoElem.onloadedmetadata = (e) => {
            this.videoElem.play();
            this.videoElem.pause();
            
            this.canvas.width = this.videoElem.videoWidth;
            this.canvas.height = this.videoElem.videoHeight;
            this.canvas.getContext('2d').drawImage(this.videoElem, 0, 0);
            
            
              
            let dataUrl=this.canvas.toDataURL('image/jpg').replace(/^data:image\/(png|jpg);base64,/, '');
             console.log('dataurl  ',dataUrl);
             this.stopCapture();
           // helper.sendEmailtoAdmin(component, event,'data:image/jpg;base64,'+dataUrl);
            
        };
        }).catch( err => console.log(`${err.name}: ${err.message}`));
        
    }catch(err) {
        console.error("Error: " + err);
    } 
        
        }  

    stopCapture()
    {

        let tracks = this.videoElem.srcObject.getTracks();
            
        tracks.forEach(track2 => track2.stop());
        this.videoElem.srcObject = null;
    } 
}