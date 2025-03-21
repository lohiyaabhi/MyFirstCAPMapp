namespace abhishekdb.commons;
using { Currency } from '@sap/cds/common';


type GENDER : String(1) enum{
Male = 'M';
Female = 'F';
Undisclosed = 'U';
};

type AmountType : Decimal(10, 2)@(
    semantic.amount.currencyCode : 'CURRENCY_code',    //code is appended because of association
    sap.unit : 'CURRENCY_code'
);

aspect Amount : {

    CURRENCY : Currency;                    //this currency is coming from SAP commons folder we defined at the top
    GROSS_AMOUNT : AmountType @(title : 'Gross amount');
    NET_AMOUNT : AmountType @(title : 'Net amount');
    TAX_AMOUNT : AmountType @(title : 'Tax amount');
}

type PhoneNumber : String(20) @assert.format : '^(\+?[1-9]{1}[0-9]{1,4})?(\s|\-|\.)?(\(?\d{1,4}\)?[\s\-\.]?)?(\d{1,4})?[\s\-\.]?\d{1,4}[\s\-\.]?\d{1,4}$';  //validate the number with regular expression

type EmailID : String(80) @assert.format : '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

//create custom data type which we can use globally whereever string(32) is used;
//This will help us to re use and in future there is no need to change the length everywhere we can simply modify the custom type

    type Guid: String(32);

//aspects in CAP is nothing but structure 
//We can use this aspect like cutom data type while defining entities element.
    aspect address{
        HOUSENO: Int16;
        STREET: String(32);
        CITY: String(80);
        COUNTRY: String(32);
    };