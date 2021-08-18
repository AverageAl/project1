({
	getOpenPositions : function(component, event, helper) {
		
        helper.getOpenPositionsHelper(component);
        

	},
    
    flipbool : function(component,event,helper) {
        let bool = component.get("v.display2");
        if(bool){
            component.set("v.ButtonLabel2", "Apply");
        }else{
            component.set("v.ButtonLabel2", "Hide Application");
        }
        component.set("v.display2", !bool);
	},
	showToast : function(component, event, helper) {
    	var toastEvent = $A.get("e.force:showToast");
    	toastEvent.setParams({
        	title: "Success!",
       	 	message: "Your job application has been submitted successfully."
    	});
    	toastEvent.fire();
	}
})