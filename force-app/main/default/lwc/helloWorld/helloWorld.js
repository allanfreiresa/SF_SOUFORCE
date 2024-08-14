import { LightningElement } from 'lwc';
export default class HelloWorld extends LightningElement {
        greeting = 'World';//evento ok
        changeHandler(event) {
        this.greeting = event.target.value;
        }
}