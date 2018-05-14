/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class IOTRequest {
    global IOTRequest() {

    }
global class Asset {
    global String InstalledPrductNumber;
    global String ProductName;
    global String SerialNumber;
    global String ThingName;
    global Asset() {

    }
}
global class Event {
    global String AlertType;
    global String Description;
    global String EventTime;
    global String Priority;
    global String Property;
    global String ServiceSessionId;
    global String Subject;
    global Event() {

    }
}
global class ServiceRequestAlert {
    global SVMXC.IOTRequest.Asset Asset;
    global SVMXC.IOTRequest.Event Event;
    global Map<String,String> Others;
    global ServiceRequestAlert() {

    }
}
}
