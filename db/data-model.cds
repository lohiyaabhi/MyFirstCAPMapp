namespace abhishek.db;

using { cuid, Currency } from '@sap/cds/common';
using { abhishekdb.commons as customCommons } from './common';


context master {

    entity businessPartner {
         key NODE_KEY : customCommons.Guid;
         BP_ROLE : String(2);
         EMAIL_ADDRESS: String(105);
         PHONE_NUMBER : String(32);
         FAX_NUMBER : String(32);
         WEB_ADDRESS : String(50);
         ADDRESS_GUID : Association to address;
         BP_ID : String(32);
         COMPANY_NAME : String(250);
    }

entity address  {

    key NODE_KEY : customCommons.Guid;
    CITY : String(44);
    POSTAL_CODE : String(8);
    STREET : String(44);
    BUILDING : String(80);
    COUNTRY :String(100);
    ADDRESS_TYPE :String(40);
    VAL_START_DATE : Date;
    VAL_END_DATE : Date;
    LATITUDE : Decimal;
    LONGITUTUDE : Decimal;
    businessPartner : Association to one businessPartner on businessPartner.ADDRESS_GUID = $self;
}

entity product {

    key NODE_KEY : customCommons.Guid;
    PRODUCT_ID : String(40);
    TYPE_CODE : String(2);
    CATEGORY : String(32);
    DESCRIPTION : localized String(100);     //localized  key word handle the language translation and it will create text table
    SUPPLIER_GUID : Association to master.businessPartner;
    TAX_TARRIF_CODE : Integer;
    MEASURE_UNIT : String(2);
    WEIGHT_UNIT : String(2);
    WEIGHT_MEASURE : Decimal(5, 2);
    CURRENCY_CODE : String(4);
    PRICE : Decimal(15,2);
    WIDTH : Decimal(5,2);
    HEIGHT : Decimal(5,2);
    DEPTH : Decimal(5,2);
    DIM_UNIT : String(2);

    }

    entity employees : cuid {
        nameFirst : String(40);
        nameMiddle : String(40);
        nameLast : String(40);
        nameInitials : String(40);
        sex : customCommons.GENDER;
        language : String(1);
        phoneNumber :customCommons.PhoneNumber;
        email : customCommons.EmailID;
        Currency : Currency;
        salaryAmount : customCommons.AmountType;
        accountNumber : String(16);
        bankID : String(8);
        bankName : String(64);
    }
}

context transaction {

    entity purchaseOrder : customCommons.Amount {

        Key NODE_KEY : customCommons.Guid;
        PO_ID : String(40);
        PARTNER_GUID : Association to master.businessPartner;
        LIFECYCLE_STATUS : String(1);
        OVERALL_STATUS : String(1);
    }
    
    entity poItems : customCommons.Amount {

        Key NODE_KEY : customCommons.Guid;
        PARENT_KEY : Association to purchaseOrder;
        PO_ITEM_POS : Integer;
        PRODUCT_GUID : Association to master.product;
        
    }
}