/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class SFM_ExecuteScheduledSFM_Batch implements Database.Batchable<SObject>, Database.Stateful {
    global Map<String,String> mapSFMIdLog;
    global Map<String,Integer> mapSFMProcessCountFail;
    global Map<String,Integer> mapSFMProcessCountPass;
    global Map<String,String> mapSFMProcessIdSFMProcessName;
    global Map<String,Set<String>> mapSFMProcessSFMScheduleId;
    global Map<String,String> mapSFMScheduleIDLog;
    global Map<String,Set<String>> mapSFMScheduleIdSFMProcess;
    global Map<String,String> mapSFMScheduleIDTimeZone;
    global Map<Id,SVMXC__ServiceMax_Processes__c> mapSFMScheduleProcess;
    global Map<String,String> mapSobjectNameField;
    global Set<String> setProIds;
    global SFM_ExecuteScheduledSFM_Batch() {

    }
    global void execute(Database.BatchableContext BC, List<SObject> scope) {

    }
    global void finish(Database.BatchableContext BC) {

    }
    global System.Iterable start(Database.BatchableContext BC) {
        return null;
    }
}
