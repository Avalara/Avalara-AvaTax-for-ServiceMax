/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class DCON_Configuration_WS {
    global DCON_Configuration_WS() {

    }
    webService static List<SVMXC.DCON_Configuration_WS.SVMX_StringMap> DCON_GetAllTimeZone_WS(String UserId) {
        return null;
    }
    webService static String DCON_GetLocalDate_WS(String UserId) {
        return null;
    }
    webService static String DCON_GetUserType_WS(String UserId) {
        return null;
    }
    webService static String DCON_Restore_DCSettings_WS(String UserId) {
        return null;
    }
    webService static List<SVMXC.COMM_TagWebServices.TagsMap> DCON_Retrieve_Display_Tags_WS(String UserId) {
        return null;
    }
    webService static List<SVMXC.DCON_Configuration_WS.SVMX_StringMap> DCON_Retrieve_Settings_WS(String UserId) {
        return null;
    }
    webService static String DCON_Retrieve_User_Settings_WS(String UserId) {
        return null;
    }
    webService static String DCON_Update_User_Settings_WS(String UserId, String UserSettings) {
        return null;
    }
    webService static SVMXC.DCON_Configuration_WS.SVMX_Response DCON_getObjectFieldList_WS() {
        return null;
    }
    webService static Boolean EventExistinBusinessHour(String TechId, Datetime StrtDate, String TimZonKey) {
        return null;
    }
    webService static List<SVMXC.DCON_Configuration_WS.SVMX_BuisnessHourAttribute> GetEvent_BuisnessHour(String TechId) {
        return null;
    }
    webService static SVMXC.DCON_Configuration_WS.SVMX_Response SVMX_DeployUIConfiguration_WS(SVMXC.DCON_Configuration_WS.SVMX_StringMap request) {
        return null;
    }
    webService static SVMXC.DCON_Configuration_WS.SVMX_Response SVMX_getDispatcherList_WS(SVMXC.DCON_Configuration_WS.SVMX_StringMap request) {
        return null;
    }
    webService static Datetime getDateTimeInTimezone(Date givenDate, Time givenTime, String timeZoneSidKey) {
        return null;
    }
global class SVMX_BuisnessHourAttribute {
    webService String Day {
        get;
        set;
    }
    webService String EndTime {
        get;
        set;
    }
    webService String StartTime {
        get;
        set;
    }
    global SVMX_BuisnessHourAttribute(String d, String s, String e) {

    }
}
global class SVMX_Response {
    webService List<SVMXC.DCON_Configuration_WS.SVMX_StringMap> DispatcherList {
        get;
        set;
    }
    webService List<String> Evntfields {
        get;
        set;
    }
    webService String message {
        get;
        set;
    }
    webService List<SObject> RecordList {
        get;
        set;
    }
    webService Boolean success {
        get;
        set;
    }
    webService List<String> WoFields {
        get;
        set;
    }
    global SVMX_Response() {

    }
}
global class SVMX_StringMap {
    webService String columnInfo {
        get;
        set;
    }
    webService Datetime DateTimeValue {
        get;
        set;
    }
    webService Date DateValue {
        get;
        set;
    }
    webService SVMXC.DCON_DeployUserSetting.DCUserSettings dcSetting {
        get;
        set;
    }
    webService String fieldsToNull {
        get;
        set;
    }
    webService String Key {
        get;
        set;
    }
    webService String Value {
        get;
        set;
    }
    webService List<String> ValueList {
        get;
        set;
    }
    webService String woViewType {
        get;
        set;
    }
    global SVMX_StringMap(String k, String v) {

    }
}
}
