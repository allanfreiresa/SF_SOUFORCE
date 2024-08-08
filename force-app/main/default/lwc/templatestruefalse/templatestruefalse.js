import { LightningElement } from 'lwc';

export default class Templatestruefalse extends LightningElement {

    connectedCallback(){
        this.data = [
            {name: "Brenda Freire de Sa",idade : "7"},
            {name: "Allan Freire de Sa",idade : "43"},
            {name: "Karina Juliana da Silva",idade : "44"}
        ]
    }
}