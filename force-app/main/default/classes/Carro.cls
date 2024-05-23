public with sharing class Carro {

    public Integer CapacidadeDoTanque {get;set;}
    public Integer TamanhoDaRoda {get;set;}
    private String TipoDeCarroceria {get;set;}
    public Decimal PotenciaDoMotor {get;set;}
    public String Cor {get;set;}

    public Carro(String cor, String tipoDeCarroceria) {
        this.Cor = cor;
        this.TipoDeCarroceria = tipoDeCarroceria;
    }

    public String getTipoCarroceria (){
        return this.TipoDeCarroceria;
    }
    
}