({
	handleSearch : function(component, event, helper) {
        var cmpEvent = component.getEvent('inputFieldEvent');
        cmpEvent.setParams({
            data:{
                accName:component.find('inputId').get('v.value'),
                showTable: true,
                hideAll : true
            }
        })
  
        cmpEvent.fire();
    }
})