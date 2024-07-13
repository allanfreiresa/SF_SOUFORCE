public class ViewAccountDetailController {

    Id accountId;
    public List<Contact> listContact {get;set;} 
    public Boolean isEditMode {get;set;} 

    public ViewAccountDetailController(ApexPages.StandardController standardController) {
        this.accountId = standardController.getId();
        this.listContact = getContacts();
        this.isEditMode = false;
     
    }

    public List<Contact> getContacts(){
        return [Select Id, Name, FirstName, LastName, Email From Contact Where AccountId =: this.accountId];
    }

    public PageReference newContact(){
        this.listContact.add(new Contact(AccountId = this.accountId));
        return null;
    }

    public PageReference deleteContact(){

        String index = ApexPages.currentPage().getParameters().get('index');

        Contact con = this.listContact.remove(Integer.valueOf(index));

        If(con.Id != null){
          delete con;
        }

        return null;
    }

    public PageReference editContacts(){
        this.isEditMode = true;
        return null;
    }

    public PageReference saveContacts(){

        upsert this.listContact;
        this.isEditMode = false;

        return null;
    }
}