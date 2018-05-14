/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class SPM_WrapperDef {
    global SPM_WrapperDef() {

    }
global class AuditLogInfo {
    webService Id attachmentId {
        get;
        set;
    }
    webService SVMXC__SVMX_Jobs__c jobs {
        get;
        set;
    }
    global AuditLogInfo() {

    }
}
global class ObjectInfo {
}
global class SPM_ProcessDetails {
    webService String dashboardId {
        get;
        set;
    }
    webService String description {
        get;
        set;
    }
    webService String emailOnFailure {
        get;
        set;
    }
    webService String emailOnSuccess {
        get;
        set;
    }
    webService Boolean isActive {
        get;
        set;
    }
    webService String processId {
        get;
        set;
    }
    webService String processName {
        get;
        set;
    }
    webService String ruleDetailsMetaJSON {
        get;
        set;
    }
    webService String scheduleId {
        get;
        set;
    }
    @WebService
    webService List<SVMXC__ServiceMax_Config_Data__c> spmDetailsList;
    webService String timezone {
        get;
        set;
    }
    global SPM_ProcessDetails() {

    }
}
global class SPM_Request {
    @WebService
    webService List<SVMXC.SPM_WrapperDef.SPM_ProcessDetails> spmProcessDetailsList;
    global SPM_Request() {

    }
}
global class SPM_Response {
    webService List<String> messageList {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.SPM_WrapperDef.AuditLogInfo> spmJobsList;
    @WebService
    webService List<SVMXC.SPM_WrapperDef.SPM_ProcessDetails> spmProcessDetailsList;
    webService Boolean success {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.SPM_WrapperDef.ObjectInfo> timezoneList;
    webService Boolean warning {
        get;
        set;
    }
    global SPM_Response() {

    }
}
}
