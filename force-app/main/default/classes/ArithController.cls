public class ArithController {
        Integer num1;
        Integer num2;
        Integer res;
        
    public ArithController() {
        num1 = 0;
        num2 = 0;
        res = 0;
    }
    
    public void setNum1(Integer n1) {
        num1 = n1;
    }
    
    public void setNum2(Integer n2) {
        num2 = n2;
    }
    
    public void setRes(Integer r) {
        res = r;
    }
        
    public String getRes() {
        return null;
    }


    public String getNum2() {
        return null;
    }


    public String getNum1() {
        return null;
    }


    public PageReference divide() {
        res = num1 / num2;
        return null;
    }


    public PageReference product() {
        res = num1 * num2;
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