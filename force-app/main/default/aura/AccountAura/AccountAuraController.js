({
    
    // New Model
    handleInputFieldEvent:function(component, event, helper)
    {
        console.log('inside parent- event Input');
        var params = event.getParams();
        if(params.data.accName)
        {
            var accName =params.data.accName;
            console.log('accName  '+accName);
            component.set('v.AccountName',accName);
            helper.getAccountHelper(component, event, helper,accName)
        }
        else
        {
             component.set('v.isResult',false);
            component.set('v.displaySearchResult',false);
        }
    },
    handleAccountListEvent:function(component, event, helper)
    {
        console.log('inside parent- event Table List');
        var params = event.getParams();
        if(params && params.data.accId)
        {
            component.set('v.accountId',params.data.accId);
            component.set('v.isResult',params.data.showTable);
            component.set('v.displaySearchResult',params.data.showTable);
            component.set('v.displayEditForm',params.data.showEditForm);
        }
    },
    handleAccountEditEvent:function(component, event, helper)
    {
        console.log('inside parent- event Record Edit');
        var params = event.getParams();
        if(params)
        {
            component.set('v.displayEditForm',params.data.showEditForm);
            //component.set('v.isResult',params.data.showTable);
            //component.set('v.displaySearchResult',params.data.showTable);
            console.log('inside value set')
            var accName =component.get('v.AccountName')
            helper.getAccountHelper(component, event, helper,accName)
        }
        
    }
    
})