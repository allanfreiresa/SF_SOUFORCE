public class AccountControllerExtension {

    public  List<Contact> listContact {get;set;}
    public Account account {get;set;}
    
    public AccountControllerExtension(ApexPages.StandardController standardController) {
        this.listContact = new List<Contact>();
        //this.listContact = [SELECT ID, NAME FROM CONTACT WHERE AccountId =: standardController.getId()];
        this.account = new Account();
     }

    public PageReference addContact(){
        this.listContact.add(new Contact());

        return null;
    }

    public PageReference deleteContact(){
        String index = ApexPages.currentPage().getParameters().get('index');
        this.listContact.remove(Integer.valueOf(index));

        return null;
    }

    public PageReference saveAccount(){
        upsert account;
   
        for(Contact contact: this.listContact ){
            contact.AccountId = account.Id;
        }

        insert this.listContact;
        ApexPages.StandardController controller = new ApexPages.StandardController(account);
        return controller.view();

    }

}