@isTest public class VehicleTest {
	
    /*@TestSetup
    static void MakeTestData(){
           
    }*/
    
    @isTest public static void testForNullPrice(){
        List<Vehicle__c> testVehicles = new List<Vehicle__c>();
        List<Lot__c> lots = [SELECT Name FROM Lot__c WHERE Vehicle_Type__c = 'Sedan'];
        String lotId;
        for(Lot__c lot : lots){
            lotId = lot.Id;
        }

		for(Integer i = 0; i < 5; i++){
            testVehicles.add(new Vehicle__c(Name = 'vehicle#'+i, Price__c = null, Mileage__c = (-1)*Math.random()*100000, Type__c = 'Sedan', Lot__c = lotId));
        }
                             
        Test.startTest();
        Database.SaveResult[] results = Database.insert(testVehicles, false);
        Test.stopTest();
   		
        for(Database.SaveResult iRes : results){
            System.assert(!iRes.isSuccess());		// checks if not successfull
        }
                     
    }
}