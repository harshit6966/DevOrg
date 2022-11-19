public with sharing class ConverterPgController {

    public Integer num1 { get; set; }
    
    public Integer num2 { get; set; }

    public Integer res { get; set; }
    
    public PageReference degreeToCelcius() {
        return null;
    }
    
    public PageReference mphToKmph() {
        return null;
    }
    
    public PageReference kmphToMph() {
        return null;
    }

    public PageReference meterToCentimeter() {
        res = num1/100;  
        return null;
    }

}