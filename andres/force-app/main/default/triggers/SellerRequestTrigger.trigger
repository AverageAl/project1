trigger SellerRequestTrigger on Seller_Request__c (after insert) {
    for (Seller_Request__c sr : Trigger.New) {
            Approval.ProcessSubmitRequest request = new Approval.ProcessSubmitRequest();
            request.setObjectId(sr.Id);
        	Approval.ProcessResult result = Approval.Process(request);
    } 
}