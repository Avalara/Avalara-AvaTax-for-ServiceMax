/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class DCON_Event_WS {
    global DCON_Event_WS() {

    }
    webService static List<String> DCON_Create_Events_WS2(String UserId, String timeZone, List<Event> lstEvent, List<SVMXC.DCON_Configuration_WS.SVMX_StringMap> lstKeyValue) {
        return null;
    }
    webService static List<String> DCON_Create_Events_WS3(String UserId, List<Event> lstEvent, String timeZone, List<SVMXC.DCON_Configuration_WS.SVMX_StringMap> lstKeyValue) {
        return null;
    }
    webService static List<String> DCON_Create_Events_WS(String UserId, String timeZone, List<Event> EventList) {
        return null;
    }
    webService static String DCON_Delete_Events_WS(String UserId, List<String> Events) {
        return null;
    }
    webService static List<String> DCON_Event_SubjectDef(String WOIdUserId) {
        return null;
    }
    webService static List<SVMXC.DCON_Event_WS.Events_WP> DCON_Fetch_All_Events_WS(List<String> WOIds, String UserId, List<String> TechnicianIds, String timeZoneDateTimeFormat) {
        return null;
    }
    webService static List<SVMXC.DCON_Event_WS.Events_WP> DCON_Fetch_Events_WS(String UserId, String timeZoneDateTimeFormat, List<String> TechnicianIds) {
        return null;
    }
    webService static List<SVMXC.DCON_Event_WS.Events_WP> DCON_Retrieve_Events_WS(String UserId, String StartDate, String EndDate, String EventType, String timeZoneDateTimeFormat, List<String> TechnicianIds) {
        return null;
    }
    webService static List<Event> DCON_Retrieve_Salesforce_Events_WS(String UserId, String StartDate, String EndDate, List<String> EventOwnerIds) {
        return null;
    }
    webService static List<Event> DCON_Retrieve_Salesforce_WO_Events_WS(String UserId, String StartDate, String EndDate, String strWOid) {
        return null;
    }
    webService static List<SVMXC__SVMX_Event__c> DCON_Retrieve_ServiceMax_Events_WS(String UserId, String StartDate, String EndDate, List<String> ServiceMaxEventOwnerIds) {
        return null;
    }
    webService static List<SVMXC__SVMX_Event__c> DCON_Retrieve_ServiceMax_WO_Events_WS(String UserId, String StartDate, String EndDate, String strWOid) {
        return null;
    }
    webService static List<SVMXC.DCON_Event_WS.Events_WP> DCON_Retrieve_WO_Events_WS(String UserId, String StartDate, String EndDate, String timeZone, String strWOid) {
        return null;
    }
    webService static String DCON_Upsert_Events_WS2(String UserId, String timeZone, List<Event> Events, List<SVMXC.DCON_Configuration_WS.SVMX_StringMap> lstKeyValue) {
        return null;
    }
    webService static String DCON_Upsert_Events_WS3(String UserId, List<Event> Events, String timeZone, List<SVMXC.DCON_Configuration_WS.SVMX_StringMap> lstKeyValue) {
        return null;
    }
    webService static List<String> DCON_Upsert_Events_WS4(String UserId, List<Event> Events, String timeZone, List<SVMXC.DCON_Configuration_WS.SVMX_StringMap> lstKeyValue) {
        return null;
    }
    webService static String DCON_Upsert_Events_WS(String UserId, String timeZone, List<Event> Events) {
        return null;
    }
    webService static SVMXC.DCON_Event_WS.DCEvent_WO_WP GetEventWOInfo_WS(List<String> lstEventIds, String UserId, List<String> keyValPairs, String ViewId, List<String> DispatchStatus, String timeZoneDateTimeFormat, List<String> workorderIds) {
        return null;
    }
    webService static List<String> Retrieve_Deleted_Events_WS(String UserId, String StartDate, String EndDate, String EventType, String timeZone, String lastRetrievedDate, List<String> TechnicianIds) {
        return null;
    }
    webService static List<SVMXC.DCON_Event_WS.Events_WP> Retrieve_Updated_Events_WS(String UserId, String StartDate, String EndDate, String EventType, String timeZoneDateTimeFormat, String lastRetrievedDate, List<String> TechnicianIds) {
        return null;
    }
global class DCEvent_WO_WP {
    webService List<SVMXC.DCON_Event_WS.Events_WP> lstEvent {
        get;
        set;
    }
    webService SVMXC.DCON_Work_Order_WS.workorder_WP objWorkOrder {
        get;
        set;
    }
    webService String strWOAction {
        get;
        set;
    }
    global DCEvent_WO_WP() {

    }
}
global class DCEvent_WP {
    webService String activityDate {
        get;
        set;
    }
    webService String activityDateTime {
        get;
        set;
    }
    webService String additionalInfo {
        get;
        set;
    }
    webService String Break_Time_Total {
        get;
        set;
    }
    webService String description {
        get;
        set;
    }
    webService String Driving_Time {
        get;
        set;
    }
    webService String Driving_Time_Home {
        get;
        set;
    }
    webService String durationInMinutes {
        get;
        set;
    }
    webService String endDateTime {
        get;
        set;
    }
    webService List<String> EvntHovrAdditionalInfo {
        get;
        set;
    }
    webService String id {
        get;
        set;
    }
    webService Boolean IsAllDayEvent {
        get;
        set;
    }
    webService Boolean isWorkOrder {
        get;
        set;
    }
    webService Datetime lastModifiedDateTime {
        get;
        set;
    }
    webService String location {
        get;
        set;
    }
    webService List<SVMXC.DCON_Event_WS.KeyValuePair_WP> lstKeyValuePair {
        get;
        set;
    }
    webService String Overhead_Time_After {
        get;
        set;
    }
    webService String Overhead_Time_Before {
        get;
        set;
    }
    webService String ownerId {
        get;
        set;
    }
    webService String Service_Duration {
        get;
        set;
    }
    webService String startDateTime {
        get;
        set;
    }
    webService String subject {
        get;
        set;
    }
    webService String TechId {
        get;
        set;
    }
    webService String Type {
        get;
        set;
    }
    webService String whatId {
        get;
        set;
    }
    webService String whoId {
        get;
        set;
    }
    global DCEvent_WP() {

    }
}
global class Events_WP {
    webService SVMXC.DCON_Event_WS.DCEvent_WP event_WP {
        get;
        set;
    }
    webService Boolean isEventThresholdMet {
        get;
        set;
    }
    @WebService
    webService Long lastSyncedTime;
}
global class KeyValuePair_WP {
    webService String key {
        get;
        set;
    }
    webService String keyType {
        get;
        set;
    }
    webService String value {
        get;
        set;
    }
}
}
