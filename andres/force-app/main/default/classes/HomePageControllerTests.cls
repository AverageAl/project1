@isTest
public class HomePageControllerTests {
	@isTest
    static void emptyQueryTest(){
        Employee__c e = new Employee__c();
        Lot__c l = new Lot__c();
        Vehicle__c v1 = new Vehicle__c();
        Vehicle__c v2 = new Vehicle__c();
        Vehicle__c v3 = new Vehicle__c();
        List<Vehicle__c> vList = new List<Vehicle__c>();
        vList.add(v1);
        vList.add(v2);
        vList.add(v3);
        e.Name = 'Billy';
        e.Phone_Number__c = '1231231234';
        e.Zip_Code__c = '12345';
        insert e;
        l.Name = 'Sedan';
        Employee__c emp = [SELECT Id FROM Employee__c];
        l.Employee__c = emp.Id;
        insert l;
        Lot__c lot = [SELECT Id From Lot__c];
        for(Vehicle__c v : vList){
            v.Lot__c = lot.Id;
            v.Type__c = 'Sedan';
            v.Year__c = '2001';
        }
        insert vList;
        List<Vehicle__c> results = HomePageController.makeVehicleQuery('');
        System.assertEquals(0, results.size());
    }
    @isTest
    static void queryNoWhereClause(){
        Employee__c e = new Employee__c();
        Lot__c l = new Lot__c();
        Vehicle__c v1 = new Vehicle__c();
        Vehicle__c v2 = new Vehicle__c();
        Vehicle__c v3 = new Vehicle__c();
        List<Vehicle__c> vList = new List<Vehicle__c>();
        vList.add(v1);
        vList.add(v2);
        vList.add(v3);
        e.Name = 'Billy';
        e.Phone_Number__c = '1231231234';
        e.Zip_Code__c = '12345';
        insert e;
        l.Name = 'Sedan';
        Employee__c emp = [SELECT Id FROM Employee__c];
        l.Employee__c = emp.Id;
        insert l;
        Lot__c lot = [SELECT Id From Lot__c];
        for(Vehicle__c v : vList){
            v.Lot__c = lot.Id;
            v.Type__c = 'Sedan';
            v.Year__c = '2001';
        }
        insert vList;
        List<Vehicle__c> results = HomePageController.makeVehicleQuery('SELECT Id FROM Vehicle__c');
        System.assertEquals(3, results.size());        
    }
}