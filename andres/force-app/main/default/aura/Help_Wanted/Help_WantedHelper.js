({
   

	getOpenPositionsHelper : function(component) {
		

        let getMyOpenPositions = component.get("c.getMyOpenPositions");
  
        getMyOpenPositions.setCallback(this, function(response){
            console.log(response.getReturnValue());
            if(response.getState() == "SUCCESS"){
                
                component.set("v.openPositions", response.getReturnValue());
            }
        });
        $A.enqueueAction(getMyOpenPositions);
        
             let bool = component.get("v.display");
        if(bool){
            component.set("v.ButtonLabel", "Show Open Positions");
        }else{
            component.set("v.ButtonLabel", "Hide Open Positions");
        }
        component.set("v.display", !bool);   
        

	}
    
    
    
	

})