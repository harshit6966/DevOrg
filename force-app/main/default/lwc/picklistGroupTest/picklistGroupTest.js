import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class PicklistGroupTest extends LightningElement {
    options=[
        {
            id:'1',
            groupName:'BestProduct',
            childs:
            [
                {
                    id:'1',
                    label:'Nature Nector Honey',
                    value:'Nature Nector Honey'
                },
                {
                    id:'2',
                    label:'Nature Nector Energy Drink',
                    value:'Energy Drink'
                }
            ]
        },
        {
            id:'2',
            groupName:'Highest Selling Cars',
            childs:
            [
                {
                    id:'3',
                    label:'Tata Nexon',
                    value:'Nexon'
                },
                {
                    id:'4',
                    label:'Honda City',
                    value:'City'
                }
            ]
        }
    ];
    handleNotification(event) {
        const events = new ShowToastEvent({
            title: 'Product',
            message: 'Selected Product is :'+event.detail,
            variant: 'success',
        });
        this.dispatchEvent(events);
    }
}