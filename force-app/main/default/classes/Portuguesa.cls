public with sharing class Portuguesa extends Pizza{
    public Portuguesa(){       
        super(3);
    }
    public override List<String> ingredientes() {
        return new List<String> {'Milho','Ovo','Cebola'};
    }
}