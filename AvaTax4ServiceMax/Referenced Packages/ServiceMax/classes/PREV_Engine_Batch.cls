/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class PREV_Engine_Batch implements Database.Batchable<SObject>, Database.Stateful {
    global List<SVMXC.INTF_WebServicesDef.INTF_SFMResponse> lstEngineResp;
    global Map<Id,SVMXC__PM_Plan__c> mapPMPlan;
    global Map<String,String> mapPMPlanIdPMProcessId;
    global Map<Id,Id> mapPMPlanIdPMProcessId2;
    global Map<Id,Map<Id,List<SVMXC__PM_Coverage__c>>> mapPMPlanIdPMScheduleLstPMCvrgLst;
    global Map<String,SVMXC__ServiceMax_Processes__c> mapPMProcess;
    global Map<Id,SVMXC__ServiceMax_Processes__c> mapPMProcess2;
    global Map<String,List<String>> mapPMProcessIdPMPlanLst;
    global Map<String,SVMXC__Service_Order__c> mapScheduleIdWorkOrder;
    global Set<String> setProcessIds;
    global PREV_Engine_Batch() {

    }
    global void execute(Database.BatchableContext scPMEngine, List<SObject> scope) {

    }
    global void finish(Database.BatchableContext BC) {

    }
    global System.Iterable start(Database.BatchableContext scPMEngine) {
        return null;
    }
}
