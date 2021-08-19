//  Revature June 21, 2021 Salesforce Batch - Team Vanquish/Fab5 - Project 2 
//  Recreating Project 1's Sellers_Page.page functionality using Lightning Aura Web Components
//  Jeremy Davis

({
    clickCreate: function(component, event, helper) {
        let validSellerRequest = component.find('sellerForm').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // If we pass error checking, do some real work
        if(validSellerRequest){
            // Create the new seller request
            let newSellerRequest = component.get("v.newSellerRequest");
            console.log("Create seller request: " + JSON.stringify(newSellerRequest));
            helper.createSellerRequest(component, newSellerRequest);
        }
    },
    	// Load seller requests from Salesforce
    doInit: function(component, event, helper) {
        // Create the action
        let action = component.get("c.getsellerRequests");
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            let state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.sellerRequests", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
    },
})
