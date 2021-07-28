@isTest
public class EmployeeTest {

    //@TestSetup
    //static void createTestData(){
    //   
    //} 
    
    
    @isTest
    public static void testInsertEmployeeDuplicate(){
		
        // creating a record that is a duplicate
        Employee__c emp = new Employee__c(Name='Kelley Clark', Phone_Number__c='2455432121');
        Test.startTest();
        Database.SaveResult result = Database.insert(emp, false);
        Test.stopTest();
        
        //System.assert(result.isSuccess());
        //System.assert(result.getErrors().size() > 0);
        System.assertEquals('The details of this employee have already been stored.', result.getErrors()[0].getMessage());
                                         
    }
    
                                         
    

}