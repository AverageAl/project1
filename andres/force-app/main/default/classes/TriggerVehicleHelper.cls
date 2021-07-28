public class TriggerVehicleHelper {

    //if there are any negative values we will set them to null or a default value
    public static void checkForNegativeValues(List<Vehicle__c> vehicleList){
        for(Vehicle__c vehicle : vehicleList){
            if(Integer.valueOf(vehicle.Year__c) < 0){
               // System.debug(Integer.valueOf(vehicle.Year__c));
                vehicle.Year__c = null;
            }
            /*if(vehicle.Mileage__c < 0){
                //System.debug(vehicle.Mileage__c);
                vehicle.Mileage__c = null;
            }*/
            
            
            if(vehicle.Price__c == null){
				//System.debug(vehicle.Price__c);
                vehicle.Price__c = 1;
                //vehicle.addError('Price was set to a value less than 0.');
            }
        }
    }
}