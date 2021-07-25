public class EmployeesListWithController {
	public static List<Employee__c> getEmployees() {
		List<Employee__c> results = Database.query(
			'SELECT Name, Phone_Number__c, City__c, Zip_Code__c FROM Employee__c '
		);
    return results;
	}
}