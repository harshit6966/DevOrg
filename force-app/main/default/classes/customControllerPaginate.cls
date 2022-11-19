public class customControllerPaginate {
    public customControllerPaginate (ApexPages.StandardSetController controller) {}

    public ApexPages.StandardSetController controller {set;get;}
    public List<Account> getAcc(){
        List<Account> accnt=(List<Account>) controller.getRecords();
        return accnt;
    }
    public customControllerPaginate(){
        List<Account> accnt=[SELECT Name, Phone, BillingState, ShippingState FROM Account];
        controller=new Apexpages.StandardSetController(accnt);
        controller.setPageSize(5);
    }

}