sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        Rejection: function(oEvent) {
            MessageToast.show("Custom handler invoked.");
        },
        Finalize: function() {
            MessageToast.show("Custom handler invoked.");
        }
    };
});
