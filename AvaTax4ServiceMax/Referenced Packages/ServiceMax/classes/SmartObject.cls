/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class SmartObject {
    global SmartObject() {

    }
global class DescribeSmartFieldResult {
    webService String createable {
        get;
        set;
    }
    webService String custom {
        get;
        set;
    }
    webService String label {
        get;
        set;
    }
    webService String length {
        get;
        set;
    }
    webService String name {
        get;
        set;
    }
    webService String nameField {
        get;
        set;
    }
    webService String picklistValues {
        get;
        set;
    }
    webService String precision {
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
    webService String type {
        get;
        set;
    }
    webService String updateable {
        get;
        set;
    }
}
global class DescribeSmartObjectResult {
    webService String createable {
        get;
        set;
    }
    @WebService
    webService List<SVMXC.SmartObject.DescribeSmartFieldResult> fields;
    webService String label {
        get;
        set;
    }
    webService String name {
        get;
        set;
    }
    global DescribeSmartObjectResult() {

    }
}
}
