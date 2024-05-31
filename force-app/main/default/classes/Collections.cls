public with sharing class Collections {

    public void Collections(String[] param) {

        List<String> myList = new List<String>();
        myList.add('Parametro do tipo da minha lista');
        myList.add(0,'Primeira Posição');
        myList.add('dados 2');
        myList.add('dados 3');

        for (String s : myList) {
            System.debug(s);
        }

        if (!myList.isEmpty()) {
            System.debug('sua list não está vazia');
        }

        System.debug(myList.contains('Primeira Posição'));
        myList.remove(0);
        System.debug(myList.contains('Primeira Posição'));

        System.debug(myList.size());

        for (Integer i = 0; i < myList.size(); i ++) {
            System.debug('utilizando for ' + myList[i]);
        }

        Integer i = 0;
        While (i < myList.size()) {
            System.debug('utilizando while ' + myList[i]);
            i++;
        }

    }

public void mySetList(){
    Set<String> mySet = new Set<String>();
    mySet.add('Banana');
    mySet.add('Pera');
    mySet.add('Banana');
    
    System.debug(mySet);
    System.debug(mySet.contains('Banana'));
    System.debug(mySet.size());
    System.debug(mySet.isEmpty());

}

public void myMap(){
    Map<String,String> myMap = new Map<String,String>();
    
    myMap.put('Chave 1','Banana');
    myMap.put('Chave 2','Pera');
    myMap.put('Chave 3','Banana');

    System.debug(myMap.size());
    System.debug(myMap.isEmpty());
    
    System.debug(myMap);

    //System.debug(myMap.contains('Banana'));
    System.debug(myMap.containsKey('Chave 3'));

    if (myMap.containsKey('Chave 3')){
        System.debug('Valor já existe!');
    }
   
    System.debug(myMap.keySet());
    System.debug(myMap.values());

}

}