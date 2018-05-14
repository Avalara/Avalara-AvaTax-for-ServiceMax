/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class TMST_TimesheetEngine implements Database.Batchable<SObject>, Database.Stateful {
    global Map<Id,SVMXC__ServiceMax_Config_Data__c> mapTSProcessScheduler;
    global Set<String> setProcessIds;
    global String timeSheetRecordType;
    global TMST_TimesheetEngine() {

    }
    global void execute(Database.BatchableContext TSEngine, List<SObject> scope) {

    }
    global void finish(Database.BatchableContext BC) {

    }
    global System.Iterable start(Database.BatchableContext TSEngine) {
        return null;
    }
}
