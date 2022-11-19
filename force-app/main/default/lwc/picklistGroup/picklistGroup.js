import { LightningElement,api } from 'lwc';

export default class PicklistGroup extends LightningElement {
    @api options;
    @api headerLabel;
    handleSelect(event) {
        const selectedEvent = new CustomEvent('productselection', { detail: event.target.value });
        this.dispatchEvent(selectedEvent);
    }
}