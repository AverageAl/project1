@isTest
public class SingleCarRecordPageTests {

    @isTest
    static void testSendEmptyEmail(){
        SingleCarRecordExtension scre = new SingleCarRecordExtension(new ApexPages.StandardController(new Vehicle__c()));
        scre.sendEmail();
        System.assertEquals(1, [SELECT COUNT() FROM EmailMessage]);
    }
    
    @isTest
    static void testSendPopulatedEmail(){
        SingleCarRecordExtension scre = new SingleCarRecordExtension(new ApexPages.StandardController(new Vehicle__c()));
        scre.email.TextBody = 'Message Text';
        scre.email.FromName = 'Test Name';
        scre.email.FromAddress = 'name.test@test.com';
        scre.sendEmail();
        System.assertEquals(1, [SELECT COUNT() FROM EmailMessage]);
    }
    
    @isTest
    static void testSendMultipleEmails(){
        SingleCarRecordExtension scre = new SingleCarRecordExtension(new ApexPages.StandardController(new Vehicle__c()));
        for(Integer i = 0; i < 10; i++){
        	scre.sendEmail();
        }
        System.assertEquals(10, [SELECT COUNT() FROM EmailMessage]);
    }
    
}