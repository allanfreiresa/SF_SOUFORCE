public with sharing class PizzaQuatroQueijos extends Pizza {
    public PizzaQuatroQueijos(){
        super(4);
    }
    public override List<String> ingredientes(){
        return new List<String> {'Mussarela','Provole','Gorgonzola','Parmesão'};
    }
}