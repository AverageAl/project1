trigger TriggerEmployee on Employee__c (before insert, after insert) {
    
    
    switch on Trigger.operationType {
        when BEFORE_INSERT{
            // check to see if the employee name already exists with the same phone number (in case there are two people with the same name)
            TriggerEmployeeHelper.checkForDuplicateEmployees(Trigger.New);
        } when AFTER_INSERT{
            // I want to be able to give the number of lots the employee works for
        	// for now I will keep it at 1 trigger per object since it is best practice to do so

            
        } 
    }
    

    
}