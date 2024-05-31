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

}

//ConceitosApex c = new ConceitosApex();c.showConceito();
//c.NovoConceito('ttt');