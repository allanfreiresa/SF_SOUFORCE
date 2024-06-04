@RestResource(UrlMapping='/fls/account/*')
global class FLSViolation {
    @HttpPost
    global static Id setAccount(String name, String phone){

    //Para tratar insercoes com acesso restrito
    Id AccountId;
    if(Schema.SObjectType.Account.fields.Phone.isCreateable()){
            //Inserir uma conta
            Account account = new Account(Name = name, Phone = phone);
            insert account;
        }else {
            RestContext.response.statusCode = 403;
        }
        return AccountId;
    }
}