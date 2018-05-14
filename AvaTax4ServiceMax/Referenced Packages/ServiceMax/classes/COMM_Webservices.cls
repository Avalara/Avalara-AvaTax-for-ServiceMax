/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class COMM_Webservices {
    global COMM_Webservices() {

    }
    webService static List<SVMXC.COMM_Webservices.KeyValue> SVMX_CURD_OnServiceMaxProperties_WS(List<SVMXC.COMM_Webservices.KeyValue> inputRequest) {
        return null;
    }
    webService static List<SVMXC.COMM_Webservices.KeyValue> SVMX_GetSvmxVersion(List<SVMXC.COMM_Webservices.KeyValue> request) {
        return null;
    }
    webService static Boolean SVMX_createSchedulersForAPLUDAT_WS(String strParam, Boolean isAPL) {
        return null;
    }
    webService static List<SVMXC.COMM_Webservices.KeyValue> SVMX_doPerform_WS(List<SVMXC.COMM_Webservices.KeyValue> request) {
        return null;
    }
    webService static List<String> SVMX_getPermittedStandardObjectList_WS() {
        return null;
    }
    webService static List<SVMXC__ServiceMax_Property_Elements__c> SVMX_getPropertyElements_WS() {
        return null;
    }
    webService static Boolean SVMX_isEnterpriseLicense_WS() {
        return null;
    }
    webService static Boolean SVMX_isObjectLicensed_WS(String refObjName) {
        return null;
    }
    webService static Boolean SVMX_updateLicenseType_WS(String licenseKey, String licenseType, String devKey) {
        return null;
    }
    webService static Boolean SVMX_updatePropertyElements_WS(List<SVMXC__ServiceMax_Property_Elements__c> propEleLst, String licenseKey, String licenseType, String devKey) {
        return null;
    }
    webService static List<SVMXC.COMM_Webservices.ObjectDefination> getObjectDefination_WS() {
        return null;
    }
    webService static String saveDescribeLayoutCache_WS(String recordTypePicklist, String strObjectName) {
        return null;
    }
    webService static String saveDescribeObjectCache_WS(String dependendPicklist, String strObjectName) {
        return null;
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
global class ObjectDefination {
    webService String objectLabel {
        get;
        set;
    }
    webService String objectName {
        get;
        set;
    }
    @WebService
    webService List<String> picklistFields;
    @WebService
    webService List<String> recordTypeId;
    global ObjectDefination() {

    }
    global ObjectDefination(String objectName, List<String> recordTypeId, List<String> picklistFields) {

    }
    global ObjectDefination(String objectName, List<String> recordTypeId, List<String> picklistFields, String objectLabel) {

    }
}
}
