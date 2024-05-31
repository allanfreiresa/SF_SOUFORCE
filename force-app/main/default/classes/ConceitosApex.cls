public with sharing class ConceitosApex {
    private String conceito = 'Conceito Apex';
    
    public ConceitosApex(String conceito) {
        this.conceito = conceito;           
    }

    public ConceitosApex() {
        //this('Novo');
        this.conceito = conceito;  
    }

    public void NovoConceito (String conceito){
        String NovoConceito = 'aaa';
        this.conceito = NovoConceito;
        System.debug(this.conceito);
    }

    public void showConceito() {
        System.debug(this.conceito);
    }

}

ConceitosApex c = new ConceitosApex();
c.showConceito();
//c.NovoConceito('ttt');