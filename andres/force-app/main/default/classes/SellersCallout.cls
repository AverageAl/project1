public class SellersCallout {
	StaticResource sr = [SELECT Id, body FROM StaticResource WHERE Name = 'cars' LIMIT 1];
	String body = sr.Body.toString();
    

}