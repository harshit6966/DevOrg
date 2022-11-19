@isTest
public class RectangleTest {
    /*static testMethod void main() {
        System.debug('First Test Method');
        //create object
        //ClassName object = new ClassName()
        Rectangle box = new Rectangle();
        box.getValues();
        box.setValues(10,20);
        box.getValues();
        Rectangle wall = new Rectangle(25, 10);
        wall.getValues();
    }*/
    static testMethod void anyName2() {
        System.debug('Second Test Method');
        //create object
        //ClassName object = new ClassName()
        Rectangle box = new Rectangle();
        box.getValues();
        box.setValues(11,22);
        box.getValues();
        Rectangle wall = new Rectangle(10, 40);
        wall.getValues();
        
        Integer ar_wall = wall.area();
        System.debug('Wall area is: ' + ar_wall);
        Integer pm_box = box.perimeter();
        System.debug('Perimeter of box ' + pm_box);
    	System.assertEquals(400, ar_wall, 'Wrong Formula');
        System.debug('Area of wall is ' + ar_wall);
    }
}