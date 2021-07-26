public class EmployeesListWithController 
{
	public static List<Employee__c> getEmployees()   
    {
        List<Employee__c> results = new List<Employee__c>();
        
        try
        {
        	results = Database.query('SELECT Name, Phone_Number__c, City__c, Zip_Code__c FROM Employee__c ');            
        }
        catch(QueryException qe)
    	{
       		system.debug('Error occured: ' + qe.getMessage());
    	}
        return results;
    }	    
}