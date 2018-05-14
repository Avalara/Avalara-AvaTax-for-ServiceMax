/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class SFM_WrapperDef {
    global SFM_WrapperDef() {

    }
global class FieldProperties {
    webService String fieldsToNull {
        get;
        set;
    }
    webService String key {
        get;
        set;
    }
    webService List<SVMXC.SFM_WrapperDef.SFM_StringMap> properties {
        get;
        set;
    }
    webService String value {
        get;
        set;
    }
    global FieldProperties(String key) {

    }
    global FieldProperties(String key, String value) {

    }
    global FieldProperties(String key, String value, List<SVMXC.SFM_WrapperDef.SFM_StringMap> properties) {

    }
}
global class FieldSetInfo {
    webService String fieldSetAPIName {
        get;
        set;
    }
    webService String fieldSetLabel {
        get;
        set;
    }
    global FieldSetInfo(String fieldSetAPIName, String fieldSetLabel) {

    }
}
global class FieldSetWithSorting {
    @WebService
    webService Id fieldMapId;
    @WebService
    webService List<String> lstFieldSetAPIName;
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SortingRec> lstSortingRec;
    @WebService
    webService Id pageLayoutId;
    @WebService
    webService String strObjectName;
    @WebService
    webService Id valueMapId;
    global FieldSetWithSorting() {

    }
    global FieldSetWithSorting(List<String> lstFieldSetAPIName, List<SVMXC.SFM_WrapperDef.SortingRec> lstSortingRec, String strObjectName, Id fieldMapId, Id valueMapId, Id pageLayoutId) {

    }
}
global class FieldsetDefinition {
    @WebService
    webService List<SVMXC.SFM_WrapperDef.FieldSetInfo> fieldsetInfo;
    webService String objectAPIName {
        get;
        set;
    }
    global FieldsetDefinition(String objectAPIName, List<SVMXC.SFM_WrapperDef.FieldSetInfo> fieldsetInfo) {

    }
}
global class PMaxException extends Exception {
}
global class SFM_AdvCrieteriaDefinition {
    webService Boolean allowOverride {
        get;
        set;
    }
    webService Boolean defaultOn {
        get;
        set;
    }
    webService String filterCriteria {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_FieldDefinition> filterCriteriaFields;
    webService String filterName {
        get;
        set;
    }
    webService String filterObject {
        get;
        set;
    }
    webService String key {
        get;
        set;
    }
    webService String lookupField {
        get;
        set;
    }
    global SFM_AdvCrieteriaDefinition(SVMXC__ServiceMax_Processes__c objProcess, List<SVMXC__ServiceMax_Config_Data__c> lstConfigData) {

    }
}
global class SFM_BizRuleInfo {
    @WebService
    webService SVMXC__ServiceMax_Processes__c bizRule;
    @WebService
    webService List<SVMXC__ServiceMax_Config_Data__c> bizRuleDetails;
    global SFM_BizRuleInfo() {

    }
    global SFM_BizRuleInfo(SVMXC__ServiceMax_Processes__c bizRule, List<SVMXC__ServiceMax_Config_Data__c> bizRuleDetails) {

    }
    global SVMXC__ServiceMax_Processes__c getbizRule() {
        return null;
    }
    global List<SVMXC__ServiceMax_Config_Data__c> getbizRuleDetails() {
        return null;
    }
    global void setbizRule(SVMXC__ServiceMax_Processes__c bizRule) {

    }
    global void setbizRuleDetails(List<SVMXC__ServiceMax_Config_Data__c> bizRuleDetails) {

    }
}
global class SFM_BubbleWrapper {
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_StringMap> bubbleinfo;
    webService String fieldapiname {
        get;
        set;
    }
    @WebService
    webService SVMXC.SFM_WrapperDef.SFM_StringMap fieldvalue;
    webService SVMXC.SFM_WrapperDef.SFM_Response response {
        get;
        set;
    }
    global SFM_BubbleWrapper() {

    }
}
global class SFM_ChecklistInfo {
    webService Datetime completionDate {
        get;
        set;
    }
    webService String description {
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
    webService String recordId {
        get;
        set;
    }
    webService String sfProcessId {
        get;
        set;
    }
    webService String status {
        get;
        set;
    }
    webService String targetId {
        get;
        set;
    }
    global SFM_ChecklistInfo() {

    }
    global SFM_ChecklistInfo(String recordId, String processId, String processName, String status) {

    }
    global SFM_ChecklistInfo(String recordId, String processId, String processName, String status, String targetId, String description, Datetime completionDate) {

    }
    global SFM_ChecklistInfo(String recordId, String processId, String processName, String status, String targetId, String description, Datetime completionDate, String sfProcessId) {

    }
}
global class SFM_DetailBubbleWrapper {
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_BubbleWrapper> bubbleinfolist;
    @WebService
    webService SObject sobjectinfo;
    webService String sourceRecordId {
        get;
        set;
    }
    global SFM_DetailBubbleWrapper() {

    }
}
global class SFM_DetailDataSet {
    webService String aliasName {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_PageDataSet> pageDataSet;
    global SFM_DetailDataSet() {

    }
    global List<SVMXC.SFM_WrapperDef.SFM_PageDataSet> getpageDataSet() {
        return null;
    }
    global void setpageDataSet(List<SVMXC.SFM_WrapperDef.SFM_PageDataSet> pageDataSet) {

    }
}
global class SFM_DocTemplate {
    webService String contentBody {
        get;
        set;
    }
    webService Attachment contentRecord {
        get;
        set;
    }
    @WebService
    webService List<SVMXC__Doc_Template_Details__c> templateDetails;
    webService SVMXC__Doc_Template__c templateRecord {
        get;
        set;
    }
    global SFM_DocTemplate() {

    }
    global SFM_DocTemplate(SVMXC__Doc_Template__c templateRecord, List<SVMXC__Doc_Template_Details__c> templateDetails, Attachment contentRecord, String contentBody) {

    }
}
global class SFM_Expression {
    @WebService
    webService List<SVMXC__ServiceMax_Config_Data__c> expressionDetails;
    webService String fieldsToNull {
        get;
        set;
    }
    @WebService
    webService SVMXC__ServiceMax_Processes__c namedExpression;
    global SFM_Expression() {

    }
    global SFM_Expression(SVMXC__ServiceMax_Processes__c namedExpression, List<SVMXC__ServiceMax_Config_Data__c> expressionDetails) {

    }
    global List<SVMXC__ServiceMax_Config_Data__c> getexpressionDetails() {
        return null;
    }
    global SVMXC__ServiceMax_Processes__c getnamedExpression() {
        return null;
    }
    global void setexpressionDetails(List<SVMXC__ServiceMax_Config_Data__c> s) {

    }
    global void setnamedExpression(SVMXC__ServiceMax_Processes__c s) {

    }
}
global class SFM_FieldDefinition {
    webService String apiName {
        get;
        set;
    }
    webService String dataType {
        get;
        set;
    }
    webService String fieldRelationshipName {
        get;
        set;
    }
    webService String operandType {
        get;
        set;
    }
    webService String refObjectName {
        get;
        set;
    }
    webService String refObjectNameField {
        get;
        set;
    }
    webService Decimal sequence {
        get;
        set;
    }
    global SFM_FieldDefinition() {

    }
    global SFM_FieldDefinition(SVMXC__ServiceMax_Config_Data__c ConfigData) {

    }
}
global class SFM_FieldMapping {
    @WebService
    webService SVMXC__ServiceMax_Config_Data__c fieldMapRecord;
    webService String fieldsToNull {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_StringMap> sourceFields;
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_StringMap> sourceFieldsConstant;
    global SFM_FieldMapping() {

    }
    global SFM_FieldMapping(SVMXC__ServiceMax_Config_Data__c fieldMap, List<SVMXC.SFM_WrapperDef.SFM_StringMap> sfields) {

    }
    global List<SVMXC.SFM_WrapperDef.SFM_StringMap> sourceFieldsConstant() {
        return null;
    }
    global void sourceFieldsConstant(List<SVMXC.SFM_WrapperDef.SFM_StringMap> s) {

    }
}
global class SFM_FieldUpdateRuleInfo {
    @WebService
    webService SVMXC__ServiceMax_Processes__c fieldUpdateRule;
    @WebService
    webService List<SVMXC__ServiceMax_Config_Data__c> fieldUpdateRuleDetails;
    global SFM_FieldUpdateRuleInfo() {

    }
    global SVMXC__ServiceMax_Processes__c getFieldUpdateRule() {
        return null;
    }
    global List<SVMXC__ServiceMax_Config_Data__c> getFieldUpdateRuleDetails() {
        return null;
    }
    global void setFieldUpdateRule(SVMXC__ServiceMax_Processes__c fieldUpdateRule) {

    }
    global void setFieldUpdateRuleDetails(List<SVMXC__ServiceMax_Config_Data__c> fieldUpdateRuleDetails) {

    }
}
global class SFM_LookUpConfigData {
    webService List<SVMXC.SFM_WrapperDef.bubble_wp> data {
        get;
        set;
    }
    webService SVMXC.SFM_WrapperDef.SFM_Response_NamedSearchInfo namesearchinfo {
        get;
        set;
    }
    webService SVMXC.SFM_WrapperDef.SFM_Response response {
        get;
        set;
    }
    global SFM_LookUpConfigData() {

    }
}
global class SFM_LookupDefinition {
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_AdvCrieteriaDefinition> advFilters;
    webService String key {
        get;
        set;
    }
    @WebService
    webService SVMXC.SFM_WrapperDef.SFM_LookupDefinitionDetail lookupDefDetail;
    webService String objectName {
        get;
        set;
    }
    global SFM_LookupDefinition() {

    }
    global SFM_LookupDefinition(SVMXC__ServiceMax_Processes__c objProcess, List<SVMXC__ServiceMax_Config_Data__c> lstConfigData) {

    }
    global SFM_LookupDefinition(SVMXC__ServiceMax_Processes__c objProcess, List<SVMXC__ServiceMax_Config_Data__c> lstConfigData, Map<SVMXC__ServiceMax_Processes__c,List<SVMXC__ServiceMax_Config_Data__c>> mapAdvFilter) {

    }
}
global class SFM_LookupDefinitionDetail {
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_FieldDefinition> bubbleFields;
    webService String defaultLookupColumn {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_FieldDefinition> displayFields;
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_FieldDefinition> formFillFields;
    webService Double numberOfRecs {
        get;
        set;
    }
    webService String preFilterCriteria {
        get;
        set;
    }
    webService String queryColumns {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_FieldDefinition> searchFields;
    global SFM_LookupDefinitionDetail() {

    }
    global SFM_LookupDefinitionDetail(SVMXC__ServiceMax_Processes__c objProcess, List<SVMXC__ServiceMax_Config_Data__c> lstConfigData) {

    }
    global List<SVMXC.SFM_WrapperDef.SFM_FieldDefinition> getbubbleFields() {
        return null;
    }
    global List<SVMXC.SFM_WrapperDef.SFM_FieldDefinition> getdisplayFields() {
        return null;
    }
    global List<SVMXC.SFM_WrapperDef.SFM_FieldDefinition> getsearchFields() {
        return null;
    }
    global void setbubbleFields(List<SVMXC.SFM_WrapperDef.SFM_FieldDefinition> bubbleFields) {

    }
    global void setdisplayFields(List<SVMXC.SFM_WrapperDef.SFM_FieldDefinition> displayFields) {

    }
    global void setsearchFields(List<SVMXC.SFM_WrapperDef.SFM_FieldDefinition> searchFields) {

    }
}
global class SFM_LookupRequest {
    webService String contextMatchField {
        get;
        set;
    }
    webService String contextValue {
        get;
        set;
    }
    webService String Keyword {
        get;
        set;
    }
    webService SVMXC.SFM_WrapperDef.SFM_LookupDefinition lookupDef {
        get;
        set;
    }
    webService String operator {
        get;
        set;
    }
    global SFM_LookupRequest() {

    }
}
global class SFM_MapStringMap {
    webService String fieldsToNull {
        get;
        set;
    }
    webService String key {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_StringMap> valueMap;
    global SFM_MapStringMap() {

    }
    global SFM_MapStringMap(String key, List<SVMXC.SFM_WrapperDef.SFM_StringMap> valueMap) {

    }
    global List<SVMXC.SFM_WrapperDef.SFM_StringMap> getvalueList() {
        return null;
    }
    global void setvalueMap(List<SVMXC.SFM_WrapperDef.SFM_StringMap> s) {

    }
}
global class SFM_NamedSearch {
    webService String fieldsToNull {
        get;
        set;
    }
    @WebService
    webService SVMXC__ServiceMax_Processes__c namedSearch;
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_NamedSearchDetail> namedSearchDetails;
    global SFM_NamedSearch() {

    }
    global SFM_NamedSearch(SVMXC__ServiceMax_Processes__c namedSearch, List<SVMXC.SFM_WrapperDef.SFM_NamedSearchDetail> namedSearchDetails) {

    }
}
global class SFM_NamedSearchDetail {
    @WebService
    webService List<SVMXC__ServiceMax_Config_Data__c> displayFields;
    webService String fieldsToNull {
        get;
        set;
    }
    @WebService
    webService List<SVMXC__ServiceMax_Config_Data__c> searchFields;
    @WebService
    webService SVMXC__ServiceMax_Processes__c searchObject;
    global SFM_NamedSearchDetail(SVMXC__ServiceMax_Processes__c searchObject, List<SVMXC__ServiceMax_Config_Data__c> searchFields, List<SVMXC__ServiceMax_Config_Data__c> displayFields) {

    }
}
global class SFM_NamedSearchInfo {
    webService List<SVMXC.SFM_WrapperDef.SFM_NamedSearchInfoDetail> advNamedSearchDetails {
        get;
        set;
    }
    webService String fieldsToNull {
        get;
        set;
    }
    webService List<SVMXC.SFM_WrapperDef.SFM_NamedSearchInfoDetail> namedSearchDetails {
        get;
        set;
    }
    webService SVMXC__ServiceMax_Processes__c namedSearchHdr {
        get;
        set;
    }
    global SFM_NamedSearchInfo() {

    }
    global SFM_NamedSearchInfo(SVMXC__ServiceMax_Processes__c namedSearchHdr, List<SVMXC.SFM_WrapperDef.SFM_NamedSearchInfoDetail> namedSearchDetails) {

    }
}
global class SFM_NamedSearchInfoDetail {
    webService List<SVMXC__ServiceMax_Config_Data__c> expressionFields {
        get;
        set;
    }
    webService List<SVMXC__ServiceMax_Config_Data__c> fields {
        get;
        set;
    }
    webService String fieldsToNull {
        get;
        set;
    }
    webService SVMXC__ServiceMax_Processes__c objectDetails {
        get;
        set;
    }
    webService String uniqueId {
        get;
        set;
    }
    global SFM_NamedSearchInfoDetail() {

    }
    global SFM_NamedSearchInfoDetail(SVMXC__ServiceMax_Processes__c objectDetails, List<SVMXC__ServiceMax_Config_Data__c> fields) {

    }
}
global class SFM_Object {
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_StringMap> childObjects;
    webService String fieldsToNull {
        get;
        set;
    }
    @WebService
    webService SVMXC.SFM_WrapperDef.SFM_StringMap parentObject;
    global SFM_Object(SVMXC.SFM_WrapperDef.SFM_StringMap parentObject, List<SVMXC.SFM_WrapperDef.SFM_StringMap> childObjects) {

    }
}
global class SFM_ObjectMap {
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_FieldMapping> fields;
    webService String fieldsToNull {
        get;
        set;
    }
    @WebService
    webService SVMXC__ServiceMax_Processes__c objectMap;
    global SFM_ObjectMap() {

    }
    global SFM_ObjectMap(SVMXC__ServiceMax_Processes__c objectMap, List<SVMXC.SFM_WrapperDef.SFM_FieldMapping> fields) {

    }
    global List<SVMXC.SFM_WrapperDef.SFM_FieldMapping> fields() {
        return null;
    }
    global void fields(List<SVMXC.SFM_WrapperDef.SFM_FieldMapping> s) {

    }
    global SVMXC__ServiceMax_Processes__c getobjectMap() {
        return null;
    }
    global void setobjectMap(SVMXC__ServiceMax_Processes__c s) {

    }
}
global class SFM_ObjectMapInfo {
    webService String mapId {
        get;
        set;
    }
    @WebService
    webService SVMXC.SFM_WrapperDef.SFM_ObjectMap objectMap;
    global SFM_ObjectMapInfo(String mapId, SVMXC.SFM_WrapperDef.SFM_ObjectMap objectMap) {

    }
}
global class SFM_PageData {
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_DetailDataSet> detailDataSet;
    webService String eventType {
        get;
        set;
    }
    webService String fieldsToNull {
        get;
        set;
    }
    @WebService
    webService SVMXC.SFM_WrapperDef.SFM_PageDataSet pageDataSet;
    webService SVMXC.SFM_WrapperDef.SFM_Response response {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_StringMap> svmxConstants;
    global SFM_PageData() {

    }
    global List<SVMXC.SFM_WrapperDef.SFM_DetailDataSet> getdetailDataset() {
        return null;
    }
    global SVMXC.SFM_WrapperDef.SFM_PageDataSet getpageDataSet() {
        return null;
    }
    global void setdetailDataset(List<SVMXC.SFM_WrapperDef.SFM_DetailDataSet> detailDataSet) {

    }
    global void setpageDataSet(SVMXC.SFM_WrapperDef.SFM_PageDataSet pageDataSet) {

    }
}
global class SFM_PageDataSet {
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_BubbleWrapper> bubbleInfo;
    webService SVMXC.SFM_WrapperDef.SFM_Response response {
        get;
        set;
    }
    webService SObject sobjectinfo {
        get;
        set;
    }
    webService String sourceRecordID {
        get;
        set;
    }
    global SFM_PageDataSet() {

    }
    global List<SVMXC.SFM_WrapperDef.SFM_BubbleWrapper> getbubbleInfo() {
        return null;
    }
    global void setbubbleInfo(List<SVMXC.SFM_WrapperDef.SFM_BubbleWrapper> bubbleInfo) {

    }
}
global class SFM_PageDetail {
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_DetailBubbleWrapper> bubbleinfolist;
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_UIButton> buttons;
    @WebService
    webService SVMXC__Page_Layout__c DetailLayout;
    webService String dtlLayoutId {
        get;
        set;
    }
    @WebService
    webService List<SVMXC__SFM_Event__c> events;
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_UIField> fields;
    webService String fieldsToNull {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.SFM_WrapperDef.linkedProcessDetail> linkedProcesses;
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_StringMap> mappedLiterals;
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_StringMap> mappedValues;
    @WebService
    webService Integer noOfColumns;
    @WebService
    webService SObject recordTemplate;
    global SFM_PageDetail() {

    }
    global SFM_PageDetail(SVMXC__Page_Layout__c DetailLayout, List<SVMXC.SFM_WrapperDef.SFM_UIField> fields, List<SVMXC.SFM_WrapperDef.SFM_UIButton> buttons, List<SVMXC.SFM_WrapperDef.SFM_DetailBubbleWrapper> bubbleinfolist) {

    }
}
global class SFM_PageHeader {
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_UIButton> buttons;
    @WebService
    webService Boolean enableAttachment;
    webService String fieldsToNull {
        get;
        set;
    }
    webService SObject hdrData {
        get;
        set;
    }
    webService String hdrLayoutId {
        get;
        set;
    }
    @WebService
    webService SVMXC__Page_Layout__c headerLayout;
    @WebService
    webService List<SVMXC__SFM_Event__c> pageEvents;
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_UISection> sections;
    webService String sourceRecordId {
        get;
        set;
    }
    global SFM_PageHeader() {

    }
    global SFM_PageHeader(SVMXC__Page_Layout__c headerLayout, List<SVMXC.SFM_WrapperDef.SFM_UISection> sections, List<SVMXC.SFM_WrapperDef.SFM_UIButton> buttons, List<SVMXC__SFM_Event__c> pageEvents) {

    }
}
global class SFM_PageUI {
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_ProcessBusinessRule> businessRules;
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_PageDetail> details;
    webService String fieldsToNull {
        get;
        set;
    }
    @WebService
    webService SVMXC.SFM_WrapperDef.SFM_PageHeader header;
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_LookupDefinition> lookupDefinitions;
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_ObjectMapInfo> lstObjectMapInfo;
    webService String processTitle {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_StringMap> recordTypeList;
    global SFM_PageUI() {

    }
    global SFM_PageUI(SVMXC.SFM_WrapperDef.SFM_PageHeader header, List<SVMXC.SFM_WrapperDef.SFM_PageDetail> details) {

    }
}
global class SFM_ProcessBusinessRule {
    webService String aliasName {
        get;
        set;
    }
    webService String message {
        get;
        set;
    }
    @WebService
    webService SVMXC.SFM_WrapperDef.SFM_BizRuleInfo ruleInfo;
    webService Integer sequence {
        get;
        set;
    }
    global SFM_ProcessBusinessRule() {

    }
    global SFM_ProcessBusinessRule(Integer sequence, String message, String aliasName, SVMXC.SFM_WrapperDef.SFM_BizRuleInfo ruleInfo) {

    }
    global SVMXC.SFM_WrapperDef.SFM_BizRuleInfo getruleInfo() {
        return null;
    }
    global void setruleInfo(SVMXC.SFM_WrapperDef.SFM_BizRuleInfo ruleInfo) {

    }
}
global class SFM_ProcessNodeDetail {
    webService String fieldsToNull {
        get;
        set;
    }
    @WebService
    webService List<SVMXC__ServiceMax_Processes__c> linkedProcesses;
    @WebService
    webService List<SVMXC__ServiceMax_Processes__c> processBizRules;
    @WebService
    webService SVMXC__ServiceMax_Processes__c processNodeObejct;
    @WebService
    webService List<SVMXC__ServiceMax_Config_Data__c> processSourceUpdates;
    global SFM_ProcessNodeDetail() {

    }
    global SFM_ProcessNodeDetail(SVMXC__ServiceMax_Processes__c processNodeObejct, List<SVMXC__ServiceMax_Config_Data__c> processSourceUpdates) {

    }
    global List<SVMXC__ServiceMax_Processes__c> getlinkedProcesses() {
        return null;
    }
    global List<SVMXC__ServiceMax_Processes__c> getprocessBizRules() {
        return null;
    }
    global SVMXC__ServiceMax_Processes__c getprocessNodeObejct() {
        return null;
    }
    global List<SVMXC__ServiceMax_Config_Data__c> getprocessSourceUpdates() {
        return null;
    }
    global void setlinkedProcesses(List<SVMXC__ServiceMax_Processes__c> linkedProcesses) {

    }
    global void setprocessBizRules(List<SVMXC__ServiceMax_Processes__c> proBizRules) {

    }
    global void setprocessNodeObejct(SVMXC__ServiceMax_Processes__c s) {

    }
    global void setprocessSourceUpdates(List<SVMXC__ServiceMax_Config_Data__c> s) {

    }
}
global class SFM_Question {
    webService Boolean active {
        get;
        set;
    }
    webService Boolean captureComments {
        get;
        set;
    }
    webService String description {
        get;
        set;
    }
    webService String helpURL {
        get;
        set;
    }
    webService Double length {
        get;
        set;
    }
    webService Double precision {
        get;
        set;
    }
    webService String question {
        get;
        set;
    }
    webService String questionID {
        get;
        set;
    }
    webService String questionJSON {
        get;
        set;
    }
    webService String responseType {
        get;
        set;
    }
    webService Double scale {
        get;
        set;
    }
    webService String shortname {
        get;
        set;
    }
    global SFM_Question() {

    }
}
global class SFM_QuestionBank {
    @WebService
    webService SVMXC__Question_Bank__c question;
    @WebService
    webService List<SVMXC__QB_Response_Options__c> questionBankResponseOptions;
    @WebService
    webService SVMXC__QB_Response_Set__c questionResponseSet;
    @WebService
    webService List<String> tagsList;
    global SFM_QuestionBank() {

    }
    global SFM_QuestionBank(SVMXC__Question_Bank__c question, List<SVMXC__QB_Response_Options__c> questionBankResponseOptions) {

    }
    global SFM_QuestionBank(SVMXC__Question_Bank__c question, List<SVMXC__QB_Response_Options__c> questionBankResponseOptions, SVMXC__QB_Response_Set__c questionResponseSet) {

    }
    global SFM_QuestionBank(SVMXC__Question_Bank__c question, List<SVMXC__QB_Response_Options__c> questionBankResponseOptions, SVMXC__QB_Response_Set__c questionResponseSet, List<String> tagsLists) {

    }
    global SVMXC__Question_Bank__c getquestion() {
        return null;
    }
    global List<SVMXC__QB_Response_Options__c> getquestionBankResponseOptions() {
        return null;
    }
    global SVMXC__QB_Response_Set__c getquestionResponseSet() {
        return null;
    }
    global void setquestion(SVMXC__Question_Bank__c question) {

    }
    global void setquestionBankResponseOptions(List<SVMXC__QB_Response_Options__c> questionBankResponseOptions) {

    }
    global void setquestionResponseSet(SVMXC__QB_Response_Set__c questionResponseSet) {

    }
}
global class SFM_QuestionInfo {
    @WebService
    webService SVMXC.SFM_WrapperDef.SFM_Question question;
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_QuestionResponse> questionResponses;
    global SFM_QuestionInfo() {

    }
    global SFM_QuestionInfo(SVMXC.SFM_WrapperDef.SFM_Question question, List<SVMXC.SFM_WrapperDef.SFM_QuestionResponse> questionResponses) {

    }
    global SVMXC.SFM_WrapperDef.SFM_Question getquestion() {
        return null;
    }
    global List<SVMXC.SFM_WrapperDef.SFM_QuestionResponse> getquestionResponses() {
        return null;
    }
    global void setquestion(SVMXC.SFM_WrapperDef.SFM_Question question) {

    }
    global void setquestionResponses(List<SVMXC.SFM_WrapperDef.SFM_QuestionResponse> questionResponses) {

    }
}
global class SFM_QuestionResponse {
    webService Boolean active {
        get;
        set;
    }
    webService String questionID {
        get;
        set;
    }
    webService String response {
        get;
        set;
    }
    webService Double sequence {
        get;
        set;
    }
    global SFM_QuestionResponse() {

    }
}
global class SFM_Record {
    webService String fieldsToNull {
        get;
        set;
    }
    webService SObject sobjectinfo {
        get;
        set;
    }
    webService String sourceRecordId {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_StringMap> targetRecordAsKeyValue;
    webService String targetRecordId {
        get;
        set;
    }
    global SFM_Record() {

    }
    global List<SVMXC.SFM_WrapperDef.SFM_StringMap> gettargetRecordAsKeyValue() {
        return null;
    }
    global void settargetRecordAsKeyValue(List<SVMXC.SFM_WrapperDef.SFM_StringMap> targetRecordAsKeyValue) {

    }
}
global class SFM_Request {
    @WebService
    webService SVMXC.SFM_WrapperDef.SFM_BizRuleInfo bizRuleInfo;
    webService SVMXC.SFM_WrapperDef.SFM_DocTemplate docTemplate {
        get;
        set;
    }
    webService String fieldsToNull {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_FieldUpdateRuleInfo> fieldUpdateRuleInfoList;
    webService String groupId {
        get;
        set;
    }
    webService SVMXC.SFM_WrapperDef.SFM_LookupRequest lookupRequest {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_QuestionBank> lstQuestionBank;
    webService String profileId {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_StringListMap> stringListMap;
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_StringMap> stringMap;
    webService String userId {
        get;
        set;
    }
    global SFM_Request() {

    }
    global SFM_Request(String userId, String groupId, String profileId, List<SVMXC.SFM_WrapperDef.SFM_StringMap> stringMap) {

    }
    global List<SVMXC.SFM_WrapperDef.SFM_FieldUpdateRuleInfo> getFieldUpdateRuleInfoList() {
        return null;
    }
    global SVMXC.SFM_WrapperDef.SFM_BizRuleInfo getbizRuleInfo() {
        return null;
    }
    global List<SVMXC.SFM_WrapperDef.SFM_StringListMap> getstringListMap() {
        return null;
    }
    global List<SVMXC.SFM_WrapperDef.SFM_StringMap> getstringMap() {
        return null;
    }
    global void setFieldUpdateRuleInfoList(List<SVMXC.SFM_WrapperDef.SFM_FieldUpdateRuleInfo> fieldUpdateRuleInfoList) {

    }
    global void setbizRuleInfo(SVMXC.SFM_WrapperDef.SFM_BizRuleInfo bizRuleInfo) {

    }
    global void setstringListMap(List<SVMXC.SFM_WrapperDef.SFM_StringListMap> s) {

    }
    global void setstringMap(List<SVMXC.SFM_WrapperDef.SFM_StringMap> s) {

    }
}
global class SFM_Request_Expression {
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_Expression> expressions;
    webService String fieldsToNull {
        get;
        set;
    }
    webService SVMXC.SFM_WrapperDef.SFM_Request request {
        get;
        set;
    }
    global SFM_Request_Expression(List<SVMXC.SFM_WrapperDef.SFM_Expression> expressions) {

    }
    global List<SVMXC.SFM_WrapperDef.SFM_Expression> getexpressions() {
        return null;
    }
    global void setexpressions(List<SVMXC.SFM_WrapperDef.SFM_Expression> s) {

    }
}
global class SFM_Request_FieldProperties {
    webService String fieldAPI {
        get;
        set;
    }
    webService Integer fieldLength {
        get;
        set;
    }
    webService String fieldType {
        get;
        set;
    }
    webService Boolean isCascadeDelete {
        get;
        set;
    }
    webService String referenceTo {
        get;
        set;
    }
    webService String relationshipName {
        get;
        set;
    }
}
global class SFM_Request_GlobalObjects {
    webService String fieldsToNull {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_Object> globalObjects;
    webService SVMXC.SFM_WrapperDef.SFM_Request request {
        get;
        set;
    }
    global SFM_Request_GlobalObjects(List<SVMXC.SFM_WrapperDef.SFM_Object> globalObjects) {

    }
}
global class SFM_Request_IntegrityCheck {
    webService List<SVMXC.SFM_WrapperDef.SFM_Request_ObjectFields> objects {
        get;
        set;
    }
    webService String processId {
        get;
        set;
    }
    global SFM_Request_IntegrityCheck() {

    }
}
global class SFM_Request_NamedSearch {
    webService String fieldsToNull {
        get;
        set;
    }
    webService List<SVMXC__ServiceMax_Processes__c> namedSearch {
        get;
        set;
    }
    webService SVMXC.SFM_WrapperDef.SFM_Request request {
        get;
        set;
    }
    global SFM_Request_NamedSearch(List<SVMXC__ServiceMax_Processes__c> namedSearch) {

    }
}
global class SFM_Request_NamedSearchInfo {
    webService String fieldsToNull {
        get;
        set;
    }
    webService List<SVMXC.SFM_WrapperDef.SFM_NamedSearchInfo> namedSearch {
        get;
        set;
    }
    webService SVMXC.SFM_WrapperDef.SFM_Request request {
        get;
        set;
    }
    global SFM_Request_NamedSearchInfo(List<SVMXC.SFM_WrapperDef.SFM_NamedSearchInfo> namedSearch) {

    }
}
global class SFM_Request_ObjectFields {
    webService List<SVMXC.SFM_WrapperDef.SFM_Request_FieldProperties> fields {
        get;
        set;
    }
    webService String objectAPI {
        get;
        set;
    }
    webService String relatedReference {
        get;
        set;
    }
    webService String relatedTo {
        get;
        set;
    }
    global SFM_Request_ObjectFields() {

    }
}
global class SFM_Request_ObjectMap {
    webService String fieldsToNull {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_ObjectMap> objects;
    webService SVMXC.SFM_WrapperDef.SFM_Request request {
        get;
        set;
    }
    global SFM_Request_ObjectMap() {

    }
    global SFM_Request_ObjectMap(List<SVMXC.SFM_WrapperDef.SFM_ObjectMap> objects) {

    }
    global List<SVMXC.SFM_WrapperDef.SFM_ObjectMap> getobjects() {
        return null;
    }
    global void setobjects(List<SVMXC.SFM_WrapperDef.SFM_ObjectMap> s) {

    }
}
global class SFM_Request_PageList {
    webService String fieldsToNull {
        get;
        set;
    }
    @WebService
    webService List<SVMXC__Page_Layout__c> PageList;
    webService SVMXC.SFM_WrapperDef.SFM_Request request {
        get;
        set;
    }
    global SFM_Request_PageList() {

    }
    global SFM_Request_PageList(List<SVMXC__Page_Layout__c> PageList) {

    }
    global List<SVMXC__Page_Layout__c> getPageList() {
        return null;
    }
    global void setPageList(List<SVMXC__Page_Layout__c> pl) {

    }
}
global class SFM_Request_PageUI {
    webService String fieldsToNull {
        get;
        set;
    }
    @WebService
    webService SVMXC.SFM_WrapperDef.SFM_PageUI page;
    @WebService
    webService SVMXC__ServiceMax_Processes__c processNode;
    webService SVMXC.SFM_WrapperDef.SFM_Request request {
        get;
        set;
    }
    global SFM_Request_PageUI() {

    }
    global SFM_Request_PageUI(SVMXC.SFM_WrapperDef.SFM_PageUI page, SVMXC__ServiceMax_Processes__c processNode, SVMXC.SFM_WrapperDef.SFM_Request pmax) {

    }
}
global class SFM_Request_ProcessNode {
    webService String fieldsToNull {
        get;
        set;
    }
    @WebService
    webService List<SVMXC__ServiceMax_Processes__c> processNodes;
    webService SVMXC.SFM_WrapperDef.SFM_Request request {
        get;
        set;
    }
    global SFM_Request_ProcessNode(List<SVMXC__ServiceMax_Processes__c> processNodes) {

    }
    global List<SVMXC__ServiceMax_Processes__c> getprocessNodes() {
        return null;
    }
    global void setprocessNodes(List<SVMXC__ServiceMax_Processes__c> s) {

    }
}
global class SFM_Request_ProcessNodeInfo {
    webService String fieldsToNull {
        get;
        set;
    }
    @WebService
    webService SVMXC__ServiceMax_Processes__c processNodes;
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_ProcessNodeDetail> processNodeSourceObject;
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_ProcessNodeDetail> processNodeTargetObject;
    webService SVMXC.SFM_WrapperDef.SFM_Request request {
        get;
        set;
    }
    @WebService
    webService List<SVMXC__SFM_Event__c> sfmEvents;
    global SFM_Request_ProcessNodeInfo() {

    }
    global SFM_Request_ProcessNodeInfo(SVMXC__ServiceMax_Processes__c processNodes, List<SVMXC.SFM_WrapperDef.SFM_ProcessNodeDetail> processNodeSourceObject, List<SVMXC.SFM_WrapperDef.SFM_ProcessNodeDetail> processNodeTargetObject) {

    }
    global SFM_Request_ProcessNodeInfo(SVMXC__ServiceMax_Processes__c processNodes, List<SVMXC.SFM_WrapperDef.SFM_ProcessNodeDetail> processNodeSourceObject, List<SVMXC.SFM_WrapperDef.SFM_ProcessNodeDetail> processNodeTargetObject, List<SVMXC__SFM_Event__c> sfmEvents) {

    }
    global List<SVMXC__SFM_Event__c> getSFMEvents() {
        return null;
    }
    global List<SVMXC.SFM_WrapperDef.SFM_ProcessNodeDetail> getprocessNodeTargetObject() {
        return null;
    }
    global SVMXC__ServiceMax_Processes__c getprocessNodes() {
        return null;
    }
    global List<SVMXC.SFM_WrapperDef.SFM_ProcessNodeDetail> getprocessprocessNodeSourceObject() {
        return null;
    }
    global void setSFMEvents(List<SVMXC__SFM_Event__c> sfmEvents) {

    }
    global void setprocessNodeSourceObject(List<SVMXC.SFM_WrapperDef.SFM_ProcessNodeDetail> s) {

    }
    global void setprocessNodeTargetObject(List<SVMXC.SFM_WrapperDef.SFM_ProcessNodeDetail> s) {

    }
    global void setprocessNodes(SVMXC__ServiceMax_Processes__c s) {

    }
}
global class SFM_Response {
    webService SVMXC.SFM_WrapperDef.SFM_DocTemplate docTemplate {
        get;
        set;
    }
    webService String eventType {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_FieldUpdateRuleInfo> fieldUpdateRuleInfoList;
    @WebService
    webService List<SVMXC.SVMX_Debug.SMAX_Debug> logMsg;
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_BizRuleInfo> lstBizRuleInfo;
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_ChecklistInfo> lstChecklistInfo;
    @WebService
    webService List<SVMXC.SFM_WrapperDef.FieldSetWithSorting> lstFieldSetWithSorting;
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_QuestionBank> lstQuestionBank;
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_MapStringMap> MapStringMap;
    webService String message {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SVMXMessage> messages;
    webService String messageType {
        get;
        set;
    }
    webService SVMXC.SFM_WrapperDef.SVMXMessage msgDetails {
        get;
        set;
    }
    @WebService
    webService List<SObject> records;
    @WebService
    webService List<String> resultIds;
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_StringSobjectMap> sobjectMap;
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_StringFieldMap> stringFieldMap;
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_StringListMap> StringLstMap;
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_StringMap> stringMap;
    webService Boolean success {
        get;
        set;
    }
    webService String tagId {
        get;
        set;
    }
    global SFM_Response() {

    }
    global SFM_Response(Boolean success, String message, String tagId, List<SVMXC.SFM_WrapperDef.SFM_StringMap> stringMap, List<SVMXC.SVMX_Debug.SMAX_Debug> logMsg, List<String> resultIds) {

    }
    global List<SVMXC.SFM_WrapperDef.SFM_FieldUpdateRuleInfo> getFieldUpdateRuleInfoList() {
        return null;
    }
    global List<SVMXC.SFM_WrapperDef.SFM_MapStringMap> getMapStringMap() {
        return null;
    }
    global List<SVMXC.SFM_WrapperDef.SFM_StringListMap> getStringLstMap() {
        return null;
    }
    global List<SVMXC.SFM_WrapperDef.SFM_BizRuleInfo> getlstBizRuleInfo() {
        return null;
    }
    global List<SVMXC.SFM_WrapperDef.SFM_ChecklistInfo> getlstChecklistInfo() {
        return null;
    }
    global List<SVMXC.SFM_WrapperDef.FieldSetWithSorting> getlstFieldSetWithSorting() {
        return null;
    }
    global List<SVMXC.SFM_WrapperDef.SFM_QuestionBank> getlstQuestionBank() {
        return null;
    }
    global List<SVMXC.SFM_WrapperDef.SFM_StringSobjectMap> getsobjectMap() {
        return null;
    }
    global List<SVMXC.SFM_WrapperDef.SFM_StringFieldMap> getstringFieldMap() {
        return null;
    }
    global List<SVMXC.SFM_WrapperDef.SFM_StringMap> getstringMap() {
        return null;
    }
    global void setFieldUpdateRuleInfoList(List<SVMXC.SFM_WrapperDef.SFM_FieldUpdateRuleInfo> fieldUpdateRuleInfoList) {

    }
    global void setMapStringMap(List<SVMXC.SFM_WrapperDef.SFM_MapStringMap> s) {

    }
    global void setStringLstMap(List<SVMXC.SFM_WrapperDef.SFM_StringListMap> s) {

    }
    global void setlstBizRuleInfo(List<SVMXC.SFM_WrapperDef.SFM_BizRuleInfo> lstBizRuleInfo) {

    }
    global void setlstChecklistInfo(List<SVMXC.SFM_WrapperDef.SFM_ChecklistInfo> lstChecklistInfo) {

    }
    global void setlstFieldSetWithSorting(List<SVMXC.SFM_WrapperDef.FieldSetWithSorting> lstFieldSetWithSorting) {

    }
    global void setlstQuestionBank(List<SVMXC.SFM_WrapperDef.SFM_QuestionBank> lstQuestionBank) {

    }
    global void setsobjectMap(List<SVMXC.SFM_WrapperDef.SFM_StringSobjectMap> s) {

    }
    global void setstringFieldMap(List<SVMXC.SFM_WrapperDef.SFM_StringFieldMap> s) {

    }
    global void setstringMap(List<SVMXC.SFM_WrapperDef.SFM_StringMap> s) {

    }
}
global class SFM_Response_Expression {
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_Expression> expressions;
    webService SVMXC.SFM_WrapperDef.SFM_Response response {
        get;
        set;
    }
    global SFM_Response_Expression() {

    }
    global SFM_Response_Expression(List<SVMXC.SFM_WrapperDef.SFM_Expression> expressions) {

    }
    global List<SVMXC.SFM_WrapperDef.SFM_Expression> getexpressions() {
        return null;
    }
    global void setexpressions(List<SVMXC.SFM_WrapperDef.SFM_Expression> s) {

    }
}
global class SFM_Response_GlobalObjects {
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_Object> globalObjects;
    webService SVMXC.SFM_WrapperDef.SFM_Response response {
        get;
        set;
    }
    global SFM_Response_GlobalObjects(List<SVMXC.SFM_WrapperDef.SFM_Object> globalObjects) {

    }
}
global class SFM_Response_NamedSearch {
    webService List<SVMXC__ServiceMax_Processes__c> namedSearch {
        get;
        set;
    }
    webService SVMXC.SFM_WrapperDef.SFM_Response response {
        get;
        set;
    }
    global SFM_Response_NamedSearch(List<SVMXC__ServiceMax_Processes__c> namedSearch) {

    }
}
global class SFM_Response_NamedSearchInfo {
    webService List<SVMXC.SFM_WrapperDef.SFM_NamedSearchInfo> namedSearch {
        get;
        set;
    }
    webService SVMXC.SFM_WrapperDef.SFM_Response response {
        get;
        set;
    }
    global SFM_Response_NamedSearchInfo() {

    }
    global SFM_Response_NamedSearchInfo(List<SVMXC.SFM_WrapperDef.SFM_NamedSearchInfo> namedSearch) {

    }
}
global class SFM_Response_ObjectFields {
    webService List<SVMXC.SFM_WrapperDef.FieldProperties> fields {
        get;
        set;
    }
    webService SVMXC.SFM_WrapperDef.SFM_Response response {
        get;
        set;
    }
    global SFM_Response_ObjectFields() {

    }
}
global class SFM_Response_ObjectMap {
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_ObjectMap> objects;
    webService SVMXC.SFM_WrapperDef.SFM_Response response {
        get;
        set;
    }
    global SFM_Response_ObjectMap() {

    }
    global SFM_Response_ObjectMap(List<SVMXC.SFM_WrapperDef.SFM_ObjectMap> objects) {

    }
    global List<SVMXC.SFM_WrapperDef.SFM_ObjectMap> getobjects() {
        return null;
    }
    global void setobjects(List<SVMXC.SFM_WrapperDef.SFM_ObjectMap> s) {

    }
}
global class SFM_Response_ObjectMapLIst {
    webService List<SVMXC__ServiceMax_Processes__c> objectMapping {
        get;
        set;
    }
    webService SVMXC.SFM_WrapperDef.SFM_Response response {
        get;
        set;
    }
    global SFM_Response_ObjectMapLIst() {

    }
    global SFM_Response_ObjectMapLIst(List<SVMXC__ServiceMax_Processes__c> objectMapping) {

    }
}
global class SFM_Response_ObjectToolbarActions {
    webService String fieldsToNull {
        get;
        set;
    }
    webService List<SVMXC.SFM_WrapperDef.SFM_Response_Toolbar> toolbarGroupActions {
        get;
        set;
    }
    global SFM_Response_ObjectToolbarActions() {

    }
}
global class SFM_Response_PageList {
    @WebService
    webService List<SVMXC__Page_Layout__c> PageList;
    webService SVMXC.SFM_WrapperDef.SFM_Response response {
        get;
        set;
    }
    global SFM_Response_PageList() {

    }
    global SFM_Response_PageList(List<SVMXC__Page_Layout__c> PageList) {

    }
    global List<SVMXC__Page_Layout__c> getPageList() {
        return null;
    }
    global void setPageList(List<SVMXC__Page_Layout__c> pl) {

    }
}
global class SFM_Response_PageUI {
    webService String fieldsToNull {
        get;
        set;
    }
    @WebService
    webService SVMXC.SFM_WrapperDef.SFM_PageUI page;
    webService SVMXC.SFM_WrapperDef.SFM_Response response {
        get;
        set;
    }
    global SFM_Response_PageUI() {

    }
    global SFM_Response_PageUI(SVMXC.SFM_WrapperDef.SFM_PageUI page) {

    }
}
global class SFM_Response_ProcessNode {
    @WebService
    webService List<SVMXC__ServiceMax_Processes__c> processNodes;
    webService SVMXC.SFM_WrapperDef.SFM_Response response {
        get;
        set;
    }
    global SFM_Response_ProcessNode(List<SVMXC__ServiceMax_Processes__c> processNodes) {

    }
    global List<SVMXC__ServiceMax_Processes__c> getprocessNodes() {
        return null;
    }
    global void setprocessNodes(List<SVMXC__ServiceMax_Processes__c> s) {

    }
}
global class SFM_Response_ProcessNodeInfo {
    @WebService
    webService SVMXC__ServiceMax_Processes__c processNodes;
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_ProcessNodeDetail> processNodeSourceObject;
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_ProcessNodeDetail> processNodeTargetObject;
    webService SVMXC.SFM_WrapperDef.SFM_Response response {
        get;
        set;
    }
    @WebService
    webService List<SVMXC__SFM_Event__c> sfmEvents;
    global SFM_Response_ProcessNodeInfo() {

    }
    global SFM_Response_ProcessNodeInfo(SVMXC__ServiceMax_Processes__c processNodes, List<SVMXC.SFM_WrapperDef.SFM_ProcessNodeDetail> processNodeSourceObject, List<SVMXC.SFM_WrapperDef.SFM_ProcessNodeDetail> processNodeTargetObject) {

    }
    global List<SVMXC__SFM_Event__c> getSFMEvents() {
        return null;
    }
    global List<SVMXC.SFM_WrapperDef.SFM_ProcessNodeDetail> getprocessNodeTargetObject() {
        return null;
    }
    global SVMXC__ServiceMax_Processes__c getprocessNodes() {
        return null;
    }
    global List<SVMXC.SFM_WrapperDef.SFM_ProcessNodeDetail> getprocessprocessNodeSourceObject() {
        return null;
    }
    global void setSFMEvents(List<SVMXC__SFM_Event__c> sfmEvents) {

    }
    global void setprocessNodeSourceObject(List<SVMXC.SFM_WrapperDef.SFM_ProcessNodeDetail> s) {

    }
    global void setprocessNodeTargetObject(List<SVMXC.SFM_WrapperDef.SFM_ProcessNodeDetail> s) {

    }
    global void setprocessNodes(SVMXC__ServiceMax_Processes__c s) {

    }
}
global class SFM_Response_RecordTypes {
    @WebService
    webService List<SObject> records;
    webService SVMXC.SFM_WrapperDef.SFM_Response response {
        get;
        set;
    }
    global SFM_Response_RecordTypes(List<SObject> records) {

    }
}
global class SFM_Response_Search {
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_SearchResult> searchResult;
    global SFM_Response_Search(List<SVMXC.SFM_WrapperDef.SFM_SearchResult> searchResult) {

    }
}
global class SFM_Response_Toolbar {
    webService String fieldsToNull {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_ToolbarGroup> toolbargroupLst;
    global SFM_Response_Toolbar() {

    }
    global SFM_Response_Toolbar(List<SVMXC.SFM_WrapperDef.SFM_ToolbarGroup> toolbargroupLst) {

    }
    global List<SVMXC.SFM_WrapperDef.SFM_ToolbarGroup> gettoolbargroupLst() {
        return null;
    }
    global void settoolbargroupLst(List<SVMXC.SFM_WrapperDef.SFM_ToolbarGroup> toolbargroupLst) {

    }
}
global class SFM_SearchResult {
    webService String fieldsToNull {
        get;
        set;
    }
    @WebService
    webService String objectApiName;
    @WebService
    webService List<SObject> records;
    global SFM_SearchResult(String objectApiName, List<SObject> records) {

    }
}
global class SFM_StringFieldMap {
    webService String fieldsToNull {
        get;
        set;
    }
    webService String ftype {
        get;
        set;
    }
    webService String key {
        get;
        set;
    }
    webService String value {
        get;
        set;
    }
    global SFM_StringFieldMap() {

    }
    global SFM_StringFieldMap(String k, String v, String s) {

    }
}
global class SFM_StringListMap {
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
    global SFM_StringListMap() {

    }
    global SFM_StringListMap(String key, List<String> valueList) {

    }
    global List<String> getvalueList() {
        return null;
    }
    global void setvalueList(List<String> s) {

    }
}
global class SFM_StringMap {
    webService String fieldsToNull {
        get;
        set;
    }
    webService String key {
        get;
        set;
    }
    webService String value {
        get;
        set;
    }
    webService String value1 {
        get;
        set;
    }
    global SFM_StringMap() {

    }
    global SFM_StringMap(String k, String v) {

    }
    global SFM_StringMap(String key, String value, String value1) {

    }
}
global class SFM_StringSobjectMap {
    webService String key {
        get;
        set;
    }
    @WebService
    webService List<SObject> records;
    webService String value {
        get;
        set;
    }
    global SFM_StringSobjectMap() {

    }
    global SFM_StringSobjectMap(String key, List<SObject> records) {

    }
    global SFM_StringSobjectMap(String key, String value, List<SObject> records) {

    }
}
global class SFM_TargetRecord {
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_TargetRecordObject> detailRecords;
    webService String eventType {
        get;
        set;
    }
    webService String fieldsToNull {
        get;
        set;
    }
    @WebService
    webService SVMXC.SFM_WrapperDef.SFM_TargetRecordObject headerRecord;
    webService String sfmProcessId {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_StringMap> stringMap;
    global SFM_TargetRecord() {

    }
    global List<SVMXC.SFM_WrapperDef.SFM_TargetRecordObject> getdetailRecords() {
        return null;
    }
    global SVMXC.SFM_WrapperDef.SFM_TargetRecordObject getheaderRecord() {
        return null;
    }
    global void setdetailRecords(List<SVMXC.SFM_WrapperDef.SFM_TargetRecordObject> detailRecords) {

    }
    global void setheaderRecord(SVMXC.SFM_WrapperDef.SFM_TargetRecordObject headerRecord) {

    }
}
global class SFM_TargetRecordObject {
    webService String aliasName {
        get;
        set;
    }
    @WebService
    webService List<String> deleteRecID;
    webService String fieldsToNull {
        get;
        set;
    }
    webService String objName {
        get;
        set;
    }
    webService String pageLayoutId {
        get;
        set;
    }
    webService String parentColumnName {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_Record> records;
    global SFM_TargetRecordObject() {

    }
    global List<String> getdeleteRecID() {
        return null;
    }
    global List<SVMXC.SFM_WrapperDef.SFM_Record> getrecords() {
        return null;
    }
    global void setdeleteRecID(List<String> deleteRecID) {

    }
    global void setrecords(List<SVMXC.SFM_WrapperDef.SFM_Record> records) {

    }
}
global class SFM_ToolbarGroup {
    webService List<SVMXC__ServiceMax_Processes__c> actions {
        get;
        set;
    }
    webService SVMXC__ServiceMax_Processes__c section {
        get;
        set;
    }
    global SFM_ToolbarGroup() {

    }
}
global class SFM_UIButton {
    @WebService
    webService SVMXC__Page_Layout_Detail__c buttonDetail;
    @WebService
    webService List<SVMXC__SFM_Event__c> buttonEvents;
    webService String fieldsToNull {
        get;
        set;
    }
    global SFM_UIButton() {

    }
    global SFM_UIButton(SVMXC__Page_Layout_Detail__c buttonDetail, List<SVMXC__SFM_Event__c> buttonEvents) {

    }
}
global class SFM_UIField {
    @WebService
    webService SVMXC.SFM_WrapperDef.SFM_BubbleWrapper bubbleinfo;
    @WebService
    webService SVMXC__Page_Layout_Detail__c fieldDetail;
    @WebService
    webService List<SVMXC__SFM_Event__c> fieldEvents;
    webService String fieldsToNull {
        get;
        set;
    }
    global SFM_UIField() {

    }
    global SFM_UIField(SVMXC__Page_Layout_Detail__c fieldDetail, List<SVMXC__SFM_Event__c> fieldEvents, SVMXC.SFM_WrapperDef.SFM_BubbleWrapper bubbleinfo) {

    }
}
global class SFM_UISection {
    @WebService
    webService List<SVMXC.SFM_WrapperDef.SFM_UIField> fields;
    webService String fieldsToNull {
        get;
        set;
    }
    @WebService
    webService SVMXC__Page_Layout_Detail__c sectionDetail;
    global SFM_UISection() {

    }
    global SFM_UISection(SVMXC__Page_Layout_Detail__c sectionDetail, List<SVMXC.SFM_WrapperDef.SFM_UIField> fields) {

    }
    global List<SVMXC.SFM_WrapperDef.SFM_UIField> getfields() {
        return null;
    }
    global SVMXC__Page_Layout_Detail__c getsectionDetail() {
        return null;
    }
    global void setfields(List<SVMXC.SFM_WrapperDef.SFM_UIField> s) {

    }
    global void setsectionDetail(SVMXC__Page_Layout_Detail__c s) {

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
global class SortingRec {
    webService String dataType {
        get;
        set;
    }
    webService String fieldAPIName {
        get;
        set;
    }
    webService String fieldRelationshipName {
        get;
        set;
    }
    webService String nameField {
        get;
        set;
    }
    webService String queryField {
        get;
        set;
    }
    webService String RefereceFieldObjectName {
        get;
        set;
    }
    webService String sortingOrder {
        get;
        set;
    }
    global SortingRec() {

    }
    global SortingRec(String fieldAPIName, String sortingOrder, String queryField, String dataType, String RefereceFieldObjectName, String fieldRelationshipName, String nameField) {

    }
}
global class bubble_wp {
    webService List<SVMXC.SFM_WrapperDef.SFM_StringFieldMap> FieldMap {
        get;
        set;
    }
    global bubble_wp(List<SVMXC.SFM_WrapperDef.SFM_StringFieldMap> FieldMap) {

    }
}
global class linkedProcessDetail {
    webService String processId {
        get;
        set;
    }
    webService Integer sequence {
        get;
        set;
    }
    webService String title {
        get;
        set;
    }
    global linkedProcessDetail() {

    }
    global linkedProcessDetail(Integer sequence, String title, String processId) {

    }
}
}
