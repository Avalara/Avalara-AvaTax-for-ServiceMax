/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class DCON_DeployUserSetting {
    global DCON_DeployUserSetting() {

    }
global class DCUserSettings {
    webService List<SVMXC.DCON_DeployUserSetting.stringMap> attributesStrMap {
        get;
        set;
    }
    webService Boolean ismodified {
        get;
        set;
    }
    webService List<SVMXC.DCON_DeployUserSetting.DCUserSettings> lstChildDCUserSettings {
        get;
        set;
    }
    webService String rootName {
        get;
        set;
    }
    webService String rulType {
        get;
        set;
    }
    webService String Values {
        get;
        set;
    }
    global DCUserSettings() {

    }
}
global class stringMap {
    webService String key {
        get;
        set;
    }
    webService String value {
        get;
        set;
    }
    global stringMap() {

    }
    global stringMap(String key, String value) {

    }
}
}
