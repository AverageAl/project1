({
    createSellerRequest: function(component, sellerRequest) {
        let theSellerRequests = component.get("v.sellerRequests");
        // Copy the expense to a new object
        // THIS IS A DISGUSTING, TEMPORARY HACK
        let newSellerRequest = JSON.parse(JSON.stringify(sellerRequest));
        theSellerRequests.push(newSellerRequest);
        component.set("v.sellerRequests", theSellerRequests);
    }
})