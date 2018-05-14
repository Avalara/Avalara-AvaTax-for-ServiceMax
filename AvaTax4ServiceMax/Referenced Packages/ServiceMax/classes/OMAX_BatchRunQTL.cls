/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class OMAX_BatchRunQTL implements Database.Batchable<SObject>, Database.Stateful {
    global Datetime dtmNow;
    global String strDispatchProcID;
    global String strOptimaxStatus;
    global String strQuery;
    global String strSVMXJobID;
    global String strTerritoryID;
    global OMAX_BatchRunQTL(String strDPId, String strTId, String strJobId) {

    }
    global void execute(Database.BatchableContext BC, List<SObject> lstSObject) {

    }
    global void finish(Database.BatchableContext BC) {

    }
    global Database.QueryLocator start(Database.BatchableContext BC) {
        return null;
    }
}
