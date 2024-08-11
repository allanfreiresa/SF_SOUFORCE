import { LightningElement, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'
import { loadScript } from 'lightning/platformResourceLoader';
import pubsubLib from '@salesforce/resourceUrl/PubSub';
import {CurrentPageReference} from 'lightning/navigation';
//import { NavigationMixin } from 'lightning/navigation';



//export default class ToastOptions extends NavigationMixin(LightningElement) {
    export default class ToastOptions extends LightningElement {

    variants = [
        { label: 'Info', value: 'info' },
        { label: 'Success', value: 'success' },
        { label: 'Warning', value: 'warning' },
        { label: 'Error', value: 'error' }
    ]

    modes = [
        { label: 'Dismissable', value: 'dismissable' },
        { label: 'Pester', value: 'pester' },
        { label: 'Sticky', value: 'sticky' }
    ]

    variant = 'info';
    mode = 'dismissable'

     @wire(CurrentPageReference) pageRef;   


    connectedCallback() {
        loadScript(this, pubsubLib).then(() => {
            window.console.log('PubSub Carregado com sucesso!!!')
        }).catch(error => {
            window.console.log(error);
        })
    }

    handlerVariantChanged(event) {
        this.variant = event.detail.value;

           window.pubsub.fireEvent(this.pageRef, 'selectedVariant',{
            detail: {
                variant: this.variant
            }            
         });

    }

    disconnectedCallback() {
        window.pubsub.unregisterAllListeners(this);

    }


    handlerModeChanged(event) {
        this.mode = event.detail.value;

    }


    handlerToastChanged(event) {
        const toast = new ShowToastEvent({
            "title": "Titulo do Toast",
            "message": "mensagem",
            "variant": this.variant,
            "mode": this.mode
        });

        this.dispatchEvent(toast);
    }

}