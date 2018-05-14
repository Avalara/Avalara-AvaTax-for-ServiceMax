/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class DCON_Service_Org_WS {
    global DCON_Service_Org_WS() {

    }
    webService static List<SVMXC.DCON_Service_Org_WS.Team_WP> DCON_Retrieve_Team_Tree_WS1(String UserId) {
        return null;
    }
    webService static List<SVMXC__Service_Group__c> DCON_Retrieve_Team_Tree_WS(String UserId, Boolean RetrieveAllRecords) {
        return null;
    }
    webService static SVMXC.DCON_Service_Org_WS.Tech_WorkingHours DCON_Retrieve_Tech_WorkingHrs_WS(List<String> lsttechId, String startdate, String enddate) {
        return null;
    }
    webService static List<SVMXC.DCON_Service_Org_WS.Technician_WP> DCON_Retrieve_TechnicianInfo_Tree_WS(String keyValPairs, List<String> TechIds, String UserId) {
        return null;
    }
    webService static List<SVMXC.DCON_Service_Org_WS.Technician_WP> DCON_Retrieve_Technician_Tree_WS(String UserId, String SearchType, Boolean RetrieveAllRecords, String timeZone, List<String> ServiceTeamTerr) {
        return null;
    }
    webService static List<SVMXC__Territory__c> DCON_Retrieve_Territory_Tree_WS(String UserId, Boolean RetrieveAllRecords) {
        return null;
    }
global class Businesshrs_Holidays {
    webService String BHID {
        get;
        set;
    }
    webService List<Date> Holidays {
        get;
        set;
    }
    webService String TimeZoneSidKey {
        get;
        set;
    }
}
global class Team_WP {
    @WebService
    webService List<String> hoverInfo;
    webService SVMXC__Service_Group__c team_O {
        get;
        set;
    }
    global List<String> gethoverInfo() {
        return null;
    }
    global void sethoverInfo() {

    }
}
global class Tech_WorkingHours {
    webService List<SVMXC.DCON_Service_Org_WS.Businesshrs_Holidays> businesshrs_lstholidays {
        get;
        set;
    }
    webService List<BusinessHours> tech_break_hrs {
        get;
        set;
    }
    webService List<SVMXC.DCON_Service_Org_WS.tech_business_break_hrs> tech_business_break_Ids {
        get;
        set;
    }
    webService List<BusinessHours> tech_business_hrs {
        get;
        set;
    }
}
global class TechnicianSpecialFields_WP {
    webService String key {
        get;
        set;
    }
    webService String value {
        get;
        set;
    }
}
global class Technician_WP {
    @WebService
    webService List<String> hoverInfo;
    webService SVMXC__Service_Group_Site__c location_O {
        get;
        set;
    }
    webService List<SVMXC.DCON_Service_Org_WS.TechnicianSpecialFields_WP> specialFields_LWP {
        get;
        set;
    }
    webService SVMXC__Service_Group_Members__c technician_O {
        get;
        set;
    }
    global List<String> gethoverInfo() {
        return null;
    }
    global void sethoverInfo() {

    }
}
global class tech_business_break_hrs {
    webService String breakhrID {
        get;
        set;
    }
    webService String businesshrID {
        get;
        set;
    }
    webService String techID {
        get;
        set;
    }
}
}
