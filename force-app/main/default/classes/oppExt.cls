public class oppExt {
	
    private final Opportunity opp;
    
    public oppExt(ApexPages.StandardController stdController) {
        stdController.addFields(new String[]{
			'Name',
			'CreatedDate'
		});
        this.opp = (Opportunity)stdController.getRecord();
    }
    
    public String getMessage() {
        return 'Hello ' + opp.Name + ', This record has been created on - ' + opp.CreatedDate;
    }
}