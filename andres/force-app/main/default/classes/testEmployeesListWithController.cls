@istest(seeAllData='true') class TestEmployeesListWithController3
{	

    // This method positively tests the controller class for success with a single record insert.
    
    // This is the method's plan:
    // 1. Delete present employees records for duration of test.
    // 2. Insert one provisional employee record.
    // 3. Check that one employee record is returned by controller class.
     
  	@isTest static void singleEmployeeTest()
    {        
    	
        List<Employee__c> realEmployeesList = EmployeesListWithController.getEmployees(); 	// (1.1)
		System.Test.startTest();
        delete realEmployeesList;															// (1.2)
		System.Test.stopTest();
            
		Employee__c fakeEmployee = new Employee__c(Name='Fake', Phone_Number__c='1234567890', Zip_Code__c='12345');							// (2.1)        		
		insert fakeEmployee;																// (2.2)
        
        
		List<Employee__c> newEmployeeList = EmployeesListWithController.getEmployees();  	// (3.1)
        System.assertEquals(newEmployeeList.size(), 1);			  							// (3.2)
	} 

    // The following method positively bulk tests the controller class with a 200-record insert.	
	
    // This is the method's plan:	
	// (1) Get number of present employees.
    // (2) Create employee list.
    // (3) Create then add 200 new employees to that list. (Remember db changes during tests arent stored.)
    // (4) Put the records in the database.
    // (5) Execute the getEmployees method.
    // (6) Check that old number of present employees + 200 equals
    // number of members in list output by getEmployees method.
	
    @isTest static void bulkEmployeeTest()
    {        
    	List<Employee__c> realEmployeesList = EmployeesListWithController.getEmployees(); 	// (1.1)
		integer numOfRealEmployees = realEmployeesList.size();								// (1.2)
		
		List<Employee__c> fakeEmployees = new List<Employee__c>();						  	// (2.1)
		
       	for(integer i=0; i<200; i++)													  	// (3)
		{
			Employee__c fakeEmployee = new Employee__c(Name='Fake'+i, Phone_Number__c='1234567890',Zip_Code__c='12345');
            fakeEmployees.add(fakeEmployee);
		}
		
        System.test.startTest();
		insert fakeEmployees;																// (4)
        System.Test.stopTest();
        
		List<Employee__c> mixedEmloyeeList = EmployeesListWithController.getEmployees();  	// (5)
        		
		System.assertEquals(numOfRealEmployees+200, mixedEmloyeeList.size());			 	// (6)
	}            
    
}