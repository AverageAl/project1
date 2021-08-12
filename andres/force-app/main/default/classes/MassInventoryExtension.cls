public class MassInventoryExtension {
    public Id vehicleId{get;set;}
    public Vehicle__c v{get;set;}
    public EmailMessage email{get;set;}
    public Decimal monthlyPrice{get{
        return monthlyPrice.setScale(2);
    }set;}
    
    public MassInventoryExtension(ApexPages.StandardSetController ssc){
        email = new EmailMessage();
    }
    
    public PageReference vehicleDetail(){
        //System.debug(vehicleId);
        v = [SELECT Id, Listed_As__c, Year__c, Name, Image__c, Type__c, Mileage__c, Transmission__c, Price__c, Lot__r.Name, Lot__r.Employee__r.Name, Lot__r.Employee__r.Phone_Number__c FROM Vehicle__c WHERE Id =: vehicleID];
        monthlyPrice = v.Price__c / 72;
        return Page.SingleCarRecordPage;
    }
    
    public PageReference massInventory(){
        return Page.MassInventory;
    }
    
    public void sendEmail(){
        try{
            insert email;
            email = new EmailMessage();
        } catch(DmlException e) {
            System.debug('The following error has occured: ' + e.getMessage());
        } 
    }
}