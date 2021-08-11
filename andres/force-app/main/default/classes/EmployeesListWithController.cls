public class EmployeesListWithController
{
	public static List<Employee__c> getEmployees()   
    {
        List<Employee__c> results = new List<Employee__c>();
        
        results = Database.query('SELECT Name, Phone_Number__c, City__c, Zip_Code__c FROM Employee__c ');            
        
        if (results.size()==0){
        	throw new EmployeeException('Help Wanted--drive in and get hired in!');      
        }else return results;
    }	    
}