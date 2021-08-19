//  Revature June 21, 2021 Salesforce Batch - Team Vanquish/Fab5 - Project 2 -->
//  Recreating Project 1's Sellers_Page.page functionality using Lightning Aura Web Components -->
//  Jeremy Davis

({
	createSellerRequest: function(component, sellerRequest) {
        let action = component.get("c.saveSellerRequest");
        action.setParams({
            "sellerRequest": sellerRequest
     	});
        action.setCallback(this, function(response){
            let state = response.getState();
            if (state === "SUCCESS") {
                let sellerRequests = component.get("v.sellerRequests");
                sellerRequests.push(response.getReturnValue());
                component.set("v.sellerRequests", sellerRequests);
            }
        });
        $A.enqueueAction(action);
    }
})
