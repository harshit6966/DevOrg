public class OppDetailsDownExt {
    private final Opportunity opp;
    
    public OppDetailsDownExt(ApexPages.StandardController controller) {
        controller.addFields(new String[]{
            'StageName',
            'Name',
            'Amount',
            'Type'
        });
        this.opp = (Opportunity)controller.getRecord();
    }
    
	public String getStageName() {return opp.StageName;}
    
    public String getName() {return opp.Name;}
    
	public Decimal getAmount() {return opp.Amount;}
    
	public String getType() {return opp.Type;}    
    
    public String renderingService { get; set; }
    
    public PageReference downOppDetails() {
        renderingService = 'PDF';
        return null;
    }
}