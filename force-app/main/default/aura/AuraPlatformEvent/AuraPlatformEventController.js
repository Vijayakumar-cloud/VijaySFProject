({
    handleSubscribe : function(component, event, helper) 
    {
        component.set("v.Eventslist",[]);
        const empApi = component.find('empApi');
        var channelName ='/event/Account_Platform_Event__e';
        const replayId =-1;
         
        empApi.subscribe(channelName, replayId, $A.getCallback(eventReceived => {
            // Process event (this is called each time we receive an event)
            console.log('Received event ', JSON.stringify(eventReceived));
            var Eventslist = component.get("v.Eventslist");
            Eventslist.push(eventReceived);
            component.set("v.Eventslist",Eventslist);
            console.log('Received event length',Eventslist.length );
             if(Eventslist.length > 0)
            {
           		component.set("v.isReceived",true);
       	    }
            
        }))
            .then(subscription => {
            // Subscription response received.
            // We haven't received an event yet.
            console.log('Subscription request sent to: ', subscription.channel);
            console.log('All Subscriptions: ', subscription);
            // Save subscription to unsubscribe later
            //component.set('v.subscription', subscription);
        });
           
        },
     handleClick:  function(component, event, helper)
      {
          component.set("v.Eventslist",[]);
          component.set("v.isReceived",false);
      }
        })