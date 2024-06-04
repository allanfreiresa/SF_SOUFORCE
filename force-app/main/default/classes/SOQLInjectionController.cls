public class SOQLInjectionController {
   
    //public List<Account> accounts {get;set;}
    public List<AccountWrapper> accounts {get;set;}
    public String inputName {get;set;}
    public String error {get;set;}    

    public SOQLInjectionController(){
        //accounts = new List<Account>();
        accounts = new List<AccountWrapper>();
                
    }

    public PageReference searchAccounts(){
        //Dessa forma é possivel incluir de forma maldoso outros filtro dentro do espaço de pesquisa
        //String query = 'Select Id, Name , Phone From Account Where Name like \'%' + this.inputName + '%\'';

        //Neste caso com escapeSingleQuotes não é possivel mais usar o filtro de forma maldosa
         String query = 'Select Id, Name , Phone From Account Where Name like \'%' + String.escapeSingleQuotes(this.inputName) + '%\'';
        
        //System.debug(query);
         try {            
            //accounts = Database.query(query);
            for (Account acc : Database.query(query)){
                accounts.add(new AccountWrapper(acc));
            }
            
            //Da forma abaixo não é possivel mais incluir filtros malicioso além dos definidos nessa query
            //accounts = [SELECT Id, Name, Phone from Account where Name like : '%' + this.inputName + '%'];
            
        } catch (Exception e) {
            error = e.getMessage();
        }
        return null;        
    }

    //Com essa classe wrapper, é possivel liberar acesso independente do perfil
    public class AccountWrapper{
        public Account acc;

        public AccountWrapper(Account acc){
            this.acc = acc;
        }

        public String AccName{
            get{
                //return acc.Name;
                //para se ter mais segurança vamos utilizar o Schema.SObjectType
                return Schema.SObjectType.Account.fields.Name.isAccessible() ? acc.Name : '' ;
            }
        }

        public String AccPhone{
            get{
                //return acc.Phone;
                return Schema.SObjectType.Account.fields.Phone.isAccessible() ? acc.Phone : '' ;
            }
        }

    }

}