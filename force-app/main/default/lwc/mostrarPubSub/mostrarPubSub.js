import { LightningElement, wire, track} from 'lwc';
import {loadScript} from 'lightning/platformResourceLoader';
import pubsubLib from '@salesforce/resourceUrl/PubSub';
import {CurrentPageReference} from 'lightning/navigation';

export default class MostrarPubSub extends LightningElement {

    @wire(CurrentPageReference) pageRef;
    @track variant;

    connectedCallback(){
        loadScript(this, pubsubLib).then(()=>{
            window.console.log('PubSub Carregado com sucesso!!!')
            window.pubsub.registerListener('selectedVariant', this.handlerPubSub, this)
        }).catch(error => {
            window.console.log(error);
        })        
    }

    handlerPubSub(event){
        this.variant = event.detail.variant;
    }

    disconnectedCallback(){
        window.pubsub.unregisterAllListeners(this);
    }
}