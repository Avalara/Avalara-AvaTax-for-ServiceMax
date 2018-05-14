/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class INVT_WrapperDef {
    global INVT_WrapperDef() {

    }
global class INVT_Request {
    @WebService
    webService List<SVMXC.INVT_WrapperDef.INVT_StringListMap> listOfStringlistMap;
    @WebService
    webService List<SVMXC.INVT_WrapperDef.INVT_StringMap> listOfStringMap;
    global INVT_Request() {

    }
    global List<SVMXC.INVT_WrapperDef.INVT_StringMap> getListOfStringMap() {
        return null;
    }
    global List<SVMXC.INVT_WrapperDef.INVT_StringListMap> getListOfStringlistMap() {
        return null;
    }
    global void setListOfStringMap(List<SVMXC.INVT_WrapperDef.INVT_StringMap> s) {

    }
    global void setListOfStringlistMap(List<SVMXC.INVT_WrapperDef.INVT_StringListMap> s) {

    }
}
global class INVT_Response {
    @WebService
    webService List<SVMXC.INVT_WrapperDef.SVMXMessage> listOfMessage;
    @WebService
    webService Boolean success;
    @WebService
    webService Boolean validationSuccess;
    global INVT_Response() {

    }
    global List<SVMXC.INVT_WrapperDef.SVMXMessage> getListOfMessage() {
        return null;
    }
    global Boolean getSuccess() {
        return null;
    }
    global Boolean getValidationSuccess() {
        return null;
    }
    global void setListOfMessage(List<SVMXC.INVT_WrapperDef.SVMXMessage> s) {

    }
    global void setSuccess(Boolean s) {

    }
    global void setValidationSuccess(Boolean validationSuccess) {

    }
}
global class INVT_StringListMap {
    webService String key {
        get;
        set;
    }
    @WebService
    webService List<String> valueList;
    global INVT_StringListMap() {

    }
    global INVT_StringListMap(String key, List<String> valueList) {

    }
    global List<String> getvalueList() {
        return null;
    }
    global void setvalueList(List<String> s) {

    }
}
global class INVT_StringMap {
    webService String key {
        get;
        set;
    }
    webService String value {
        get;
        set;
    }
    global INVT_StringMap() {

    }
    global INVT_StringMap(String k, String v) {

    }
}
global class SVMXMessage {
    webService String details {
        get;
        set;
    }
    webService String key {
        get;
        set;
    }
    webService String message {
        get;
        set;
    }
    global SVMXMessage() {

    }
    global SVMXMessage(String message, String details) {

    }
    global SVMXMessage(String message, String details, String key) {

    }
}
}
