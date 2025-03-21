namespace Abhishek.cds;

using {
    abhishek.db.master,
    abhishek.db.transaction
} from './data-model';

//CDS view is readonly just for reading the data

context CDSView {


    // POWorkLlistCDS is CDS view name which will be visible to end user thats why we kept the name ![name]
    define view ![POWorklistCDS] as
        select from transaction.purchaseOrder {

            key PO_ID                     as ![PurchaseOrderNo],
                //Items from business partner entity set as we have association
            key PARTNER_GUID.BP_ROLE      as ![BusinessPartnerID],
                PARTNER_GUID.COMPANY_NAME as ![CompanyName],

                case OVERALL_STATUS
                    when
                        'N'
                    then
                        'new'
                    when
                        'D'
                    then
                        'Delivered'
                    when
                        'A'
                    then
                        'Accepted'
                end                       as ![OverallStatus]

        };


    //Product Value help

    define view ![ProductVH] as
        select from master.product {
            @EndUserText.label: [{
                language: 'EN',
                text    : 'Product ID'
            },

            {
                language: 'DE',
                text    : 'Prodekt ID'
            }

            ]
            PRODUCT_ID  as ![ProductID],
            DESCRIPTION as ![Description]
        };


    //View of Purchase order Item

    define view ![POItemView] as
        select from transaction.poItems {

            PARENT_KEY.PARTNER_GUID   as ![VendorID],
            PRODUCT_GUID.NODE_KEY     as ![ProductID],
            CURRENCY                  as ![Currency],
            NET_AMOUNT                as ![NetAmount],
            TAX_AMOUNT                as ![TaxAmount],
            PARENT_KEY.OVERALL_STATUS as ![OverallStatus]
        };

    // new view created using above view defined
    //Mixin is a keyword provided by CAP to perform lazy loading
    //it is same concept as association in ABAP CDS

    define view ![ProductOrders] as
        select from master.product
        mixin {
            PO_ORDERS : Association[0.. * ] to POItemView
                            on PO_ORDERS.ProductID = $projection.ProductKey
        }
        into {
            NODE_KEY                           as ![ProductKey],
            DESCRIPTION                        as ![ProductName],
            PRICE                              as ![Price],
            SUPPLIER_GUID.BP_ID                as ![SupplierID],
            SUPPLIER_GUID.COMPANY_NAME         as ![SupplierName],
            SUPPLIER_GUID.ADDRESS_GUID.COUNTRY as ![SupplierCountry],
            //exposed association like ABAP which will lazy load data i.e. On demand
            PO_ORDERS                          as ![ProductOrders]
        }

//Consumption view
//   define view ![CPProductAnalytics] as
//       select from ProductOrders{
//       ProductName,
//       SupplierCountry,

//       } group by ProductName
}
