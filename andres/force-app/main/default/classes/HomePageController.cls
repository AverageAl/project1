public class HomePageController {
	@AuraEnabled
    public static List<Id> makeVehicleQuery(String query){
        List<Vehicle__c> vehicles = new List<Vehicle__c>();
        try{
        	vehicles = Database.query(query);    
        }
        catch(QueryException e){System.debug('Invalid Query String');}
        List<Id> ids = new List<Id>();
        for(Vehicle__C v : vehicles){
            ids.add(v.Id);
        }
        return ids;
    }
}