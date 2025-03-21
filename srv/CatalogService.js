module.exports = cds.service.impl(async function () {     //this is normal function 
    
    
    const {POs} = this.entities;
    
    //Generic handler - Give flexibility to add custom logic on top of what CAPM already offers.

    this.before(['CREATE' , 'PATCH'], "EmployeeSet", (req) =>{

        if(parseFloat(req.data.salaryAmount) >= 100000){

            req.error(500, "Hey invalid salary");

        }


    });

    
    //this is called arrow function
    //Arrow functions do NOT have their own this object
    //Action is implemented - data manipulation in the backend (Post operation)
    this.on('boost' , async (req) => {                  
        console.log("calling action");                                
       
        try {
         
        //we are getting the ID which we are going to pass while calling Odata
        //POST http://localhost:4004/odata/v4/CatalogService/POSet/{ID}/boost
        const ID = req.params[0];     

        //start db transaction        
        const tx = cds.tx(req);

        //CDSS query lanugage - communicate to DB in agnostic manner
        await tx.update(POSet).with({
            GROSS_AMOUNT :{'+=' : 20000}
        }).where(ID);

        } catch (error) {
            return "Error" + error.toString();
        }

    });


    //Function is implemented - data fetching from the backend (Get operation)
    this.on('largestOrder' , async (req) => {                  
        console.log("calling function");                                
       
        try {
         
        //start db transaction        
        const tx = cds.tx(req);

        //read the PO with highest gross amount
        //read orders desc by gross amount and the get the first record

        
        await tx.read(POSet).orderBy({
            GROSS_AMOUNT: 'desc'
        }).limit(1);

        } catch (error) {
            return "Error" + error.toString();
        }

    });
})