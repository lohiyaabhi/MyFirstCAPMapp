sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/sap/firstuiapp/test/integration/FirstJourney',
		'com/sap/firstuiapp/test/integration/pages/StudentSetList',
		'com/sap/firstuiapp/test/integration/pages/StudentSetObjectPage'
    ],
    function(JourneyRunner, opaJourney, StudentSetList, StudentSetObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/sap/firstuiapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheStudentSetList: StudentSetList,
					onTheStudentSetObjectPage: StudentSetObjectPage
                }
            },
            opaJourney.run
        );
    }
);