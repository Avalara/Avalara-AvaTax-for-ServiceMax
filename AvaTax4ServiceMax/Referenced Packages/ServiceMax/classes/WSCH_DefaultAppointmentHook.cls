/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global virtual class WSCH_DefaultAppointmentHook {
    global WSCH_DefaultAppointmentHook() {

    }
    global virtual Boolean canShowAppointmentsPage(SVMXC__Service_Order__c workOrder, List<SVMXC.WSCH_Appointment> appts) {
        return null;
    }
    global virtual System.PageReference displayCustomPage() {
        return null;
    }
    global virtual SVMXC.WSCH_DefaultAppointmentHook.ProcessWOActions processWorkOrder() {
        return null;
    }
global enum ProcessWOActions {BOOK_SLA_JOB, DO_NOTHING, FORCE_TO_UNRESOURCED}
}
