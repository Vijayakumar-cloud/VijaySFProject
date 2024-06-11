({
	getRelatedContacts : function(component,event) {
		
       console.log('inside helper');
       let action = component.get('c.getRelatedContacts')
       action.setParams({accId : component.get("v.recordId")});
        action.setCallback(this,function(response) {
            let state =response.getState();
           console.log('state check ',state);
            if(state === "SUCCESS")
            {
                let dataReturned =response.getReturnValue();
                console.log('dataReturned  > ',JSON.stringify(dataReturned));
                if(dataReturned != null)
                {  
                    let conList = dataReturned.map((element,index) => {
                        
                       element = Object.assign({},element,{rowIndex: index})
                       element = Object.assign({},element,{index: index+1})
                       
                       return element;
                    
                    
                });
                    console.log('conList >> ',JSON.stringify(conList));
                    component.set("v.contactList",conList);
                }
            }
            if(state === 'ERROR')
            {
                let errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + 
                                 errors[0].message);
                        alert('Error occured  '+errors[0].message);
                    }
                		
            		}
            }
        }) 
     $A.enqueueAction(action);
	},

})