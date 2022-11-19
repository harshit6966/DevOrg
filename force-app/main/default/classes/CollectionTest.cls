@isTest
public class CollectionTest {
	@isTest
    public static void anyName() {
        //List
        //Create
        List<String> stud_names = new List<String>();
        List<Integer> marks = new List<Integer>();
        //Add
        marks.add(10);
        marks.add(50);
        marks.add(20);
        marks.add(80);
        marks.add(60);
        //Delete
        //Traverse
        System.debug('Marks of the student are: ' + marks);
        for( Integer value : marks ) {
           System.debug(value); 
        }
        
        //Set
        //Create
        Set<Integer> pincodes = new Set<Integer>();
        //Add
        pincodes.add(200087);
        pincodes.add(800020);
        pincodes.add(800001);
        pincodes.add(300087);
        pincodes.add(500067);
        //Delete
        //Traverse
        System.debug('Pincodes in India are: ' + pincodes);
        for( Integer pin : pincodes) {
            System.debug('Pincode : ' + pin);
        }
        
        //Map
        //Create
        Map<String,Integer> topic_pg = new Map<String,Integer>(); 
        //Add
        topic_pg.put('Apex', 234);
        topic_pg.put('Java', 442);
        topic_pg.put('Workflow', 870);
        topic_pg.put('OOD', 587);
        topic_pg.put('Exception Handling', 389);
        //Delete
        //Traverse    
        System.debug('Topics and pages in the book are: ' + topic_pg);
        Set<String> topics = topic_pg.keyset();
        for(String topic : topics){
            //map.keySet();
        }
        List<Integer> pages = topic_pg.values();
        for(Integer page : pages){ 
        	//map.values();
        }
        /*for (String topic : topic_pg.keySet()){
            System.debug('Topic name is ' + topic);
        }*/
    }
}