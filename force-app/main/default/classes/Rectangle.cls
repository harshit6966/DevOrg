public class Rectangle {
	//data members
	////features used to identify the class
	//datatype name
	private Integer length;
    private Integer breadth;
    //member Methods
    /*return_type methodName(dt n1, dt n2, dt n3, ... ) {
        
    }*/
    //Default constructor
    public Rectangle() {
        length = 0;
        breadth = 0;
    }
    //Parameterized constructor
    public Rectangle(Integer len, Integer bth) {
        length = len;
        breadth = bth;
    }
    //Input
    public void setValues(Integer len, Integer bth) {
        length = len;
        breadth = bth;
    }
    //action
    public Integer area() {
       Integer ar = length*breadth;
        return ar;
    }
    
    public Integer perimeter() {
        Integer pm = 2 * (length + breadth);
        return pm;
    }
    //output
    public void getValues() {
        System.debug('Length = ' + length);
        System.debug('Breadth = ' + breadth);
    }
}