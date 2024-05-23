public with sharing class PagamentoDinheiro implements IPagamento {
    public PagamentoDinheiro() {

    }

    public Decimal cobrar(Decimal valorCompra, Decimal valorPago) {
        //Regra de negocio de pagamento        
        return  valorPago - valorCompra ;       
    }

}