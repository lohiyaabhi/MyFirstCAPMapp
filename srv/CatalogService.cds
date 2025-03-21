using { abhishek.db.master, abhishek.db.transaction } from '../db/data-model';

service CatalogServ @(path : 'CatalogService') {

    @Capabilities:{Deletable, Insertable}
    entity BusinessPartenerSet as projection on master.businessPartner;
    entity AddressSet as projection on master.address;

   // @readonly                   //below entity set will be read only
    entity EmployeeSet as projection on master.employees;

    //non instance bound function
    // we are using this function just in case for some field in object page while creating we want by default value.
    function setproductCategory() returns ProductSet;

    entity ProductSet @(
        odata.draft.enabled: true,
        Common.DefaultValuesFunction: 'setproductCategory'
    )as projection on master.product;

    //we are implementing action on entity POSet thats why semicolon is not there
    //bound action and function as it is assocated with entityset
    entity POSet as projection on transaction.purchaseOrder       
    actions{
        action boost() returns POSet;
        function largestOrder() returns POSet;
    };
    entity POItemSet as projection on transaction.poItems;

    

}
