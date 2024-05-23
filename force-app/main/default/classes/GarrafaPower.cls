public with sharing class GarrafaPower extends Garrafa{
    public GarrafaPower() {
        TipoDeRosca = 'Inversa';
    }

    public override void abrirGarrafa() {
        System.debug('Pressione a tampa');
        System.debug('Gire a tampa paras a direita');

    }


}