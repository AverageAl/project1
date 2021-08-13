({
	getQueriedVehiclesHelper : function(component) {
		let getQueriedVehicles = component.get("c.makeVehicleQuery");
        let vehicleFields = {Name: "v.makeAndModel",
                             Listed_As__c: "v.listedAs",
                             Mileage__c: "v.mileage",
                             Price__c: "v.price",
                             Transmission__c: "v.transmission",
                             Type__c: "v.type",
                             Year__c: "v.year"};
        let vehicleQuery = "SELECT Name, Listed_As__c, Mileage__c, Price__c, Transmission__c, Type__c, Year__c FROM Vehicle__c";
        let vehicleWhereClause = "";
        for(let field in vehicleFields){
            if(component.get(vehicleFields[field])){
                if(!vehicleWhereClause){
                    vehicleWhereClause += ` WHERE ${field} = '${component.get(vehicleFields[field])}'`;
                }
                else{
                    vehicleWhereClause += ` AND ${field} = '${component.get(vehicleFields[field])}'`;
                }
            }
        }
        vehicleQuery += vehicleWhereClause;
        getQueriedVehicles.setParams({query : vehicleQuery});
        getQueriedVehicles.setCallback(this, function(response){
            if(response.getState() == "SUCCESS"){
                console.log("hello world");
                console.log(response.getReturnValue());
                component.set("v.queriedVehicles", response.getReturnValue());
            }
        });
        $A.enqueueAction(getQueriedVehicles);
	}
})