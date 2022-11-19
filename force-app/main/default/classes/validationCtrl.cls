public class validationCtrl{
    public String email { get; set; }
    public String password { get; set; }
    
    public void checkEmailAndPassword(){
        if(Pattern.matches('[a-zA-Z0-9._-]+@[a-zA-Z]+.[a-zA-Z]{2,4}[.]{0,1}[a-zA-Z]{0,2}', email)) {
            ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.INFO , 'Email validated'));
        }
        else {
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, 'Check your email'));
        }
        if(Pattern.matches('^(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}$', password)) {
            ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.INFO , 'Password validated'));
        }
        else {
            ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR, 'Password should be 8 characters long and must have 1 capital, 1 number and 1 special character'));
        }
    }
}