import { LightningElement } from 'lwc';

export default class TicketManagerLwc extends LightningElement {

    constructor(){
        super();
        window.console.log('Eu sou um construtor');
    }

    connectedCallback(){
        window.console.log('Eu sou connected Callback');
    }

    errorCallback(error, stack){
       
        window.console.log(error);
        window.console.log(stack);
    }

    rende(){
        window.console.log('Eu sou o hender');    
    }

    renderedCallback(){
        if(!this.hasLoaded){
            window.console.log('Eu sou rendered Callback');
            this.hasLoaded=true;
        }
    }    

    disconnectedCallback() {
        window.console.log('componente morreu');
        }


    handlerClick(event){
        const e = new CustomEvent('buttonclick',{
            detail: {value:1,data:2}
        });

        this.dispatchEvent(e);
    }
}