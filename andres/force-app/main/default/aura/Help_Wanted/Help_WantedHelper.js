({
   

	getOpenPositionsHelper : function(component) {
		
        //HOW TO CALL AN APEX CONTROLLER IN AURA

        //STEP 1: to call our apex controller we must first get the method of the controller
        //	using the c value provider and the component.get() function
        let getMyOpenPositions = component.get("c.getMyOpenPositions");
       
        //STEP 2: since our method on the apex controller is parameter-less we don't have worry about step two BUT if you do have parameters 
        //			for the apex method you must do the following:
        //	jsVar.setParams({paramName : value, paramName2 :  value});
        
        //STEP 3: define the callback function in the setCallback method for when the server returns from the apex controller
  
        getMyOpenPositions.setCallback(this, function(response){
            //STEP 4: is to handle our logic if the response return successfully, done by checking the getState() method
            console.log(response.getReturnValue());
            if(response.getState() == "SUCCESS"){
                
                component.set("v.openPositions", response.getReturnValue());
            }
        });
        //STEP 5: we need enqueue our request, it will not make the call if we do not enqueue the action
        //once our asynchronous call is executed and returns, the callback function we defined above will execute.
        $A.enqueueAction(getMyOpenPositions);
        
        //$A is the Aura component model namespace
        let bool = component.get("v.display");
        if(bool){
            component.set("v.ButtonLabel", "Show Open Positions");
        }else{
            component.set("v.ButtonLabel", "Hide Open Positions");
        }
        component.set("v.display", !bool);
	}
    
    
    
	

})