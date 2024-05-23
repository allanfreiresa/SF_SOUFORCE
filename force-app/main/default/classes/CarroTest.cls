@IsTest
public with sharing class CarroTest {
    @IsTest
    public void CarroTest() {
        
        Carro carro = new Carro('Azul','SUV');
        System.debug(carro.Cor);
        System.debug(carro.getTipoCarroceria());        

    }
}