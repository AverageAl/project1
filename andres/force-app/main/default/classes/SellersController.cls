public class SellersController {
    
    
	Public Seller_Request__c request; 
    public SellersController(ApexPages.StandardController controller) {
		this.request = (Seller_Request__c)controller.getRecord();
    }
   
     public PageReference save(){
       
        upsert request;
      
        PageReference reRend = new PageReference('https://simonsauto-developer-edition.na162.force.com/SimonsAutos/s/');
        reRend.setRedirect(true);
        return reRend;
    }


}