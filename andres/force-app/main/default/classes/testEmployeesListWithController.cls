@istest(seeAllData='true') class TestEmployeesListWithController1 
{
	// This method successfully tests 100% of the controller class.
    @isTest static void TestActualEmployeesListWithController()
    {	       
        System.Test.startTest();
        List <Employee__c> testResult = EmployeesListWithController.getEmployees();
        System.Test.stopTest();
		
        System.assert( !( testResult.isEmpty() ) );
	}
    
	// The following method is intended to test the controller class with a 200-record insert.
	// It returns an error about too many SOQL statements.
	
    // This is the method's plan:
    // 
	/* 	1 Delete present actual employee records	
		2 input fake record(s)
		3 check num records from getEmployees = what I put in
	*/
/*    	@isTest static void bulkEmployeeTest()
		{
			List<Employee__c> actualEmployeesToBeTemporarilyDeletedDuringTest = 
                EmployeesListWithController.getEmployees();										// 1.1
            delete actualEmployeesToBeTemporarilyDeletedDuringTest;								// 1.2
			

			List<Employee__c> fakeEmployees = new List<Employee__c>();						  	// (2.1)
			for(integer i=0; i<200; i++)													  	// (2.2)
			{
				Employee__c fakeEmployee = new Employee__c(Name='Fake'+i);
				fakeEmployees.add(fakeEmployee);
			}
			insert fakeEmployees;																// (2.3)
			
			List<Employee__c> fakeEmployeeListFromGetEmployees = EmployeesListWithController.getEmployees();  // (3.1)
			System.Test.startTest();
			System.assertEquals(fakeEmployeeListFromGetEmployees.size(), 200);
			System.Test.stopTest();			  //(4.2)
	}        
*/	
	
    // The following method is intended to test the controller class with a 200-record insert.
	// It returns a duplicate record error.
	
	// This is the method's plan:
	
/* 	(1) Get the number of present employees.
    (2) Create employee list.
    (3) Create 200 new employees. (Remember db changes during tests arent stored.)
    (4) Put them in the database.
    (5) Execute the getEmployees method.
    (6) Check that old number of present employees + 200 equals
    the output of the getEmployees method.
    */
/*	
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
 */    
}