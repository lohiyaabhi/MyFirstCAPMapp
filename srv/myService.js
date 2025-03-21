const cds = require('@sap/cds');
const { employees } = cds.entities("abhishek.db.master");
module.exports = async (srv) => {

    //there are hook methods on , before , after
    //currently we are using hook method of service instance (srv)
    srv.on('pokymon', req => `Hello ${req.data.name}`);


    //Read and manipulate data
    srv.on('READ', 'ReadEmployee', async (req) => {
        //Example of hardcode
        // return{
        //     "ID": 222-2,
        //     "Name" : "Abhi"
        // }

        //Calling database with the help of transaction (tx)
        const tx = await cds.tx(req);
        var returnData = [];

        //await is added so that it will work synchrously
        var results = await tx.run(SELECT.from(employees).limit(5));
        for (let index = 0; index < array.length; index++) {
            const element = results[index];
            element.nameMiddle = "Garg";
            returnData.push(element);
        }
        return returnData;

        //Example - working with condition
        // var whereCondition = req.data;
        // if (whereCondition.hasOwnProperty("ID")) {
        //     return await cds.tx.run(SELECT.from(employees).where(whereCondition));
        // } else {
        //     return await cds.tx.run(SELECT.from(employees).limit(2).where({
        //         "sex": 'F'
        //     }));
        // }
        
    })



}