// Controller Extension for HelloWorldUsers
public with sharing class HelloWorldUsers_ConExt {
    // Field to bind to the inputText component
 	public String testField {public get; public set;}
     
	// Simple contructor
	public HelloWorldUsers_ConExt(ApexPages.StandardSetController stdController) {
	}
     
	// Method called by the actionFunction on the HelloWorldUsers page
	public PageReference fieldUpdate() {
    System.debug('=============>>> testField: '+testField);
		// return null to keep us on the page
	   	return null;
	}
}