public class SingleCarRecordExtension {
    
    public Vehicle__c vehicle{get; set;}
    public EmailMessage email{get; set;}
    
    public SingleCarRecordExtension(ApexPages.StandardController sc){
        vehicle = (Vehicle__c) sc.getRecord();
        email = new EmailMessage();
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