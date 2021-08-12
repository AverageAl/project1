public class MyMassInventoryListController {
    
	//Get List of Vehicles for Mass Inventory Component
	@AuraEnabled
    public static List<Vehicle__c> fetchVehicle(String searchWord){
        
        List<Vehicle__c> returnList = new List<Vehicle__c>();
        
        //if search value is null, return all vehicles
        //else return the enquiry
        String searchKey = String.isBlank(searchWord) ? '%%' : searchWord + '%';
        
        returnList = [SELECT Name, Year__c, Price__c FROM Vehicle__c WHERE Name LIKE :searchKey LIMIT 20];
        
        return returnList;
        
    }
}
