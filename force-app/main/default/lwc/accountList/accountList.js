import { api, LightningElement, track } from 'lwc';
import getAccountsByName from '@salesforce/apex/AccountController.getAccountsByName';

export default class AccountList extends LightningElement {
    @track accounts;
    @track error;
    @track searchKey = '';

    @api recordId;

    columns = [
        { label: 'Name', fieldName: 'Name' },
        { label: 'Industry', fieldName: 'Industry' },
        { label: 'Phone', fieldName: 'Phone', type: 'phone' },
    ];

    handleSearchKeyChange(event) {
        this.searchKey = event.target.value;
    }

    async handleSearch() {
        try {
            this.accounts = await getAccountsByName({ accountName: this.searchKey });
            this.error = undefined;
        } catch (error) {
            this.error = error;
            this.accounts = undefined;
        }
    }
}
