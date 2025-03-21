namespace abhishekdb;
using {abhishekdb.commons as customcommons  } from './common';
using { cuid, temporal, managed} from '@sap/cds/common';



context master {                                      //context name will be added after namespace

 //create entity

   entity student: customcommons.address {                    //address is a aspect we defined at the top

    key ID: customcommons.Guid;  //String(32);
    NAME: String(80);
    CLASS: Association to one standard;
    GENDER: String(1);
    //CITY: String(10);                //we have commented city as this element is already a part of address aspect we defined at the top

   }

   entity standard {
    key ID: customcommons.Guid;  //String(32);
    CLASSNAME: String(10);
    SECTIONS: Int16;
    CLASSTEACHER: String(80);
    
   }

   entity books {

    Key ID: customcommons.Guid;  //String(32);
    BOOKNAME: String(30);
    AUTHOR: String(80);
    
   }

}

context transactional {

    entity rentals : cuid, temporal, managed {              //using standard aspects provided by SAP

        student: Association to one master.student;
        book: Association to one master.books;
        
    }
    
}