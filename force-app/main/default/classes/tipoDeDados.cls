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

        Object obj = false;
        System.debug(obj);
        Boolean euSouUmaString1 = obj  instanceof Boolean;
        System.debug(euSouUmaString1);

        Date d = Date.today();
        Date d2 = Date.today().addDays(-45);
        System.debug(d);
        System.debug(d.dayOfYear());
        System.debug(d2);
        System.debug(d2.daysBetween(d));

        Date dx = d.toStartOfMonth();
        System.debug(dx);

        Datetime dt = Datetime.now();
        System.debug(dt);
        System.debug(dt.getTime());
        System.debug(dt.time());
        System.debug(dt.timeGmt());
        Time dTime = dt.time();
        System.debug(dTime);

        Time myTime = Time.newInstance(18, 30, 2, 20);
        System.debug(myTime);

        Enum Season {WINTER, SPRING, SUMMER, FALL}
        System.debug(Season.WINTER);

        Season mySeason = Season.SUMMER;
        for (Season s : Season.values()){
            System.debug(s);
        }

        System.debug(mySeason);

        Account a = new Account();
        a.Name = 'TESTE';
        insert a;

        Id aId = a.Id;
        System.debug(aId);


    }
}