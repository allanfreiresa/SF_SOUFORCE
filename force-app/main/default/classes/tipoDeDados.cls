public with sharing class tipoDeDados {
    public tipoDeDados() {
        String euSouUmaString = 'Aqui vai um texto';
        System.debug(euSouUmaString);

        Boolean verdadeiroFalso = True;
        verdadeiroFalso = False;
        System.debug(verdadeiroFalso);

        Integer inteiro = -1; //-21474883648 até -21474883647
        System.debug(inteiro);

        Long longo = 15454545454L; // - 2^63 até (2^63) -1 // precisou acrescentar a letra "L" no final
        System.debug(longo);

        Decimal pontoFlutante = 1.63; // - 2^63 até (2^63) -1
        System.debug(pontoFlutante);

        Double pontoFlutanteD = 1.9999; // - 2^63 até (2^63) -1
        System.debug(pontoFlutanteD);

        Blob b = Blob.valueOf('Eu sou um blob');
        System.debug(b.toString());



    }
}