public class AccountControllerExtension {

    public  List<Contact> listContact {get;set;}
    public Account account {get;set;}
    
    public AccountControllerExtension(ApexPages.StandardController standardController) {
        this.account = standardController.getRecord() == null ? new Account(): (Account) standardController.getRecord();
        this.listContact = new List<Contact>();
        //this.account = new Account();

        if(this.account.Id != null){
            //this.account = [Select Id, Name, Phone, Type, Industry From Account Where Id =:this.account.Id];
            this.listContact = [Select Id, Name, FirstName, LastName, Email From Contact Where AccountId =: this.account.Id];
        }
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

        upsert this.listContact;
        ApexPages.StandardController controller = new ApexPages.StandardController(account);
        return controller.view();

    }

}