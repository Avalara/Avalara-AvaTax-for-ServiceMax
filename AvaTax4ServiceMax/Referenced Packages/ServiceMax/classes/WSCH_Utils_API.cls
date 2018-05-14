/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class WSCH_Utils_API {
    global WSCH_Utils_API() {

    }
    webService static List<SVMXC.WSCH_Utils_API.WorkOrderSkill> getWorkOrderSkills(List<Id> lstWorkOrderId) {
        return null;
    }
    webService static void setWorkOrderSkills(List<SVMXC.WSCH_Utils_API.WorkOrderSkill> lstWorkOrderSkill, Boolean appendSkill) {

    }
    global void updateTechHomelatlog() {

    }
    global void updateTechHomelatlog(List<SVMXC__Service_Group__c> listServiceTeamId) {

    }
global class SVMXException extends Exception {
}
global class Skill {
    webService Boolean isSkillMandatory {
        get;
        set;
    }
    webService String skillId {
        get;
        set;
    }
    webService Integer skillLevel {
        get;
        set;
    }
    webService String skillName {
        get;
        set;
    }
    global Skill() {

    }
    global Skill(String skillId, String skillName, Boolean isSkillMandatory, Integer skillLevel) {

    }
}
global class WorkOrderSkill {
    webService List<SVMXC.WSCH_Utils_API.Skill> lstSkills {
        get;
        set;
    }
    webService Id workOrderId {
        get;
        set;
    }
    global WorkOrderSkill() {

    }
    global WorkOrderSkill(Id workOrderId, List<SVMXC.WSCH_Utils_API.Skill> lstSkills) {

    }
}
}
