({
    //fetch vehicle info from controller
	fetchVehicleHelper : function(searchVal, component) {
        component.set("v.displayColumns", [
            { label: "Make and Model", fieldName: "Name", type: "text"},
            { label: "Year", fieldName: "Year__c", type: "text"},
            { label: "Price", fieldName: "Price__c", type: "currency"}
        ]);
        
        //creating the action
        var action = component.get("c.fetchVehicle");
        action.setParams({
            "searchWord": searchVal
        });
        
        //calling server-side method
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                component.set("v.invtList", response.getReturnValue());
            } else {
                alert("An error occured while fetching data");
            }
        });
		$A.enqueueAction(action);
	}
})