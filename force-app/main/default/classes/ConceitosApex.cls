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
        NovoConceito('Aqui existe o conceito ed transient');
        System.debug(this.Oculto);
        System.debug(JSON.serialize(this));
    }

    public void testandoMetodo() {
        try {
           Integer x = 1234/0; 
       // } catch (Exception ex) {
    } catch (System.MathException ex) {
            System.debug(ex);            
     } finally {
        system.debug('Cheguei aqui');
      }
    }

    //Para criar a propria exceção de erro é necessário criar uma 
    //extensão classe Extension Padrao
    public class PizzaException extends Exception{}
}

//ConceitosApex c = new ConceitosApex();c.testandoMetodo();
//c.NovoConceito('ttt');