/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class WSCH_CommonUtils {
    global static String workOrderFields;
    global WSCH_CommonUtils() {

    }
    global static void deleteWORelatedEventsOnCancel(Set<SVMXC__Service_Order__c> workOrders) {

    }
    global static String fetchExternalIdByTerritoryId(String TerritoryId) {
        return null;
    }
    global static List<SVMXC__Service_Order_Dependency__c> fetchGroupDependency(String groupDependencyId) {
        return null;
    }
    global static SVMXC__SVMX_Optimizer__c fetchOptimizerByExtId(String extId) {
        return null;
    }
    global static SVMXC__Service_Order__c fetchRequiredFieldById(String strWoId, String strQuery) {
        return null;
    }
    global static List<SVMXC__Service_Order__c> fetchRequiredField(List<String> woIdList, String strQuery) {
        return null;
    }
    global static Map<Id,SVMXC__ServiceMax_Processes__c> fetchRules(String ruleType, String srcName) {
        return null;
    }
    global static List<Event> fetchSFEventByWhatId(Set<String> whatIds) {
        return null;
    }
    global static Event fetchSFEventObjectById(String eventId) {
        return null;
    }
    global static SVMXC__Service_Group_Members__c fetchSFUserTechnicianId(String ownerId) {
        return null;
    }
    global static List<SVMXC__SVMX_Event__c> fetchSVMXEventByWhatId(Set<String> whatIds) {
        return null;
    }
    global static SVMXC__SVMX_Event__c fetchSVMXEventObjectById(String eventId) {
        return null;
    }
    global static List<SVMXC__SVMX_Optimizer__c> fetchSVMXOptimizerById(List<String> eventIdList) {
        return null;
    }
    global static List<SVMXC__SVMX_Optimizer__c> fetchSVMXOptimizerByWhatId(List<String> whatIdList) {
        return null;
    }
    global static SVMXC__Service_Group_Members__c fetchTechnicianById(String techId) {
        return null;
    }
    global static String fetchTerritoryIdByExternalId(String ExternalId) {
        return null;
    }
    global static SVMXC__Service_Order__c fetchWorkOrderById(String strWoId) {
        return null;
    }
    global static SVMXC__Service_Order__c fetchWorkOrderByName(String strWoName) {
        return null;
    }
    global static List<SVMXC__Service_Order__c> fetchWorkOrders(List<String> woIdList) {
        return null;
    }
    global static List<SVMXC.WSCH_Provider_SP_StubsV91.DateAndTimeRange> getClosedHoursForHolidays(Date startDate, Date endDate, BusinessHours businessHr, Integer tzOffsetinMinutes, List<Holiday> lstHoliday) {
        return null;
    }
    global static Map<Id,SVMXC__ServiceMax_Processes__c> getContinuousDP() {
        return null;
    }
    global static String getDispatchProcessIdByName(String dispatchProcessName) {
        return null;
    }
    global static String getGlobalUtilValMap(String strKey) {
        return null;
    }
    global static SVMXC__Service_Group_Members__c getNonWOEventTechnician(SVMXC__SVMX_Optimizer__c event) {
        return null;
    }
    global static String getServiceMaxJobStatus(String spDispatchStatus) {
        return null;
    }
    global static String getServicePowerJobStatus(String svmxDispatchStatus) {
        return null;
    }
    global static String getSettingValue(String subModuleId, String setttingId) {
        return null;
    }
    global static Map<String,String> getTerritoryFRUMap(List<SVMXC__SVMX_Optimizer__c> events) {
        return null;
    }
    global static Map<String,String> getTerritoryFRUMap(List<SVMXC__Service_Order__c> workOrders) {
        return null;
    }
    global static List<SVMXC__Service_Order__c> getUpdateableWo(List<SVMXC__Service_Order__c> WoList) {
        return null;
    }
    global static String getWorkorderFields() {
        return null;
    }
    global static Boolean isCronJobRunning(String cronJobName) {
        return null;
    }
    global static Boolean isEventValid(SVMXC__SVMX_Optimizer__c event) {
        return null;
    }
    global static Boolean isOptimizerEnabled() {
        return null;
    }
    global static Boolean isSFEvent(SVMXC__SVMX_Optimizer__c event) {
        return null;
    }
    global static Boolean isSVMXEvent(SVMXC__SVMX_Optimizer__c event) {
        return null;
    }
    global static String resolveOptimaxStatus(String oldStatus, String newStatus) {
        return null;
    }
    global static void setOptimizerErrorText(SVMXC__Dependency_Management__c depManagement, String errorText) {

    }
    global static void setOptimizerErrorText(SVMXC__Service_Order_Dependency__c serviceOrder, String errorText) {

    }
    global static void setOptimizerErrorText(SVMXC__Service_Order__c workOrder, String errorText) {

    }
    global static void startSyncScheduler() {

    }
}
