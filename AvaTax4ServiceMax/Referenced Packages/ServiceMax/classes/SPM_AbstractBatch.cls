/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global abstract class SPM_AbstractBatch implements Database.Batchable<SObject>, Database.Stateful {
    global SPM_AbstractBatch(SVMXC.SPM_Schema.Report report, SVMXC__ServiceMax_Config_Data__c scheduleData) {

    }
    global void execute(Database.BatchableContext batchContext, List<SObject> records) {

    }
    global void finish(Database.BatchableContext batchContext) {

    }
    global abstract void initBatchConfiguration();
    global abstract void onFinishComplete();
    global Database.QueryLocator start(Database.BatchableContext batchContext) {
        return null;
    }
}
