public class TriggerEmployeeHelper {
    
    public static void checkForDuplicateEmployees(List<Employee__c> employeeList){
        //List<Employee__c> allEmployees = [SELECT Name, Phone_Number__c FROM Employee__c];
        for(Employee__c employee : employeeList){
            String employeeName = employee.Name;
            String employeePhone = employee.Phone_Number__c;
            List<Employee__c> allEmployees = [SELECT Name, Phone_Number__c FROM Employee__c WHERE Name=:employeeName AND Phone_Number__c=:employeePhone];
            if(allEmployees.size() != 0){
                employee.addError('The details of this employee have already been stored.');
            }
            
        }
    }

}