trigger TriggerVehicle on Vehicle__c (before insert, before update) {

    //if(Trigger.operationType.equals('BEFORE_INSERT')){
        TriggerVehicleHelper.checkForNegativeValues(Trigger.New);
       
    
}