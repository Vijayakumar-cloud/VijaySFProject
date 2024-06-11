({
	handleAccClick : function(component, event, helper) 
    {
        var cmpEvent = component.getEvent('accountListEvent');
        cmpEvent.setParams({
            data:{
                accId:event.currentTarget.dataset.id,
                showTable:false,
                showEditForm : true
            }
        })
        cmpEvent.fire();
    }	
	
})