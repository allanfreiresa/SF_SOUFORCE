@IsTest
public with sharing class PizzaTest {
    public void PizzaPortuguesa() {
        Portuguesa p = new Portuguesa();
        p.prepararPizza();                  
        }

    public void PizzaQuatro() {        
        PizzaQuatroQueijos p4 = new PizzaQuatroQueijos();        
        p4.prepararPizza();
    }
   

}