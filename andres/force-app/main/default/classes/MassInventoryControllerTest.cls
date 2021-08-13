@isTest
public class MassInventoryControllerTest {
    
    static testMethod void testFetchVehicle(){
        List<Vehicle__c> val = MyMassInventoryListController.fetchVehicle('dodge');
    }

}