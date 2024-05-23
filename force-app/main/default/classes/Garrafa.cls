public virtual with sharing class Garrafa {
    protected String TipoDeRosca;

    public Garrafa() {
        TipoDeRosca = 'Padrão';
    }

    public virtual void abrirGarrafa() {
        System.debug(TipoDeRosca);
        if (TipoDeRosca== 'Padrão') {
            System.debug('Gire a tampa para a esquerda');            
        }
    }
}