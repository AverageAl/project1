({
    //called on component initialization
	doInit: function(component, event, helper) {
        helper.fetchVehicleHelper(null, component);
		
	},
    
    //performs search on Vehicles
    searchVehicle: function(component, event, helper){
        var searchVal = component.find("searchField").get("v.value");
        helper.fetchVehicleHelper(searchVal, component);
    }
})