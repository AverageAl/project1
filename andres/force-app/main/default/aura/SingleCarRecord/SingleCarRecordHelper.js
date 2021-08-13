({
    findRecordValuesHelper : function(component) {
		//console.log("inside the helper");
        var action = component.get("c.vehicleWithEmployeeInfo");
        action.setParams({
            "recordId" : component.get("v.recordId")
        });
        //console.log(action);
        
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                //console.log(response.getReturnValue());
                component.set("v.vehicleInfo", response.getReturnValue());
            } else{
                alert("Error occured.");
            }
        });
        $A.enqueueAction(action);
    }
    
})