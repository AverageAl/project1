({
	myAction : function(component, event, helper) {
		
	},
	showToast : function(component, event, helper) {
    	var toastEvent = $A.get("e.force:showToast");
    	toastEvent.setParams({
        	title: "Success!",
       	 	message: "Your case has been submitted successfully."
    	});
    	toastEvent.fire();
	}
})