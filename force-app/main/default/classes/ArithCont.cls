public with sharing class ArithCont {
    public Integer res { get; set; }

    public Integer num2 { get; set; }

    public PageReference product() {
        res = num1 * num2;
        return null;
    }


    public Integer num1 { get; set; }

    public PageReference divide() {
        res = num1 / num2;
        return null;
    }


    
    public PageReference minus() {
        res = num1 - num2;
        return null;
    }


    public PageReference addition() {
        res = num1 + num2;
        return null;
    }
}