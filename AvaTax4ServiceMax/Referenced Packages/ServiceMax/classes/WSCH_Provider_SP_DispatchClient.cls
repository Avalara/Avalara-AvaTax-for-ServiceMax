/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class WSCH_Provider_SP_DispatchClient {
    global WSCH_Provider_SP_DispatchClient() {

    }
    webService static SVMXC.WSCH_Provider_SP_DispatchClient.DispOutputResponse DispOutput(SVMXC.WSCH_Provider_SP_DispatchClient.DispJobEarmarked jobInfo) {
        return null;
    }
global class BreakTimes {
    webService Long BreakDuration {
        get;
        set;
    }
    webService String BreakName {
        get;
        set;
    }
    webService String BreakStart {
        get;
        set;
    }
    webService String BreakType {
        get;
        set;
    }
    global BreakTimes() {

    }
}
global class DispJobEarmarked {
    webService String bookLoc {
        get;
        set;
    }
    webService String bookLocName {
        get;
        set;
    }
    webService List<SVMXC.WSCH_Provider_SP_DispatchClient.BreakTimes> breaks {
        get;
        set;
    }
    webService String companyID {
        get;
        set;
    }
    webService String dateEarmarked {
        get;
        set;
    }
    webService String earmarkType {
        get;
        set;
    }
    webService String empID {
        get;
        set;
    }
    webService String ETA {
        get;
        set;
    }
    webService String ETF {
        get;
        set;
    }
    webService String ETS {
        get;
        set;
    }
    webService String IRUID {
        get;
        set;
    }
    webService Long jobCountTentative {
        get;
        set;
    }
    webService String jobID {
        get;
        set;
    }
    webService SVMXC.WSCH_Provider_SP_DispatchClient.LoginRequest loginRequest {
        get;
        set;
    }
    webService String postcode {
        get;
        set;
    }
    webService Boolean reEarmark {
        get;
        set;
    }
    webService String teamID {
        get;
        set;
    }
    webService Long totalBreakTime {
        get;
        set;
    }
    global DispJobEarmarked() {

    }
}
global class DispOutputRequest {
    webService SVMXC.WSCH_Provider_SP_DispatchClient.DispJobEarmarked jobInfo {
        get;
        set;
    }
    global DispOutputRequest() {

    }
}
global class DispOutputResponse {
    webService Integer resultCode {
        get;
        set;
    }
    global DispOutputResponse() {

    }
}
global class LoginRequest {
    webService String databaseUser {
        get;
        set;
    }
    webService String password {
        get;
        set;
    }
    webService String spUser {
        get;
        set;
    }
    global LoginRequest() {

    }
}
}
