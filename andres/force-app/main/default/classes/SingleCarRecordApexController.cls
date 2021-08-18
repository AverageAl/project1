public with sharing class SingleCarRecordApexController {

    @AuraEnabled
    public static Vehicle__c vehicleWithEmployeeInfo(Id recordId){
        return [SELECT Name, Price__c, Type__c, Year__c, Transmission__c, Mileage__c, Listed_As__c, Image__c, Lot__r.Employee__r.Name, Lot__r.Employee__r.Phone_Number__c, Lot__r.Employee__r.Email__c
                FROM Vehicle__c 
                WHERE Id = :recordId];
    }
    
    /*@AuraEnabled
    public static void sendEmail(){	//taken from MassInventoryExtension.apxc
        try{
            insert email;
            email = new EmailMessage();
        } catch(DmlException e) {
            System.debug('The following error has occured: ' + e.getMessage());
        } 
    }*/
}