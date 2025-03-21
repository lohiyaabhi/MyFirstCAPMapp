using { Abhishek.cds} from '../db/CDSView';
using { abhishek.db.master } from '../db/data-model';
service MyService @(path: 'MyService'){

    //custom endPoint defined (this file acts like MPC)
    // implementation part we will do it in JS file with same name (Js file act like DPC)
    // this function is unbound not connected to any entity
    function pokymon(name : String(32) ) returns String;  
                    

   //Association is not working- will check later
    entity ProductOrderSet as projection on cds.CDSView.ProductOrders{
      *,
      ProductOrders
    };


    //New entity creation
    entity ReadEmployee as projection on master.employees;





  // unbound actions & functions
  //function sum (x:Integer, y:Integer) returns Integer;
  //function stock (id : Foo:ID) returns Integer;
  //action add (x:Integer, to: Integer) returns Integer;

  // bound actions & functions
  //entity Foo { key ID:Integer } actions {
    //function getStock() returns Integer;
    //action order (x:Integer) returns Integer;
    //bound to the collection and not a specific instance of Foo
    //action customCreate (in: many $self, x: String) returns Foo;


//Actions modify data in the server

//Functions retrieve data

//Unbound actions/functions are like plain unbound functions in JavaScript.

//Bound actions/functions always receive the bound entity's primary key as implicit first argument, 
//similar to this pointers in Java or JavaScript. 
//The exception are bound actions to collections, which are bound against the collection and not a specific instance of the entity. An example use case are custom create actions for the SAP Fiori elements UI.

}