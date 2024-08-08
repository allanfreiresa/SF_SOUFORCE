import { LightningElement, api, track, wire } from 'lwc';
import getDado from '@salesforce/apex/LookupFieldController.getObjectDetails';

export default class CardTicketLwc extends LightningElement {

@api recordId;
@api objectApiName;

@track mensagem;
@track data; //usar quando quiser tratar algum campo ou erro 

@wire(getDado,{ObjectName: '$objectApiName' })
//record; usar quando quiser utilizar o wire

//nome de função criada para o track para tratamento de erro ou campo
recordNew({error, data}){
    if(error){
        window.console.log(error);
    }else {
        this.data = data;
    }
}
    connectedCallback(){
        window.console.log(this.recordId);
        this.mensagem = 'Olá mundo';
        window.console.log('apos ola mundo');
        //Outra forma seria pegar o metodo direto
        getDado({ObjectName: this.objectApiName}).then (result => {
            window.console.log('entrou na funcao getdado');
            window.console.log(result);
        }).catch(error => {
            window.console.log('deu ruim');
            window.console.log(error);
        });
    }

    handlerClick (event){
        this.mensagem = 'Voce clicou no botão';           
    }

}