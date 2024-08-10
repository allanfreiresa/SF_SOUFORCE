    import { LightningElement } from 'lwc';
import { ShowToastEvent} from 'lightning/platformShowToastEvent'

export default class ToastOptions extends LightningElement {

    variants = [
        {label: 'Info', value: 'info'},
        {label: 'Success', value: 'success'},
        {label: 'Warning', value: 'warning'},
        {label: 'Error', value: 'error'}
    ]

    modes = [
        {label: 'Dismissable', value: 'dismissable'},
        {label: 'Pester', value: 'pester'},
        {label: 'Sticky', value: 'sticky'}
    ]

    variant = 'info';
    mode = 'dismissable'

    handlerVariantChanged(event){
        this.variant = event.detail.value;

    }


    handlerModeChanged(event){
        this.mode = event.detail.value;
        
    }


    handlerToastChanged(event){
        const toast = new ShowToastEvent({
            "title":"Titulo do Toast",
            "message":"mensagem",
            "variant":this.variant,
            "mode":this.mode
        });

        this.dispatchEvent(toast);        
    }



}