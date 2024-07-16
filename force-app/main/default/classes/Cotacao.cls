public with sharing class Cotacao {
    
    public String code;  //Moeda de Origem
    public String codein; //Moeda de Destino
    public String name; //Nome da Moeda
    public String high; //Maior preço do dia
    public String low; //Menor preço do dia
    public String varBid; //Variação monetária
    public String pctChange; //Percentual de Variação
    public String bid; //Valor da Compra
    public String ask; //Valor da Venda
    public String timestamp; //Data da Cotação em Timestamp
    public String create_date; //Data da Cotação

    public static List<Cotacao> parse(String jsonString){
        return (List<Cotacao>)JSON.deserialize(jsonString, List<Cotacao>.class);
    }
}
