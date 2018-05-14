/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class TMST_WrapperDef {
    global TMST_WrapperDef() {

    }
global class ObjectInfo {
}
global class TMST_Request {
    @WebService
    webService List<SVMXC.TMST_WrapperDef.TMST_TimesheetConfiguration> timesheetConfigurationList;
    global TMST_Request() {

    }
}
global class TMST_Response {
    @WebService
    webService List<BusinessHours> businessHoursList;
    @WebService
    webService List<SVMXC.TMST_WrapperDef.ObjectInfo> eventMappingList;
    @WebService
    webService List<SVMXC.TMST_WrapperDef.ObjectInfo> eventRuleList;
    webService List<String> messageList {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.TMST_WrapperDef.TMST_TimesheetAccess> profileAssociationList;
    @WebService
    webService List<SVMXC.TMST_WrapperDef.ObjectInfo> servicemaxEventMappingList;
    @WebService
    webService List<SVMXC.TMST_WrapperDef.ObjectInfo> servicemaxEventRuleList;
    webService Boolean success {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.TMST_WrapperDef.ObjectInfo> taskMappingList;
    @WebService
    webService List<SVMXC.TMST_WrapperDef.ObjectInfo> taskRuleList;
    @WebService
    webService List<SVMXC.TMST_WrapperDef.TMST_TimesheetConfiguration> timesheetConfigurationList;
    @WebService
    webService List<SVMXC.TMST_WrapperDef.ObjectInfo> timezoneList;
    webService Boolean warning {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.TMST_WrapperDef.TMST_WorkDetailOwnership> workDetailOwnershipList;
    @WebService
    webService List<SVMXC.TMST_WrapperDef.ObjectInfo> workDetailsMappingList;
    @WebService
    webService List<SVMXC.TMST_WrapperDef.ObjectInfo> workDetailsRuleList;
    global TMST_Response() {

    }
}
global class TMST_TimesheetAccess {
    @WebService
    webService SVMXC__ServiceMax_Config_Data__c configProfile;
    webService String timesheetProcessId {
        get;
        set;
    }
    webService String timesheetProcessName {
        get;
        set;
    }
    global TMST_TimesheetAccess() {

    }
}
global class TMST_TimesheetConfiguration {
    @WebService
    webService List<SVMXC.TMST_WrapperDef.TMST_TimesheetAccess> assignedProfilesList;
    @WebService
    webService List<SVMXC__ServiceMax_Config_Data__c> scheduleDetailsList;
    @WebService
    webService SVMXC__ServiceMax_Processes__c timesheetProcess;
    global TMST_TimesheetConfiguration() {

    }
}
global class TMST_WorkDetailOwnership {
    webService String apiName {
        get;
        set;
    }
    webService String labelName {
        get;
        set;
    }
    global TMST_WorkDetailOwnership() {

    }
}
}
