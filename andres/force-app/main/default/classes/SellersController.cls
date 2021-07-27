public class SellersController {
    
    
    public Seller_Request__c sr { get; set;}
    public List<SelectOption> modelYears{get{
        List<Schema.PicklistEntry> sources = Schema.SObjectType.Seller_Request__c.Fields.Model_year__c.getPicklistValues();
        modelYears = new List<SelectOption>();
        for(Schema.PicklistEntry pe: sources){
            modelYears.add(new SelectOption(pe.getValue(), pe.getLabel()));
        }
        return modelYears;
    } set;}
    public List<SelectOption> carBrands{get{
        List<Schema.PicklistEntry> sources = Schema.SObjectType.Seller_Request__c.Fields.Car_Brand__c.getPicklistValues();
        carBrands = new List<SelectOption>();
        for(Schema.PicklistEntry pe: sources){
            carBrands.add(new SelectOption(pe.getValue(), pe.getLabel()));
        }
        return carBrands;
    } set;}
    
        
    public SellersController(){
        this.sr = new Seller_Request__c();
        }
    
    public void saveSellerRequest(){
        insert this.sr;
    }


}