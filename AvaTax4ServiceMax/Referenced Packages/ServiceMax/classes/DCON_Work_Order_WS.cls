/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class DCON_Work_Order_WS {
    global DCON_Work_Order_WS() {

    }
    webService static List<String> DCON_Assign_Work_Order_To_MultiTeam_WS(String UserId, List<String> WorkOrderIds, String TechnicianId, String timeZone, List<Event> EventList) {
        return null;
    }
    webService static List<String> DCON_Assign_Work_Order_To_MultiTech_WS2(String UserId, List<String> WorkOrderIds, String TechnicianId, String timeZone, List<Event> EventList, Boolean setOwner, List<SVMXC.DCON_Configuration_WS.SVMX_StringMap> lstKeyValue) {
        return null;
    }
    webService static List<String> DCON_Assign_Work_Order_To_MultiTech_WS(String UserId, List<String> WorkOrderIds, String TechnicianId, String timeZone, List<Event> EventList, Boolean setOwner) {
        return null;
    }
    webService static String DCON_Assign_Work_Order_To_Team_WS(String UserId, List<String> WorkOrderIds, String TeamId, Boolean SetOwner) {
        return null;
    }
    webService static String DCON_Assign_Work_Order_To_Tech_WS(String UserId, List<String> WorkOrderIds, String TechnicianId, Boolean SetOwner) {
        return null;
    }
    webService static List<String> DCON_Keyword_Search_WS(String UserId, String Keyword, String FindWhat, String KeywordMatch, String SearchType) {
        return null;
    }
    webService static SVMXC.DCON_Work_Order_WS.DCON_WO_MultiAssign_Response DCON_Manage_Work_Order_MultiAssign_WS(SVMXC.DCON_Work_Order_WS.DCON_WO_MultiAssign_Request dcon_Request) {
        return null;
    }
    webService static String DCON_RESET_WO_Time(List<String> WorkOrderIds) {
        return null;
    }
    webService static List<SVMXC.DCON_Work_Order_WS.workorder_WP> DCON_Retrieve_AllWorkOrder_Ids_WS(List<String> keyValPairs, String UserId, String ViewId, List<String> DispatchStatus, String timeZone) {
        return null;
    }
    webService static SVMXC.DCON_Work_Order_WS.workorderDelta_WP DCON_Retrieve_Delta_Work_Orders_WS(List<String> keyValPairs, String UserId, String ViewId, List<String> DispatchStatus, String timeZone, List<String> workorderIds) {
        return null;
    }
    webService static List<SVMXC.DCON_Configuration_WS.SVMX_StringMap> DCON_Retrieve_Views_WS(String UserId) {
        return null;
    }
    webService static List<String> DCON_Retrieve_Work_Order_EventHover(String WorkOrderId) {
        return null;
    }
    webService static SVMXC.DCON_Work_Order_WS.workorderInfo_WP DCON_Retrieve_Work_Order_Info() {
        return null;
    }
    webService static List<SVMXC__Service_Order__c> DCON_Retrieve_Work_Orders_LatLng_WS(String UserId, List<String> WorkOrderIds) {
        return null;
    }
    webService static List<SVMXC.DCON_Work_Order_WS.workorder_WP> DCON_Retrieve_Work_Orders_WO_WS(String UserId, String timeZone, List<String> workorderIds) {
        return null;
    }
    webService static List<SVMXC.DCON_Work_Order_WS.workorder_WP> DCON_Retrieve_Work_Orders_WS2(List<String> keyValPairs, String UserId, String ViewId, List<String> DispatchStatus, String timeZone, List<String> workorderIds) {
        return null;
    }
    webService static List<SVMXC.DCON_Work_Order_WS.workorder_WP> DCON_Retrieve_Work_Orders_WS(String UserId, String ViewId, List<String> DispatchStatus, String timeZone, List<String> workorderIds) {
        return null;
    }
    webService static SVMXC.DCON_Work_Order_WS.unassignAssign_WP DCON_UnAssignAssign_Work_Order_To_MultiTech_WS2(String UserId, List<String> WorkOrderIds, String TechnicianId, String timeZone, List<Event> EventList, Boolean setOwner, List<SVMXC.DCON_Configuration_WS.SVMX_StringMap> lstKeyValue) {
        return null;
    }
    webService static String DCON_Unassign_Work_Order_WS(String UserId, List<String> WorkOrderIds) {
        return null;
    }
    webService static String DCON_Unschedule_Work_Order_WS(String UserId, List<String> WorkOrderIds) {
        return null;
    }
global class DCON_WO_MultiAssign_Request {
    @WebService
    webService List<String> EventIds;
    @WebService
    webService List<Event> Eventlist;
    @WebService
    webService List<SVMXC.DCON_Configuration_WS.SVMX_StringMap> lstKeyValue;
    webService String operationType {
        get;
        set;
    }
    @WebService
    webService List<String> technicianIds;
    webService String timezone {
        get;
        set;
    }
    @WebService
    webService List<String> workOrderIds;
    global DCON_WO_MultiAssign_Request() {

    }
    global List<Event> getEventlist() {
        return null;
    }
    global List<String> getworkOrderIds() {
        return null;
    }
    global void setEventlist(List<Event> s) {

    }
    global void setworkOrderIds(List<String> s) {

    }
}
global class DCON_WO_MultiAssign_Response {
    @WebService
    webService List<SVMXC.DCON_Work_Order_WS.DC_StringListMap> lstTechEventDetails;
    global DCON_WO_MultiAssign_Response() {

    }
    global List<SVMXC.DCON_Work_Order_WS.DC_StringListMap> getlstTechEventDetails() {
        return null;
    }
    global void setlstTechEventDetails(List<SVMXC.DCON_Work_Order_WS.DC_StringListMap> s) {

    }
}
global class DC_StringListMap {
    webService String fieldsToNull {
        get;
        set;
    }
    webService String key {
        get;
        set;
    }
    @WebService
    webService List<String> valueList;
    global DC_StringListMap() {

    }
    global DC_StringListMap(String key, List<String> valueList) {

    }
    global List<String> getvalueList() {
        return null;
    }
    global void setvalueList(List<String> s) {

    }
}
global class unassignAssign_WP {
    webService String deletedEvents {
        get;
        set;
    }
    webService List<String> techEventIds {
        get;
        set;
    }
    global unassignAssign_WP() {

    }
}
global class workorderDelta_WP {
    webService List<String> lstDeletedWorkOrderIds {
        get;
        set;
    }
    webService List<String> lstDeltaWorkOrderIds {
        get;
        set;
    }
}
global class workorderInfo_WP {
    @WebService
    webService List<String> dateFields;
    @WebService
    webService List<String> dateTimeFields;
    @WebService
    webService String querySelect;
    @WebService
    webService List<String> refFields;
    @WebService
    webService List<String> replacementField;
    @WebService
    webService List<String> replacementRef;
    global workorderInfo_WP() {

    }
}
global class workorderSpecialFields_WP {
    webService String key {
        get;
        set;
    }
    webService String value {
        get;
        set;
    }
}
global class workorder_WP {
    @WebService
    webService Long lastSyncedTime;
    webService List<SVMXC.DCON_Work_Order_WS.workorderSpecialFields_WP> specialFields_LWP {
        get;
        set;
    }
    webService SVMXC__Service_Order__c workorder_O {
        get;
        set;
    }
}
}
