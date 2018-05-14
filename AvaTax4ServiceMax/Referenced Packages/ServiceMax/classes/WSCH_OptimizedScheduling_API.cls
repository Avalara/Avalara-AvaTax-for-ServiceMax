/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class WSCH_OptimizedScheduling_API {
    global WSCH_OptimizedScheduling_API() {

    }
    global static SVMXC.WSCH_AppointmentsResponse bookAppointment(SVMXC.WSCH_OptimizedScheduling_API.BookAppointmentRequest request) {
        return null;
    }
    global static SVMXC.WSCH_AppointmentsResponse getAvailableAppointments(SVMXC.WSCH_OptimizedScheduling_API.GetAvailableAppointmentsRequest request) {
        return null;
    }
    global static void manageWorkOrders(SVMXC.WSCH_OptimizedScheduling_API.ManageWorkOrdersRequest request) {

    }
global class BookAppointmentRequest {
    global SVMXC.WSCH_Appointment apptSlot {
        get;
        set;
    }
    global SVMXC__Service_Order__c workOrder {
        get;
        set;
    }
    global BookAppointmentRequest() {

    }
}
global class GetAvailableAppointmentsRequest {
    global Integer apptBatchNumber {
        get;
        set;
    }
    global Integer apptBatchSize {
        get;
        set;
    }
    global SVMXC.WSCH_ApptParam apptParams {
        get;
        set;
    }
    global String workOrderNumber {
        get;
        set;
    }
    global GetAvailableAppointmentsRequest() {

    }
}
global class ManageWorkOrdersRequest {
    global List<SVMXC__Service_Order__c> workOrders {
        get;
        set;
    }
    global ManageWorkOrdersRequest() {

    }
}
}
