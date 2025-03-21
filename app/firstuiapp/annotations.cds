using FirstService as service from '../../srv/service';

annotate service.StudentSet with @(
  UI.SelectionFields                         : [
    ID,
    NAME,
    GENDER,
    COUNTRY,
    HOUSENO,
  ],
  UI.LineItem                                : [
    {
      $Type: 'UI.DataField',
      Value: ID,
    },
    {
      $Type: 'UI.DataField',
      Value: NAME,
    },
    {
      $Type: 'UI.DataField',
      Value: GENDER,
    },
    {
      $Type: 'UI.DataField',
      Value: CITY,
      Label: 'CITY',
    },
    {
      $Type: 'UI.DataField',
      Value: COUNTRY,
    },
  ],
  UI.SelectionPresentationVariant #tableView : {
    $Type              : 'UI.SelectionPresentationVariantType',
    PresentationVariant: {
      $Type         : 'UI.PresentationVariantType',
      Visualizations: ['@UI.LineItem', ],
    },
    SelectionVariant   : {
      $Type        : 'UI.SelectionVariantType',
      SelectOptions: [],
    },
    Text               : 'Table View',
  },
  UI.LineItem #tableView                     : [],
  UI.SelectionPresentationVariant #tableView1: {
    $Type              : 'UI.SelectionPresentationVariantType',
    PresentationVariant: {
      $Type         : 'UI.PresentationVariantType',
      Visualizations: ['@UI.LineItem#tableView', ],
    },
    SelectionVariant   : {
      $Type        : 'UI.SelectionVariantType',
      SelectOptions: [],
    },
    Text               : 'Table View 1',
  },
  UI.DataPoint #CLASS_ID                     : {
    $Type: 'UI.DataPointType',
    Value: CLASS_ID,
    Title: 'CLASS_ID',
  },
  UI.DataPoint #NAME                         : {
    $Type: 'UI.DataPointType',
    Value: NAME,
    Title: 'NAME',
  },
  UI.DataPoint #ID                           : {
    $Type: 'UI.DataPointType',
    Value: ID,
    Title: 'ID',
  },
  UI.HeaderFacets                            : [
    {
      $Type : 'UI.ReferenceFacet',
      ID    : 'CLASS_ID',
      Target: '@UI.DataPoint#CLASS_ID',
    },
    {
      $Type : 'UI.ReferenceFacet',
      ID    : 'NAME',
      Target: '@UI.DataPoint#NAME',
    },
    {
      $Type : 'UI.ReferenceFacet',
      ID    : 'ID',
      Target: '@UI.DataPoint#ID',
    },
  ],
  UI.Facets                                  : [
    {
      $Type : 'UI.ReferenceFacet',
      Label : 'Basic',
      ID    : 'Basic',
      Target: '@UI.FieldGroup#Basic',
    },
    {
      $Type : 'UI.ReferenceFacet',
      Label : 'Advance',
      ID    : 'Advance',
      Target: '@UI.Identification',
    },
  ],
  UI.FieldGroup #Basic                       : {
    $Type: 'UI.FieldGroupType',
    Data : [
      {
        $Type: 'UI.DataField',
        Value: NAME,
      },
      {
        $Type: 'UI.DataField',
        Value: ID,
      },
    ],
  },
  UI.Identification                          : [{
    $Type : 'UI.DataFieldForAnnotation',
    Target: '@UI.ConnectedFields#connected',
    Label : 'Address',
  },
    {
        $Type : 'UI.DataField',
        Value : CLASS_ID,
        Label : 'CLASS_ID',
    },
    {
        $Type : 'UI.DataField',
        Value : CLASS.CLASSNAME,
        Label : 'CLASSNAME',
    }, ],
  UI.ConnectedFields #connected              : {
    $Type   : 'UI.ConnectedFieldsType',
    Template: '{HOUSENO}-{STREET}',
    Data    : {
      $Type  : 'Core.Dictionary',
      HOUSENO: {
        $Type: 'UI.DataField',
        Value: HOUSENO,
      },
      STREET : {
        $Type: 'UI.DataField',
        Value: STREET,
      },
    },
  },
);

annotate service.StudentSet with {
  ID @Common.Label: 'ID'
};

annotate service.StudentSet with {
  NAME @Common.Label: 'NAME'
};

annotate service.StudentSet with {
  GENDER @Common.Label: 'GENDER'
};

annotate service.StudentSet with {
  COUNTRY @Common.Label: 'COUNTRY'
};

annotate service.StudentSet with {
  HOUSENO @Common.Label: 'HOUSENO'
};
