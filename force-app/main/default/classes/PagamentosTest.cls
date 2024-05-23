@IsTest
public with sharing class PagamentosTest {
    @IsTest
    public static void  PagamentoCartao() {
        PagamentoCartao pc = new PagamentoCartao();
        Decimal troco = pc.cobrar(150, 150);    
        System.assertEquals(0,troco);
    }

    @IsTest
    public static void  PagamentoDinheiro() {
        PagamentoDinheiro pd = new PagamentoDinheiro();
        Decimal troco = pd.cobrar(150, 200);    
        System.assertEquals(50,troco);
        System.assertNotEquals(0,troco);
       // System.assertNotEquals(0,troco);

    }

    @IsTest
    public static void pagamento() {
        IPagamento ip = new PagamentoDinheiro();
        Decimal troco = ip.cobrar(200, 210);        
        System.assertEquals(10, troco);
    }

    @IsTest
    public static void pagamentoDinamico() {
        Decimal trocoDinheiro = receber(new PagamentoDinheiro(),150,200);
        System.assertEquals(50, trocoDinheiro);

        Decimal trocoCartao = receber(new PagamentoCartao(),150,150);
        System.assertEquals(0, trocoCartao);

    }

    public static Decimal receber(IPagamento pagamento, Decimal valorCompra, Decimal valorPago) {
        return pagamento.cobrar(valorCompra, valorPago);
    }

}