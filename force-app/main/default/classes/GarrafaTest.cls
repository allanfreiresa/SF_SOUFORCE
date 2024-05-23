@IsTest
public with sharing class GarrafaTest {
    @IsTest
    public static void garrafaSimples() {
        GarrafaSimples gs = new GarrafaSimples();
        gs.abrirGarrafa();     
    }

    @IsTest
    public static void garrafaPower(){
        GarrafaPower gp = new GarrafaPower();
        gp.abrirGarrafa();
    }

}