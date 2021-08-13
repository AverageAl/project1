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
    }
})

// doInit in Input Data Using Forms lesson is used to adjust date info that will be retreived from SF. Not needed in our sellers page.