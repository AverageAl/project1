public class TriggerLotHelper {
    public static void checkForLotValue(List<Lot__c> lotList){
        for(Lot__c lot : lotList){
            if(lot.Lot_Value__c == 0){
                lot.addError('the Lot currently contains 0 vehicles. Please add vehicles to the empty Lot.');
            }
        }
    }
}