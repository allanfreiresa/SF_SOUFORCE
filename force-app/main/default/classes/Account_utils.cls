public class Account_utils {

    public void getAccount(String Nome, String Telefone){

        Account Acc = new Account();
        Acc.Name = Nome;
        Acc.Phone = Telefone;   
        
        insert Acc;
    } 
   
}