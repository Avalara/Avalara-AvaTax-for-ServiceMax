/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class DCON_MultiCriteriaTechMatch_WS {
    webService static void appendSkillsForGivenWOIds(List<SVMXC.DCON_MultiCriteriaTechMatch_WS.SVMXMapofIdandSkill> mapWOidJsonStrOfSkill) {

    }
    webService static List<SVMXC.DCON_MultiCriteriaTechMatch_WS.SVMXMap> buildSkillScore_WS(SVMXC.DCON_MultiCriteriaTechMatch_WS.Skill_Request SkillReq) {
        return null;
    }
    webService static String decodeSkillListToJSON(List<SVMXC.DCON_MultiCriteriaTechMatch_WS.skill> lstOfSkills) {
        return null;
    }
    webService static List<SVMXC.DCON_MultiCriteriaTechMatch_WS.SVMXMapofIdandSkill> decodeSkillObjMapToJSON(List<SVMXC.DCON_MultiCriteriaTechMatch_WS.SVMXMapofIdandSkill> mapWOidJsonStrOfSkill) {
        return null;
    }
    webService static List<SVMXC.DCON_MultiCriteriaTechMatch_WS.skill> encodeToSkillObj(String jsonStringOfSkills) {
        return null;
    }
    webService static SVMXC.DCON_MultiCriteriaTechMatch_WS.MCTMDetails getMCTMDetails(List<String> lstWorkorderIds) {
        return null;
    }
    webService static SVMXC.DCON_MultiCriteriaTechMatch_WS.MCTM_Response getQualifiedTechList(SVMXC.DCON_MultiCriteriaTechMatch_WS.MCTM_Request Req) {
        return null;
    }
    webService static List<SVMXC.DCON_MultiCriteriaTechMatch_WS.skill> getSkillDetails() {
        return null;
    }
    webService static List<SVMXC.DCON_MultiCriteriaTechMatch_WS.SVMXMapofIdandSkill> getSkillsForGivenWOIds(List<Id> lstOfWorkOrderId) {
        return null;
    }
    webService static void putSkillsForGivenWOIds(List<SVMXC.DCON_MultiCriteriaTechMatch_WS.SVMXMapofIdandSkill> mapWOIdSkill) {

    }
global class Eligibility {
    @WebService
    webService String operator;
    @WebService
    webService String techField;
    @WebService
    webService String value;
    @WebService
    webService String WOfield;
}
global class MCTMDetails {
    @WebService
    webService List<SVMXC.DCON_MultiCriteriaTechMatch_WS.SVMXMap> lstCandidatePrefTechId;
    @WebService
    webService List<SVMXC.DCON_MultiCriteriaTechMatch_WS.Eligibility> lstEligibility;
    @WebService
    webService List<String> lstEventHover;
    @WebService
    webService List<SVMXC.DCON_MultiCriteriaTechMatch_WS.skill> lstskill;
    webService String productExpertise {
        get;
        set;
    }
    global MCTMDetails() {

    }
    global MCTMDetails(String productExpertise, List<SVMXC.DCON_MultiCriteriaTechMatch_WS.Eligibility> lstEligibility, List<SVMXC.DCON_MultiCriteriaTechMatch_WS.skill> lstskill, List<SVMXC.DCON_MultiCriteriaTechMatch_WS.SVMXMap> lstCandidatePrefTechId) {

    }
    global MCTMDetails(String productExpertise, List<SVMXC.DCON_MultiCriteriaTechMatch_WS.Eligibility> lstEligibility, List<SVMXC.DCON_MultiCriteriaTechMatch_WS.skill> lstskill, List<SVMXC.DCON_MultiCriteriaTechMatch_WS.SVMXMap> lstCandidatePrefTechId, List<String> lstEventHover) {

    }
}
global class MCTM_Request {
    webService Boolean isEligibilityEnabled {
        get;
        set;
    }
    webService Boolean isPreferredTechEnabled {
        get;
        set;
    }
    webService Boolean isproductExpertiseEnabled {
        get;
        set;
    }
    webService Boolean isSkillsEnabled {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.DCON_MultiCriteriaTechMatch_WS.Eligibility> lstEligibility;
    @WebService
    webService List<SVMXC.DCON_MultiCriteriaTechMatch_WS.MPXTechnicians> lstMPXTechnicans;
    @WebService
    webService List<SVMXC.DCON_MultiCriteriaTechMatch_WS.skill> lstSkill;
    @WebService
    webService List<String> lstTech;
    webService String preferredTechId {
        get;
        set;
    }
    webService String productExpertise {
        get;
        set;
    }
    webService String WOid {
        get;
        set;
    }
    global MCTM_Request() {

    }
    global MCTM_Request(String WOid, List<SVMXC.DCON_MultiCriteriaTechMatch_WS.MPXTechnicians> lstMPXTechnicans, String productExpertise, List<String> lstTech, List<SVMXC.DCON_MultiCriteriaTechMatch_WS.skill> lstSkill, List<SVMXC.DCON_MultiCriteriaTechMatch_WS.Eligibility> lstEligibility) {

    }
    global MCTM_Request(String WOid, String preferredTech, String productExpertise, List<String> lstTech, List<SVMXC.DCON_MultiCriteriaTechMatch_WS.skill> lstSkill, List<SVMXC.DCON_MultiCriteriaTechMatch_WS.Eligibility> lstEligibility) {

    }
    global List<SVMXC.DCON_MultiCriteriaTechMatch_WS.Eligibility> getlstEligibility() {
        return null;
    }
    global List<String> getlstTech() {
        return null;
    }
    global void setlstEligibility(List<SVMXC.DCON_MultiCriteriaTechMatch_WS.Eligibility> s) {

    }
    global void setlstTech(List<String> s) {

    }
}
global class MCTM_Response {
    webService List<SVMXC.DCON_MultiCriteriaTechMatch_WS.SVMXMap> valueMap {
        get;
        set;
    }
    global MCTM_Response() {

    }
    global MCTM_Response(List<SVMXC.DCON_MultiCriteriaTechMatch_WS.SVMXMap> valueMap) {

    }
}
global class MPXTechnicians {
    @WebService
    webService String strDeleted;
    @WebService
    webService String techID;
    @WebService
    webService String techPreferenceType;
    global MPXTechnicians() {

    }
    global MPXTechnicians(String techID, String techPreferenceType, String strDeleted) {

    }
}
global class SVMXMap {
    webService List<SObject> data {
        get;
        set;
    }
    webService String key {
        get;
        set;
    }
    webService List<SVMXC.DCON_MultiCriteriaTechMatch_WS.skill> lstSkill {
        get;
        set;
    }
    webService SObject record {
        get;
        set;
    }
    webService String value {
        get;
        set;
    }
    webService List<SVMXC.DCON_MultiCriteriaTechMatch_WS.SVMXMap> valueMap {
        get;
        set;
    }
    webService List<String> values {
        get;
        set;
    }
    global SVMXMap() {

    }
    global SVMXMap(String key, String value) {

    }
    global SVMXMap(String key, String value, List<String> values) {

    }
}
global class SVMXMapofIdandSkill {
    webService Id key {
        get;
        set;
    }
    webService List<SVMXC.DCON_MultiCriteriaTechMatch_WS.skill> lstSkill {
        get;
        set;
    }
    webService SVMXC.DCON_MultiCriteriaTechMatch_WS.skill skillValue {
        get;
        set;
    }
    webService String value {
        get;
        set;
    }
    global SVMXMapofIdandSkill() {

    }
    global SVMXMapofIdandSkill(Id key, SVMXC.DCON_MultiCriteriaTechMatch_WS.skill skillValue) {

    }
    global SVMXMapofIdandSkill(Id key, List<SVMXC.DCON_MultiCriteriaTechMatch_WS.skill> lstSkill) {

    }
    global SVMXMapofIdandSkill(Id key, String value) {

    }
}
global class Skill_Request {
    @WebService
    webService List<SVMXC.DCON_MultiCriteriaTechMatch_WS.skill> lstSkills;
    @WebService
    webService List<Id> lstTech;
    @WebService
    webService List<SVMXC__Service_Order__c> lstWorkOrder;
    global Skill_Request() {

    }
    global List<SVMXC.DCON_MultiCriteriaTechMatch_WS.skill> getlstSkills() {
        return null;
    }
    global List<Id> getlstTech() {
        return null;
    }
    global List<SVMXC__Service_Order__c> getlstWorkOrder() {
        return null;
    }
    global void setlstSkills(List<SVMXC.DCON_MultiCriteriaTechMatch_WS.skill> s) {

    }
    global void setlstTech(List<Id> s) {

    }
    global void setlstWorkOrder(List<SVMXC__Service_Order__c> s) {

    }
}
global class skill {
    @WebService
    webService Boolean isSkillMandatory;
    @WebService
    webService String skillId;
    @WebService
    webService Integer skillLevel;
    @WebService
    webService String skillName;
    global skill() {

    }
    global skill(String skillId, String skillName, Boolean isSkillMandatory, Integer skillLevel) {

    }
}
global class stackRank {
    global stackRank() {

    }
}
global class techAddress {
}
}
