public class JobApexController {

    /*
     * inorder to make an apex method that we can call from a Js controller we need it to be public static and have the @AuraEnabled annotation above it
     */
    
    @AuraEnabled
    public static List<Open_Position__c> getMyOpenPositions(){
        //checking if athe user can access the case
        
        if(!Schema.SObjectType.Open_Position__c.isAccessible()){
            throw new AuraHandledException('You cannot access the Open Position object.');
        }
        
        List<Open_Position__c> openPositions = [SELECT Id, Job_Title__c	, Job_Description__c, salary__c  
                                                FROM Open_Position__c WHERE status__c='Open'];
        
        return openPositions;
    }
    
}