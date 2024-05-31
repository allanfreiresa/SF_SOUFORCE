public with sharing class ConceitosApex {
    private String conceito = 'Conceito Apex';

    public transient String Oculto;
    public String Visivel;
    
    public ConceitosApex(String conceito) {
        this.conceito = conceito;           
    }

    public ConceitosApex() {
        this('Novo');
        //this.conceito = conceito;  
    }

    public void NovoConceito (String conceito){
        //String NovoConceito = 'aaa';
        //this.conceito = NovoConceito;
        this.conceito = conceito;
        this.Oculto = 'x';
        this.Visivel = 'y';
        //System.debug(this.conceito);
    }

    public void showConceito() {
        //chamar outro metodo nesse metodo
        NovoConceito('Aqui existe o conceito de transient');
        System.debug(this.Oculto);
        System.debug(JSON.serialize(this));
    }

    public void fazerPizza(Object pizza) {
        Boolean isPizza = pizza instanceof Pizza;

        if (!isPizza){
            throw new PizzaException('Isso não é uma pizza.');
        }else{
            ((Pizza)pizza).prepararPizza();
        }

    }

    public void testandoMetodo() {
        //String pizza = 'Portuguresa';
      Portuguesa pizza = new Portuguesa();
      fazerPizza(Pizza);
    }

    //Para criar a propria exceção de erro é necessário criar uma 
    //extensão classe Extension Padrao
    public class PizzaException extends Exception{}
}

//ConceitosApex c = new ConceitosApex();c.testandoMetodo();
//c.NovoConceito('ttt');