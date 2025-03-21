module.exports = (srv) => {

    //there are hook methods on , before , after
    //currently we are using hook method of service instance (srv)
    srv.on('pokymon' , req => `Hello ${req.data.name}`);  
    
}