/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class SMAX_OptiMax_Engine_WS {
    global SMAX_OptiMax_Engine_WS() {

    }
    webService static SVMXC.SMAX_OptiMax_Engine_WS.opCompleteJobs_WP SMAX_Complete_OptiMax_Job_WS(SVMXC.SMAX_OptiMax_Engine_WS.ipCompleteJobs_WP completeJobDetail) {
        return null;
    }
    webService static List<SVMXC.SMAX_OptiMax_Engine_WS.KeyValue> SMAX_Get_Job_Status_WS(List<SVMXC.SMAX_OptiMax_Engine_WS.KeyValue> lstKeyValuePairs) {
        return null;
    }
    webService static List<SVMXC.SMAX_OptiMax_Engine_WS.KeyValue> SMAX_Get_OptiMax_ErrorWO_WS(List<SVMXC.SMAX_OptiMax_Engine_WS.KeyValue> lstKeyValuePairs) {
        return null;
    }
    webService static SVMXC.SMAX_OptiMax_Engine_WS.opInitateJobs_WP SMAX_Initiate_OptiMax_Job_WS(String strUserId, String strTerritoryId, String strDispatchProcessId) {
        return null;
    }
    webService static List<SVMXC.SMAX_OptiMax_Engine_WS.KeyValue> SMAX_Run_Precalc_WS(List<SVMXC.SMAX_OptiMax_Engine_WS.KeyValue> lstKeyValuePairs) {
        return null;
    }
    webService static List<SVMXC.SMAX_OptiMax_Engine_WS.KeyValue> SMAX_Run_QTL_WS(List<SVMXC.SMAX_OptiMax_Engine_WS.KeyValue> lstKeyValuePairs) {
        return null;
    }
global class DestinationNodes_WP {
    webService Datetime arraivalTime {
        get;
        set;
    }
    webService Datetime departureTime {
        get;
        set;
    }
    webService Integer drivingTime {
        get;
        set;
    }
    webService Integer sequenceNo {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.SMAX_OptiMax_Engine_WS.Violations_WP> violations_WPL;
    webService String workorderId {
        get;
        set;
    }
    global DestinationNodes_WP() {

    }
}
global class ExcSetting_WP {
    webService String name {
        get;
        set;
    }
    webService String value {
        get;
        set;
    }
    global ExcSetting_WP() {

    }
    global ExcSetting_WP(String name, String value) {

    }
}
global class ExeLog_WP {
    webService Double logLevel {
        get;
        set;
    }
    webService String message {
        get;
        set;
    }
    webService String operation {
        get;
        set;
    }
    webService Datetime timeStamp {
        get;
        set;
    }
    global ExeLog_WP() {

    }
}
global class ExecutionTime_WP {
    webService Datetime endDate {
        get;
        set;
    }
    webService Datetime startDate {
        get;
        set;
    }
    global ExecutionTime_WP() {

    }
    global ExecutionTime_WP(Datetime dtmStartDateTime, Datetime dtmEndDateTime) {

    }
}
global class Expertise_WP {
    webService String id {
        get;
        set;
    }
    webService String name {
        get;
        set;
    }
    global Expertise_WP() {

    }
}
global class KeyValue {
    webService String name {
        get;
        set;
    }
    webService String value {
        get;
        set;
    }
    global KeyValue() {

    }
    global KeyValue(String name, String value) {

    }
}
global class Location_WP {
    webService String latitude {
        get;
        set;
    }
    webService String longitude {
        get;
        set;
    }
}
global class Product_WP {
    webService String id {
        get;
        set;
    }
    webService String name {
        get;
        set;
    }
    global Product_WP() {

    }
}
global class QualifiedTechnician_WP {
    webService Integer stackRank {
        get;
        set;
    }
    webService String technicianId {
        get;
        set;
    }
    global QualifiedTechnician_WP(String technicianId, Integer stackRank) {

    }
}
global class Route_WP {
    @WebService
    webService List<SVMXC.SMAX_OptiMax_Engine_WS.DestinationNodes_WP> destinationNodes_WPL;
    webService String resourceId {
        get;
        set;
    }
    webService String routeId {
        get;
        set;
    }
    webService SVMXC.SMAX_OptiMax_Engine_WS.TotalRouteTime_WP routeTime {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.SMAX_OptiMax_Engine_WS.Violations_WP> violations_WPL;
    global Route_WP() {

    }
}
global class Statics_WP {
    webService String statName {
        get;
        set;
    }
    webService String unit {
        get;
        set;
    }
    webService Double units {
        get;
        set;
    }
    webService String value {
        get;
        set;
    }
    global Statics_WP() {

    }
}
global class Status_WP {
    webService String event {
        get;
        set;
    }
    webService String message {
        get;
        set;
    }
    webService String tag {
        get;
        set;
    }
    global Status_WP() {

    }
}
global class TechnicianDetail_WP {
    webService SVMXC.SMAX_OptiMax_Engine_WS.Location_WP location {
        get;
        set;
    }
    webService String technicianId {
        get;
        set;
    }
    global TechnicianDetail_WP() {

    }
}
global class Technician_WP {
    webService String Address {
        get;
        set;
    }
    webService Double avgSpeed {
        get;
        set;
    }
    webService Double capacity {
        get;
        set;
    }
    webService String currentAddress {
        get;
        set;
    }
    webService Double currentLatitude {
        get;
        set;
    }
    webService Double currentLongitude {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.SMAX_OptiMax_Engine_WS.ExecutionTime_WP> ExecutionTime_WPL;
    webService Double fixedCost {
        get;
        set;
    }
    webService Double latitude {
        get;
        set;
    }
    webService Double longitude {
        get;
        set;
    }
    webService Double maxDailyHours {
        get;
        set;
    }
    webService Double maxDistance {
        get;
        set;
    }
    webService Double maxHours {
        get;
        set;
    }
    webService Double maxWeekHours {
        get;
        set;
    }
    webService Double perHourCost {
        get;
        set;
    }
    webService Double perMileCost {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.SMAX_OptiMax_Engine_WS.Expertise_WP> techExpertise_WPL;
    webService String technicianId {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.SMAX_OptiMax_Engine_WS.Product_WP> techProduct_WPL;
    webService String territoryGuid {
        get;
        set;
    }
    global Technician_WP(SVMXC__Service_Group_Members__c objTechnician, List<SVMXC.SMAX_OptiMax_Engine_WS.ExecutionTime_WP> eventTime, List<SVMXC.SMAX_OptiMax_Engine_WS.Product_WP> products, List<SVMXC.SMAX_OptiMax_Engine_WS.Expertise_WP> skills) {

    }
    global Technician_WP(SVMXC__Service_Group_Members__c objTechnician, List<SVMXC.SMAX_OptiMax_Engine_WS.ExecutionTime_WP> eventTime, List<SVMXC.SMAX_OptiMax_Engine_WS.Product_WP> products, List<SVMXC.SMAX_OptiMax_Engine_WS.Expertise_WP> skills, String addOnId) {

    }
    global List<SVMXC.SMAX_OptiMax_Engine_WS.Expertise_WP> gettechExpertise_WPL() {
        return null;
    }
    global List<SVMXC.SMAX_OptiMax_Engine_WS.Product_WP> gettechProduct_WPL() {
        return null;
    }
}
global class TechniciansEvents_WP {
    webService Double eventDuration {
        get;
        set;
    }
    webService String eventId {
        get;
        set;
    }
    webService List<SVMXC.SMAX_OptiMax_Engine_WS.ExecutionTime_WP> eventTimeWindow {
        get;
        set;
    }
    webService Integer importance {
        get;
        set;
    }
    webService String preferredResourceId {
        get;
        set;
    }
    webService Double preferredResourcePriority {
        get;
        set;
    }
    webService String territoryId {
        get;
        set;
    }
    webService Double timeWindowPriority {
        get;
        set;
    }
    global TechniciansEvents_WP() {

    }
    global TechniciansEvents_WP(String strTerritoryId, String strPreferedResource, String strEventId, Datetime dtmStartTime, Datetime dtmEndTime, Double dblTimeWindowPriority, Double dblPreferredResourcePriority, Integer importance) {

    }
}
global class TotalRouteTime_WP {
    webService Datetime endTime {
        get;
        set;
    }
    webService Datetime startTime {
        get;
        set;
    }
    webService Double totalDistance {
        get;
        set;
    }
    webService Double totalDrivingTime {
        get;
        set;
    }
    webService Double totalRouteTime {
        get;
        set;
    }
    global TotalRouteTime_WP() {

    }
}
global class Violations_WP {
    webService String attribute {
        get;
        set;
    }
    webService String category {
        get;
        set;
    }
    webService String value {
        get;
        set;
    }
    global Violations_WP() {

    }
}
global class WorkOrderDetail_WP {
    webService SVMXC.SMAX_OptiMax_Engine_WS.Location_WP location {
        get;
        set;
    }
    webService String workOrderId {
        get;
        set;
    }
    global WorkOrderDetail_WP() {

    }
}
global class WorkOrder_WP {
    webService String Address {
        get;
        set;
    }
    @WebService
    webService SVMXC.SMAX_OptiMax_Engine_WS.ExecutionTime_WP executionTime;
    @WebService
    webService List<SVMXC.SMAX_OptiMax_Engine_WS.ExecutionTime_WP> executionTime_L;
    webService Integer Importance {
        get;
        set;
    }
    webService Double latitude {
        get;
        set;
    }
    webService Double longitude {
        get;
        set;
    }
    webService String preferredResourceId {
        get;
        set;
    }
    webService Double preferredResourcePriority {
        get;
        set;
    }
    webService Double priority {
        get;
        set;
    }
    webService String product {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.SMAX_OptiMax_Engine_WS.QualifiedTechnician_WP> qualifiedTechnicians_LWP;
    webService String skill {
        get;
        set;
    }
    webService Double visitDuration {
        get;
        set;
    }
    @WebService
    webService SVMXC__Service_Order__c wo_O;
    webService String workOrderId {
        get;
        set;
    }
    webService String workOrderType {
        get;
        set;
    }
    global WorkOrder_WP(SVMXC__Service_Order__c objWorkOrder) {

    }
}
global class ipCompleteJobs_WP {
    webService String dispatchProcessId {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.SMAX_OptiMax_Engine_WS.ExeLog_WP> exeLog_WPL;
    webService String jobId {
        get;
        set;
    }
    webService String jobNo {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.SMAX_OptiMax_Engine_WS.Route_WP> route_WPL;
    webService Double scheduleResourceCount {
        get;
        set;
    }
    webService Double scheduleWOCount {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.SMAX_OptiMax_Engine_WS.Statics_WP> statics_WPL;
    @WebService
    webService List<SVMXC.SMAX_OptiMax_Engine_WS.TechnicianDetail_WP> technician_WPL;
    @WebService
    webService List<SVMXC.SMAX_OptiMax_Engine_WS.Status_WP> technicianError_WPL;
    webService String territoryId {
        get;
        set;
    }
    webService Datetime timeOfComp {
        get;
        set;
    }
    @WebService
    webService SVMXC.SMAX_OptiMax_Engine_WS.TotalRouteTime_WP totalRouteTime_WP;
    @WebService
    webService List<SVMXC.SMAX_OptiMax_Engine_WS.WorkOrderDetail_WP> workOrder_WPL;
    @WebService
    webService List<SVMXC.SMAX_OptiMax_Engine_WS.Status_WP> workOrderError_WPL;
    global ipCompleteJobs_WP() {

    }
}
global class opCompleteJobs_WP {
    webService Integer status {
        get;
        set;
    }
    webService String statusMessage {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.SMAX_OptiMax_Engine_WS.Violations_WP> violations_WPL;
    global opCompleteJobs_WP() {

    }
}
global class opInitateJobs_WP {
    @WebService
    webService List<SVMXC.SMAX_OptiMax_Engine_WS.ExcSetting_WP> Exec_SettingsMap;
    webService String jobId {
        get;
        set;
    }
    webService String jobNo {
        get;
        set;
    }
    webService String message {
        get;
        set;
    }
    webService Double sentEventCount {
        get;
        set;
    }
    webService Double sentTechCount {
        get;
        set;
    }
    webService Double sentWOCount {
        get;
        set;
    }
    webService Double status {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.SMAX_OptiMax_Engine_WS.Technician_WP> technician_LWP;
    @WebService
    webService List<SVMXC.SMAX_OptiMax_Engine_WS.TechniciansEvents_WP> technicianEvent_LWP;
    @WebService
    webService List<SVMXC.SMAX_OptiMax_Engine_WS.WorkOrder_WP> workOrder_LWP;
    global opInitateJobs_WP() {

    }
    global List<SVMXC.SMAX_OptiMax_Engine_WS.ExcSetting_WP> getExec_SettingsMap() {
        return null;
    }
    global List<SVMXC.SMAX_OptiMax_Engine_WS.TechniciansEvents_WP> gettechnicianEvent_LWP() {
        return null;
    }
    global List<SVMXC.SMAX_OptiMax_Engine_WS.Technician_WP> gettechnician_LWP() {
        return null;
    }
    global List<SVMXC.SMAX_OptiMax_Engine_WS.WorkOrder_WP> getworkOrder_LWP() {
        return null;
    }
}
}
