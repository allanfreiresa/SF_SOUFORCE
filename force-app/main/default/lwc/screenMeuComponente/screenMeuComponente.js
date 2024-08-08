import { LightningElement } from 'lwc';

export default class ScreenMeuComponente extends LightningElement {


    handlerEventClick(event){

        window.console.log(event.detail.value);
        window.console.log(event.detail.data);

    }
}