public with sharing class MathCalc {
    public MathCalc() {

        Calculator.CalculatorSoap calc = new Calculator.CalculatorSoap();
        Integer resultAdd = calc.Add(10,10);
        System.debug('10 + 10 = ' + resultAdd);
        system.assertEquals(resultAdd, 20);

        Integer resultDive = calc.Divide(10,5);
        System.debug('10 / 5 = ' + resultDive);
        system.assertEquals(resultDive, 2);
        
        Integer resultSub = calc.Subtract(10,5);
        System.debug('10 - 5 = ' + resultSub);
        system.assertEquals(resultSub, 5);
        
         Integer resultMulti = calc.Multiply(10,10);
        System.debug('10 * 10 = ' + resultMulti);
        system.assertEquals(resultMulti, 100);

    }
}