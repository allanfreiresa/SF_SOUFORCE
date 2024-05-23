public interface IPagamento {
    Decimal cobrar(Decimal valorCompra, Decimal valorPago);    
}