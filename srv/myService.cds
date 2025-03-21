service MyService @(path: 'MyService'){

    function pokymon(name : String(32) ) returns String;  //custom endPoint defined (this file acts like MPC)
                    // implementation part we will do it in JS file with same name (Js file act like DPC)
                    // this function is unbound not connected to any entity


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