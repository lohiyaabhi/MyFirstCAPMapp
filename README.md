# Getting Started

Welcome to your new project.

It contains these folders and files, following our recommended project layout:

File or Folder | Purpose
---------|----------
`app/` | content for UI frontends goes here
`db/` | your domain models and data go here
`srv/` | your service models and code go here
`package.json` | project metadata and configuration
`readme.md` | this getting started guide


## Next Steps

- Open a new terminal and run `cds watch`
- (in VS Code simply choose _**Terminal** > Run Task > cds watch_)
- Start adding content, for example, a [db/schema.cds](db/schema.cds).


## Learn More

Learn more at https://cap.cloud.sap/docs/get-started/.

## how to add hana instance and create HDI container on Hana cloud
this will create the HDI container on cloud with all the tables and Views in our app.
Also this will generate the gen/db folder automatically with all HDB views and table.
1) run command under app CAPMAPP 
   cds deploy --to Hana:HDIContainerCAPMAPP

Note : Above statement will create seperate HDI container (Design time artifcat)for each developer on cloud
After we will complete developing application and do the deployment on cloud. there is module called db-deployer inside mta.yaml file which will create single container (Runtime artifact) for the app on SAP BTP which will be used by all the user who use that app.

## mock strategy for authorization at package.json file 

"requires": {
      "db": "hana",
      "uaa":{
        "kind": "xsuaa"
      },
      "auth": {
        "[development]":{
          "strategy" : "mocked",
          "users":{
            "anubhav":{
              "roles" : ["Viewer"],
              "userAttributes":{
                "BankName":["Bank of America"]
              }
            },
            "ananya":{
              "roles" : ["Viewer","Admin"],
              "userAttributes":{
                "BankName":["$UNRESTRICTED"]
              }
            }
          }
        },
        "[production]":{
          "strategy" : "JWT"
        }
      }
    }

## adding app router to the app
1) With the help of terminal window go inside CAPMAPP -> app folder
2)Inside app folder run command npm init which will generate package.json file automatcially
3) Again in terminal window run commnad npm i @sap/approuter
4)Add script in package.json file to run router 
   "start": "node node_modules/@sap/approuter/approuter.js"
5)Now create xs-app.json file in the folder by running command in terminal 
   touch xs-app.json  // this command generate file in Linux
now add all routing path in xs-app.json file
6)After adding router we need to add deployment descriptor file

## deployment descriptor file
manifest.yaml - (old) deployment descriptor file
mta.yaml - (new) deployment descriptor file 
        - this is advance version of manifest.yaml
        -it allows definition of all the modules and their dependencies (backing services like xsuaa) 
1) run command under main folder (CAPMAPP)
 cds add mta
 Above command will create mta.yaml file automatically

 Afte the deployment of the application. All the managed dependencies instances will be created automatically to BTP because of this file

 ## build mta archieve file
 1)right click mta.yaml file and select option Build mta
 2)this will create mtar file under mta_archieve folder which is automatically generated.