//Errors
@istest(seeAllData='true') class EmployeesListWithControllerTest {
   
    @isTest static void positiveTestForEmployeesListWithController()
    {		
		// Testing the retrieval of records.
       
        System.Test.startTest();
        List <Employee__c> testResult = EmployeesListWithController.getEmployees();
        System.Test.stopTest();
		
        System.assert( !( testResult.isEmpty() ) );
	}
    
    // Put @TestSetup methods that contain employee factories somewhere, or
	//	put employee factories within the .test parts?
	
/* 	(1) Get the number of present employees.
    (2) Create employee list.
    (3) Create 200 new employees. (Remember db changes during tests arent stored.)
    (4) Put them in the database.
    (5) Execute the getEmployees method.
    (6) Check that old number of present employees + 200 equals
    the output of the getEmployees method.
    */
	
    @isTest static void bulkEmployeeTest()
    {        
    	List<Employee__c> realEmployeesList = EmployeesListWithController.getEmployees(); 	// (1.1)
		integer numOfRealEmployees = realEmployeesList.size();								// (1.2)
		
		List<Employee__c> fakeEmployees = new List<Employee__c>();						  	// (2.1)
		
       	for(integer i=0; i<200; i++)													  	// (3)
		{
			Employee__c fakeEmployee = new Employee__c(Name='Fake'+i);
            fakeEmployees.add(fakeEmployee);
		}
		
		insert fakeEmployees;																// (4)
        
		List<Employee__c> mixedEmloyeeList = EmployeesListWithController.getEmployees();  	// (5)
        System.Test.stopTest();
		
		System.assertEquals(numOfRealEmployees+200, mixedEmloyeeList.size());			  //(6)
	}        
     
}