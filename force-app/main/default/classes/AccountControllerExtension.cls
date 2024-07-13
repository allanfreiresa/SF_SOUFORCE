public class AccountControllerExtension {

    public  List<Contact> listContact {get;set;}
    List<Contact> listContactToDelete;
    public Account account {get;set;}

    
    public AccountControllerExtension(ApexPages.StandardController standardController) {
        this.account = standardController.getRecord() == null ? new Account(): (Account) standardController.getRecord();
        this.listContact = new List<Contact>();
        this.listContactToDelete = new List<Contact>();
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

        Contact con = this.listContact.remove(Integer.valueOf(index));

        If(con.Id != null){
            listContactToDelete.add(con);
        }

        return null;
    }

    public PageReference saveAccount(){
        upsert account;   

        for(Contact contact: this.listContact ){
            contact.AccountId = account.Id;
        }

        upsert this.listContact;

        if(!listContactToDelete.isEmpty()){

            delete this.listContactToDelete;
        }

        ApexPages.StandardController controller = new ApexPages.StandardController(account);

        return controller.view();

    }

}