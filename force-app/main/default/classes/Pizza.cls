public abstract with sharing class Pizza {
    private Integer QuantidadeDeSabores{get;set;}


    public Pizza (Integer quantidadeDeSabores) {
        this.QuantidadeDeSabores = quantidadeDeSabores;
    }

    public abstract List<String> ingredientes();

    public void prepararPizza(){
        for(String ingrediente : ingredientes() ) {
            System.debug(ingrediente);
        }
    }
}