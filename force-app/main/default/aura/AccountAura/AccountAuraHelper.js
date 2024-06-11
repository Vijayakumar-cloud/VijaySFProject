({
    getAccountHelper : function(component, event, helper,accName) {
        console.log('accName from Helper '+accName);
        var action = component.get("c.getAccountList");
        action.setParams({accName: accName});
        action.setCallback(this,function(response){
            
            var responseValues= response.getReturnValue();
            console.log('accList '+JSON.stringify(responseValues));
            component.set('v.AccountData',responseValues);
            component.set('v.isResult',true);
            if(responseValues.length > 0)
            {
                console.log('inside if '+responseValues.length);
                component.set('v.displaySearchResult',true);
            }
            
            
            
        });
        
        $A.enqueueAction(action,false);
    }
})