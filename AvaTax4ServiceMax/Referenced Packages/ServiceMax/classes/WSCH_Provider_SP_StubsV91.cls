/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class WSCH_Provider_SP_StubsV91 {
    global WSCH_Provider_SP_StubsV91() {

    }
global class AccHoursPatt {
    global SVMXC.WSCH_Provider_SP_StubsV91.DateRange dateRange;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.DayAndTimePeriod> daysAndTimes;
    global AccHoursPatt() {

    }
    global override String toString() {
        return null;
    }
}
global class AccHoursPatts {
    global List<SVMXC.WSCH_Provider_SP_StubsV91.AccHoursPatt> accHoursPatt;
    global AccHoursPatts() {

    }
    global override String toString() {
        return null;
    }
}
global class ActDeleteRequest implements SVMXC.WSCH_IRequest {
    global String actID;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global ActDeleteRequest() {

    }
    global override String toString() {
        return null;
    }
}
global class ActGetRequest implements SVMXC.WSCH_IRequest {
    global Integer ActNo;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global ActGetRequest() {

    }
}
global class ActGetResponse implements SVMXC.WSCH_IResponse {
    global String ActNo;
    global String ActNotes;
    global String ActTypeNum;
    global Boolean Dispatch;
    global String EndLocType;
    global String EndPostCode;
    global String ExpectedDuration;
    global String ExpectedEnd;
    global String ExpectedStart;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReturnCode result;
    global String StartLocType;
    global String StartPostCode;
    global String TimeZoneType;
    global String TravelMode;
    global ActGetResponse() {

    }
}
global class ActOptions {
    global Boolean CheckFrozen;
    global Boolean CheckJobs;
    global Boolean CheckJobsAllowBreakAH;
    global Boolean CheckJobsDealloc;
    global Boolean CheckJobsShuffle;
    global Boolean CheckStdActs;
    global Boolean OverlapBreaks;
    global ActOptions() {

    }
    global override String toString() {
        return null;
    }
}
global class ActTypeFindFromDescRequest implements SVMXC.WSCH_IRequest {
    global String Desc_x;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global ActTypeFindFromDescRequest() {

    }
}
global class ActTypeFindFromDescResponse implements SVMXC.WSCH_IResponse {
    global String ActTypeNum;
    global Integer Category;
    global String ColourID;
    global Integer DispSeq;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReturnCode result;
    global ActTypeFindFromDescResponse() {

    }
}
global class ActUpdateRequest implements SVMXC.WSCH_IRequest {
    global String actID;
    global String actType;
    global Boolean Dispatch;
    global String Duration;
    global String expectedEnd;
    global String expectedStart;
    global String locPostcode;
    global String locType;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global String notes;
    global SVMXC.WSCH_Provider_SP_StubsV91.ActOptions options;
    global String TravelMode;
    global String TZType;
    global ActUpdateRequest() {

    }
    global override String toString() {
        return null;
    }
}
global class Activity {
    global String ActCategory;
    global String ActNo;
    global String ActType;
    global String CrewID;
    global Boolean CrewLeader;
    global String ExpectedEnd;
    global String ExpectedStart;
    global String Operative;
    global String Postcode;
    global Integer TravelHome;
    global Integer TravelTime;
    global Activity() {

    }
}
global class ApptBook {
    global Boolean allowRebook;
    global String bookLoc;
    global SVMXC.WSCH_Provider_SP_StubsV91.ApptBookBookOptions bookOptions;
    global String capacityCategory;
    global SVMXC.WSCH_Provider_SP_StubsV91.Customer customer;
    global String date_x;
    global Integer deliverySize;
    global String desc2;
    global List<String> desc_x;
    global String extraDuration;
    global Integer extraOverhead;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReqSkills extraSkills;
    global SVMXC.WSCH_Provider_SP_StubsV91.ApptBookForceOptions forceOptions;
    global String groupID;
    global String importance;
    global String jobID;
    global String jobType;
    global SVMXC.WSCH_Provider_SP_StubsV91.ListReqEmps listReqEmps;
    global String offerToken;
    global Integer pickupSize;
    global String postcode;
    global String priority;
    global SVMXC.WSCH_Provider_SP_StubsV91.Band promBand;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReqEmps reqEmps;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReqSpares reqSpares;
    global String sameUnit;
    global String siteID;
    global String stdExtraDuration;
    global ApptBook() {

    }
}
global class ApptBookBookOptions {
    global Boolean AllowEmpOT;
    global Boolean ReqConfirm;
    global Boolean SpareIgnVanStock;
    global ApptBookBookOptions() {

    }
}
global class ApptBookForceOptions {
    global Boolean IgnoreCapacity;
    global Boolean InTray;
    global Boolean InTrayWithSkill;
    global Boolean NoLocalKnowledge;
    global Boolean NoTravel;
    global Boolean Reassign;
    global Boolean SpareForceGo;
    global ApptBookForceOptions() {

    }
}
global class ApptBookRequest implements SVMXC.WSCH_IRequest {
    global Boolean allowRebook;
    global String bookLoc;
    global SVMXC.WSCH_Provider_SP_StubsV91.ApptBookBookOptions bookOptions;
    global String capacityCategory;
    global SVMXC.WSCH_Provider_SP_StubsV91.Customer customer;
    global String date_x;
    global Integer deliverySize;
    global String desc2;
    global List<String> desc_x;
    global String extraDuration;
    global Integer extraOverhead;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReqSkills extraSkills;
    global SVMXC.WSCH_Provider_SP_StubsV91.ApptBookForceOptions forceOptions;
    global String groupID;
    global String importance;
    global String jobID;
    global String jobType;
    global SVMXC.WSCH_Provider_SP_StubsV91.ListReqEmps listReqEmps;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global String offerToken;
    global Integer pickupSize;
    global String postcode;
    global String priority;
    global SVMXC.WSCH_Provider_SP_StubsV91.Band promBand;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReqEmps reqEmps;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReqSpares reqSpares;
    global String sameUnit;
    global String siteID;
    global String stdExtraDuration;
    global ApptBookRequest() {

    }
    global override String toString() {
        return null;
    }
}
global class ApptBookResponse implements SVMXC.WSCH_IResponse {
    global SVMXC.WSCH_Provider_SP_StubsV91.BookInfo bookInfo;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReturnCode return_x;
    global ApptBookResponse() {

    }
    global override String toString() {
        return null;
    }
}
global class ApptOfferForceOptions {
    global Boolean IgnoreCapacity;
    global Boolean InTray;
    global Boolean InTrayWithSkill;
    global Boolean NoLocalKnowledge;
    global Boolean NoTravel;
    global Boolean Reassign;
    global Boolean SpareForceGo;
    global ApptOfferForceOptions() {

    }
}
global class ApptOfferMultOptions {
    global Boolean OfferBestOnlyPerEmp;
    global Boolean RestrictSearch;
    global ApptOfferMultOptions() {

    }
}
global class ApptOfferOfferOptions {
    global Boolean AllowEmpOT;
    global Boolean ConsecShift;
    global Boolean ContigShift;
    global Boolean DupUseEmpID;
    global Boolean NonConsecShift;
    global Boolean OfferTextCost;
    global Boolean OfferTextEmpID;
    global Boolean SpareIgnVanStock;
    global ApptOfferOfferOptions() {

    }
}
global class ApptOfferRequest implements SVMXC.WSCH_IRequest {
    global SVMXC.WSCH_Provider_SP_StubsV91.Band band;
    global String capacityCategory;
    global String days;
    global Integer deliverySize;
    global SVMXC.WSCH_Provider_SP_StubsV91.DateOptTime end_x;
    global String extraDuration;
    global Integer extraOverhead;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReqSkills extraSkills;
    global SVMXC.WSCH_Provider_SP_StubsV91.ApptOfferForceOptions forceOptions;
    global String groupID;
    global String importance;
    global Integer index;
    global String jobType;
    global SVMXC.WSCH_Provider_SP_StubsV91.ListReqEmps listReqEmps;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global Integer numReq;
    global String numReqType;
    global SVMXC.WSCH_Provider_SP_StubsV91.ApptOfferOfferOptions offerOptions;
    global Integer pickupSize;
    global String postcode;
    global String preferredDate;
    global String promSet;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReqEmps reqEmps;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReqSpares reqSpares;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReqUnit reqUnit;
    global String siteID;
    global SVMXC.WSCH_Provider_SP_StubsV91.DateOptTime start;
    global String stdExtraDuration;
    global ApptOfferRequest() {

    }
    global override String toString() {
        return null;
    }
}
global class ApptOfferResponse implements SVMXC.WSCH_IResponse {
    global SVMXC.WSCH_Provider_SP_StubsV91.Offers offers;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReturnCode returnCode;
    global SVMXC.WSCH_Provider_SP_StubsV91.SplitOffers splitOffers;
    global ApptOfferResponse() {

    }
    global override String toString() {
        return null;
    }
}
global class BDGBookOptions {
    global Boolean AllowRebookAll;
    global Boolean DontCancelCleared;
    global Boolean DontCancelLoggedOff;
    global BDGBookOptions() {

    }
}
global class BDGJob {
    global SVMXC.WSCH_Provider_SP_StubsV91.AccHoursPatts accHoursPatts;
    global Boolean allowRebook;
    global String bookLoc;
    global SVMXC.WSCH_Provider_SP_StubsV91.JobBookBookOptions bookOptions;
    global String capacityCategory;
    global SVMXC.WSCH_Provider_SP_StubsV91.ClosedAccHoursOvrs closedAccHoursOvrs;
    global SVMXC.WSCH_Provider_SP_StubsV91.ClosedDates closedDates;
    global SVMXC.WSCH_Provider_SP_StubsV91.ClosedPubHolSets closedPubHols;
    global String contractEarliest;
    global String contractLatest;
    global SVMXC.WSCH_Provider_SP_StubsV91.Customer customer;
    global Integer deliverySize;
    global String extraDuration;
    global Integer extraOverhead;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReqSkills extraSkills;
    global SVMXC.WSCH_Provider_SP_StubsV91.JobBookForceOptions forceOptions;
    global String groupID;
    global String importance;
    global Boolean isPrimaryJob;
    global String jobID;
    global String jobType;
    global SVMXC.WSCH_Provider_SP_StubsV91.ListReqEmps listReqEmps;
    global SVMXC.WSCH_Provider_SP_StubsV91.OpenAccHoursOvrs openAccHoursOvrs;
    global Integer pickupSize;
    global String postcode;
    global String priority;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReqEmps reqEmps;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReqSpares reqSpares;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReqUnit reqUnit;
    global SVMXC.WSCH_Provider_SP_StubsV91.ServHoursPatts servHoursPatts;
    global SVMXC.WSCH_Provider_SP_StubsV91.ServHoursPreDefPatts servHoursPreDefPatts;
    global String siteID;
    global BDGJob() {

    }
}
global class BDGRetJob {
    global String empID;
    global String FRU;
    global String IRU;
    global String jobID;
    global String maybeETA;
    global BDGRetJob() {

    }
}
global class Band {
    global String end_x;
    global String start;
    global String timeBandID;
    global Band() {

    }
    global override String toString() {
        return null;
    }
}
global class BookDependencyGroupRequest implements SVMXC.WSCH_IRequest {
    global SVMXC.WSCH_Provider_SP_StubsV91.BDGBookOptions bookOptions;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.BDGJob> job;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.JobDep> jobDep;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global String multiJobID;
    global BookDependencyGroupRequest() {

    }
}
global class BookDependencyGroupResponse implements SVMXC.WSCH_IResponse {
    global SVMXC.WSCH_Provider_SP_StubsV91.ReturnCode result;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.BDGRetJob> retJobs;
    global Integer travelTime;
    global BookDependencyGroupResponse() {

    }
}
global class BookInfo {
    global String empID;
    global String FRU;
    global String IRU;
    global BookInfo() {

    }
    global override String toString() {
        return null;
    }
}
global class BookSplitDependencyGroupRequest implements SVMXC.WSCH_IRequest {
    global SVMXC.WSCH_Provider_SP_StubsV91.ApptBookRequest appt;
    global String empID;
    global Integer groupType;
    global SVMXC.WSCH_Provider_SP_StubsV91.JobBookRequest job;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.SplitJobTimes> splitTimes;
    global BookSplitDependencyGroupRequest() {

    }
}
global class BookSplitDependencyGroupResponse implements SVMXC.WSCH_IResponse {
    global SVMXC.WSCH_Provider_SP_StubsV91.BookInfo bookInfo;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReturnCode result;
    global BookSplitDependencyGroupResponse() {

    }
}
global class BreakTimes {
    global String BreakDuration;
    global String BreakName;
    global String BreakStart;
    global String BreakType;
    global BreakTimes() {

    }
}
global class CancelDependencyGroupOptions {
    global Boolean DontCancelCleared;
    global Boolean DontCancelLoggedOff;
    global Boolean IsJobID;
    global CancelDependencyGroupOptions() {

    }
}
global class CancelDependencyGroupRequest implements SVMXC.WSCH_IRequest {
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global String multiJobID;
    global SVMXC.WSCH_Provider_SP_StubsV91.CancelDependencyGroupOptions options;
    global CancelDependencyGroupRequest() {

    }
}
global class CapacityCategoryLevels {
    global String capacityCategory;
    global String limitLevel;
    global String reservedLevel;
    global CapacityCategoryLevels() {

    }
}
global class CapacityOverrides {
    global List<SVMXC.WSCH_Provider_SP_StubsV91.CapacityCategoryLevels> capacityLevels;
    global String date_x;
    global CapacityOverrides() {

    }
}
global class ChangeJobPriorityRequest implements SVMXC.WSCH_IRequest {
    global String JobID;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global Integer NewPriority;
    global ChangeJobPriorityRequest() {

    }
}
global class ChangeJobStatusRequest implements SVMXC.WSCH_IRequest {
    global SVMXC.WSCH_Provider_SP_StubsV91.JobStatusChange jobStatusChange;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global ChangeJobStatusRequest() {

    }
}
global class ChangeJobStatusResponse implements SVMXC.WSCH_IResponse {
    global SVMXC.WSCH_Provider_SP_StubsV91.ReturnCode result;
    global ChangeJobStatusResponse() {

    }
}
global class ChangeWorkItemStatusRequest implements SVMXC.WSCH_IRequest {
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global SVMXC.WSCH_Provider_SP_StubsV91.WorkItemStatusChange workItemStatusChange;
    global ChangeWorkItemStatusRequest() {

    }
    global override String toString() {
        return null;
    }
}
global class ChangeWorkItemStatusResponse implements SVMXC.WSCH_IResponse {
    global SVMXC.WSCH_Provider_SP_StubsV91.ReturnCode result;
    global ChangeWorkItemStatusResponse() {

    }
    global override String toString() {
        return null;
    }
}
global class ChangedEmpRecord {
    global String empID;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.ExternalObject> externalObject;
    global String recordType;
    global ChangedEmpRecord() {

    }
}
global class ClosedAccHoursOvrs {
    global List<SVMXC.WSCH_Provider_SP_StubsV91.DateAndTimeRange> closedHours;
    global ClosedAccHoursOvrs() {

    }
}
global class ClosedDates {
    global List<SVMXC.WSCH_Provider_SP_StubsV91.DateRange> dateRange;
    global ClosedDates() {

    }
}
global class ClosedPubHolSets {
    global List<String> pubHolSets;
    global ClosedPubHolSets() {

    }
}
global class CustomKWV {
    global String keyword;
    global String value;
    global CustomKWV() {

    }
}
global class Customer {
    global String contactName;
    global List<String> custAddress;
    global String custID;
    global String custName;
    global List<String> phoneNum;
    global Customer() {

    }
    global override String toString() {
        return null;
    }
}
global class DateAndTimeRange {
    global String end_x;
    global String start;
    global DateAndTimeRange() {

    }
    global override String toString() {
        return null;
    }
}
global class DateOptTime {
    global String date_x;
    global String time_x;
    global DateOptTime() {

    }
    global override String toString() {
        return null;
    }
}
global class DateRange {
    global String end_x;
    global String start;
    global DateRange() {

    }
    global override String toString() {
        return null;
    }
}
global class DayAndTimePeriod {
    global String day;
    global String end_x;
    global String start;
    global DayAndTimePeriod() {

    }
    global override String toString() {
        return null;
    }
}
global class DispBatchInfo {
    global Integer jobsMax;
    global String rangeEnd;
    global String rangeStart;
    global String rangeType;
    global DispBatchInfo() {

    }
}
global class DispInitRequest implements SVMXC.WSCH_IRequest {
    global SVMXC.WSCH_Provider_SP_StubsV91.DispBatchInfo batchInfo;
    global String empID;
    global List<String> FRUs;
    global String mode;
    global List<String> teams;
    global String timezone;
    global DispInitRequest() {

    }
}
global class DispInitResponse implements SVMXC.WSCH_IResponse {
    global SVMXC.WSCH_Provider_SP_StubsV91.ReturnCode result;
    global DispInitResponse() {

    }
}
global class DispJobEarmarked {
    global String bookLoc;
    global String bookLocName;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.BreakTimes> breaks;
    global String dateEarmarked;
    global String earmarkType;
    global String empID;
    global String ETA;
    global String ETF;
    global String ETS;
    global String IRUID;
    global Integer jobCountTentative;
    global String jobID;
    global String postcode;
    global Boolean reEarmark;
    global String teamID;
    global Integer totalBreakTime;
    global DispJobEarmarked() {

    }
}
global class DispRequestRequest implements SVMXC.WSCH_IRequest {
    global DispRequestRequest() {

    }
}
global class DispRequestResponse implements SVMXC.WSCH_IResponse {
    global SVMXC.WSCH_Provider_SP_StubsV91.DispJobEarmarked jobInfo;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReturnCode returnCode;
    global DispRequestResponse() {

    }
}
global class DispResultRequest implements SVMXC.WSCH_IRequest {
    global Integer resultCode;
    global DispResultRequest() {

    }
}
global class DispResultResponse implements SVMXC.WSCH_IResponse {
    global SVMXC.WSCH_Provider_SP_StubsV91.ReturnCode result;
    global DispResultResponse() {

    }
}
global class DispatchInfo {
    global String AccessEarliest1;
    global String AccessEarliest2;
    global String AccessEarliest3;
    global String AccessLatest1;
    global String AccessLatest2;
    global String AccessLatest3;
    global String BookLoc;
    global String ContractEnd;
    global String ContractStart;
    global Integer CrewSize;
    global Integer DeliverySize;
    global List<String> EmpId;
    global Integer ExtraDuration;
    global Integer Forced;
    global Boolean IsCallToFix;
    global Integer PickupSize;
    global Integer Priority;
    global String ReqEmpType;
    global List<String> Skills;
    global DispatchInfo() {

    }
}
global class EmpAddActRequest implements SVMXC.WSCH_IRequest {
    global String actType;
    global Boolean Dispatch;
    global String Duration;
    global String empID;
    global String expectedEnd;
    global String expectedStart;
    global String locPostcode;
    global String locType;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global String notes;
    global SVMXC.WSCH_Provider_SP_StubsV91.ActOptions options;
    global String TravelMode;
    global String TZType;
    global EmpAddActRequest() {

    }
    global override String toString() {
        return null;
    }
}
global class EmpAddActResponse implements SVMXC.WSCH_IResponse {
    global String actID;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReturnCode result;
    global EmpAddActResponse() {

    }
    global override String toString() {
        return null;
    }
}
global class EmpBreakPeriod {
    global String BreakDuration;
    global String BreakEarliest;
    global String BreakLatest;
    global String BreakName;
    global String BreakType;
    global EmpBreakPeriod() {

    }
}
global class EmpChangeTravelStatus2Request implements SVMXC.WSCH_IRequest {
    global SVMXC.WSCH_Provider_SP_StubsV91.GPSAddress address;
    global String empID;
    global SVMXC.WSCH_Provider_SP_StubsV91.GeoFence geoFence;
    global Double latitude;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global Double longitude;
    global String newTravelStatus;
    global String timeStamp;
    global EmpChangeTravelStatus2Request() {

    }
}
global class EmpCreateAttr {
    global String address1;
    global String address2;
    global String address3;
    global String address4;
    global Boolean available;
    global String currentHandHeld;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.CustomKWV> customKWVs;
    global SVMXC.WSCH_Provider_SP_StubsV91.EmpLoc defaultEndLoc;
    global SVMXC.WSCH_Provider_SP_StubsV91.EmpLoc defaultLKCLoc;
    global SVMXC.WSCH_Provider_SP_StubsV91.EmpLoc defaultStartLoc;
    global String earmarkedJobsMax;
    global String efficiency;
    global String freezeTheDayLeadTime;
    global String freezeTheDayTimeOfDay;
    global String handHeldAdd1;
    global String handHeldAdd2;
    global String homePostcode;
    global String informLeadTime;
    global String jobTitle;
    global String maxOvertime;
    global String name;
    global String pager;
    global String phone1;
    global String phone2;
    global String printer;
    global Boolean showOperativeStatus;
    global Boolean showTravelStatus;
    global String surname;
    global String TOTA;
    global String TOTB;
    global String type_x;
    global String TZType;
    global Integer vehicleCapacity;
    global String workPostcode;
    global String workTZ;
    global EmpCreateAttr() {

    }
}
global class EmpCreateOptions {
    global Boolean AllowShiftsTooClose;
    global EmpCreateOptions() {

    }
}
global class EmpCreateRequest implements SVMXC.WSCH_IRequest {
    global List<SVMXC.WSCH_Provider_SP_StubsV91.EmpLocKnowRange> defaultRangeLKs;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.EmpLocKnowRegion> defaultRegionLKs;
    global SVMXC.WSCH_Provider_SP_StubsV91.EmpCreateAttr empAttr;
    global String empID;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.EmpExternalData> externalData;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global SVMXC.WSCH_Provider_SP_StubsV91.EmpCreateOptions options;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.EmpPosting> postings;
    global List<String> pubHols;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.EmpShiftAss> shifts;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.EmpSkill> skills;
    global SVMXC.WSCH_Provider_SP_StubsV91.EmpWorkPatt workPatt;
    global EmpCreateRequest() {

    }
}
global class EmpExternalData {
    global String eSDTType;
    global String name;
    global String value;
    global EmpExternalData() {

    }
}
global class EmpGetLKValueByRegionRequest implements SVMXC.WSCH_IRequest {
    global String date_x;
    global String empID;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global EmpGetLKValueByRegionRequest() {

    }
}
global class EmpGetLKValueByRegionResponse implements SVMXC.WSCH_IResponse {
    global List<SVMXC.WSCH_Provider_SP_StubsV91.EmpLKValueByRegion> empLKValueByRegion;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReturnCode result;
    global EmpGetLKValueByRegionResponse() {

    }
}
global class EmpLKValueByRegion {
    global String fromRangeOrRegion;
    global String LKValue;
    global String regionID;
    global EmpLKValueByRegion() {

    }
}
global class EmpLoc {
    global String locType;
    global String postcode;
    global EmpLoc() {

    }
}
global class EmpLocKnowRange {
    global String LKValue;
    global String travelTime;
    global EmpLocKnowRange() {

    }
}
global class EmpLocKnowRegion {
    global String LKValue;
    global String regionID;
    global EmpLocKnowRegion() {

    }
}
global class EmpLocations {
    global String empID;
    global String empName;
    global String endLocRegion;
    global String endLocType;
    global String LKCLocRegion;
    global String LKCLocType;
    global String startLocRegion;
    global String startLocType;
    global EmpLocations() {

    }
}
global class EmpOverrideOptions {
    global Boolean OverrideNoShift;
    global Boolean OverridePubHols;
    global EmpOverrideOptions() {

    }
}
global class EmpOverrideRequest implements SVMXC.WSCH_IRequest {
    global String date_x;
    global String empID;
    global SVMXC.WSCH_Provider_SP_StubsV91.EmpLoc endLoc;
    global SVMXC.WSCH_Provider_SP_StubsV91.EmpLoc LKCLoc;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global SVMXC.WSCH_Provider_SP_StubsV91.EmpOverrideOptions options;
    global SVMXC.WSCH_Provider_SP_StubsV91.EmpShiftPeriod shiftPeriod;
    global SVMXC.WSCH_Provider_SP_StubsV91.EmpLoc startLoc;
    global EmpOverrideRequest() {

    }
}
global class EmpPosting {
    global String endDate;
    global String startDate;
    global String teamID;
    global EmpPosting() {

    }
}
global class EmpRestoreOptions {
    global Boolean RestoreLocs;
    global Boolean RestoreShift;
    global EmpRestoreOptions() {

    }
}
global class EmpRestoreRequest implements SVMXC.WSCH_IRequest {
    global String date_x;
    global String empID;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global SVMXC.WSCH_Provider_SP_StubsV91.EmpRestoreOptions options;
    global EmpRestoreRequest() {

    }
}
global class EmpShiftAss {
    global String endDate;
    global String shiftPatternID;
    global String startDate;
    global EmpShiftAss() {

    }
}
global class EmpShiftPeriod {
    global SVMXC.WSCH_Provider_SP_StubsV91.ReqEmpBreakPeriod breaks;
    global String endDate;
    global String endTime;
    global Boolean isAllDayJobShift;
    global Boolean isCapacityShift;
    global String startDate;
    global String startTime;
    global EmpShiftPeriod() {

    }
}
global class EmpSkill {
    global String endDate;
    global SVMXC.WSCH_Provider_SP_StubsV91.SkillWithLevel skillWithLevel;
    global String startDate;
    global EmpSkill() {

    }
}
global class EmpUpdateAttr {
    global String address1;
    global String address2;
    global String address3;
    global String address4;
    global Boolean available;
    global String currentHandHeld;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.CustomKWV> customKWVs;
    global SVMXC.WSCH_Provider_SP_StubsV91.EmpLoc defaultEndLoc;
    global SVMXC.WSCH_Provider_SP_StubsV91.EmpLoc defaultLKCLoc;
    global SVMXC.WSCH_Provider_SP_StubsV91.EmpLoc defaultStartLoc;
    global String earmarkedJobsMax;
    global String efficiency;
    global String freezeTheDayLeadTime;
    global String freezeTheDayTimeOfDay;
    global String handHeldAdd1;
    global String handHeldAdd2;
    global String homePostcode;
    global String informLeadTime;
    global String jobTitle;
    global String maxOvertime;
    global String name;
    global String noEmpEarmarkedJobsMax;
    global String noEmpFreezeTheDay;
    global String noEmpInformLeadTime;
    global String noEmpTOTA;
    global String noEmpTOTB;
    global String pager;
    global String phone1;
    global String phone2;
    global String printer;
    global Boolean showOperativeStatus;
    global Boolean showTravelStatus;
    global String surname;
    global String TOTA;
    global String TOTB;
    global String type_x;
    global String TZType;
    global Integer vehicleCapacity;
    global String workPostcode;
    global String workTZ;
    global EmpUpdateAttr() {

    }
}
global class EmpUpdateOptions {
    global Boolean AllowAdd;
    global Boolean AllowShiftsTooClose;
    global Boolean PattRangeLKSet;
    global Boolean PattRegionLKSet;
    global Boolean PattSet;
    global Boolean PostingDeallocJobs;
    global Boolean PostingSet;
    global Boolean PubHolSet;
    global Boolean RangeLKSet;
    global Boolean RegionLKSet;
    global Boolean ShiftAssDeallocJobs;
    global Boolean ShiftAssSet;
    global Boolean SkillSet;
    global EmpUpdateOptions() {

    }
}
global class EmpUpdateRequest implements SVMXC.WSCH_IRequest {
    global List<SVMXC.WSCH_Provider_SP_StubsV91.EmpLocKnowRange> defaultRangeLKs;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.EmpLocKnowRegion> defaultRegionLKs;
    global SVMXC.WSCH_Provider_SP_StubsV91.EmpUpdateAttr empAttr;
    global String empID;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.EmpExternalData> externalData;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global SVMXC.WSCH_Provider_SP_StubsV91.EmpUpdateOptions options;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.EmpPosting> postings;
    global List<String> pubHols;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.EmpShiftAss> shifts;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.EmpSkill> skills;
    global SVMXC.WSCH_Provider_SP_StubsV91.EmpWorkPatt workPatt;
    global EmpUpdateRequest() {

    }
}
global class EmpWorkPatt {
    global String syncDate;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.WorkPattDay> workPattDay;
    global EmpWorkPatt() {

    }
}
global class ExternalData {
    global Boolean modified;
    global String name;
    global String value;
    global ExternalData() {

    }
}
global class ExternalObject {
    global List<SVMXC.WSCH_Provider_SP_StubsV91.ExternalData> attribute;
    global String name;
    global ExternalObject() {

    }
}
global class FRUGetEmpLocationsRequest implements SVMXC.WSCH_IRequest {
    global String date_x;
    global String FRUID;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global FRUGetEmpLocationsRequest() {

    }
}
global class FRUGetLKEmpCountByRegionOptions {
    global Boolean IncludeFrozenDays;
    global Boolean IncludeOvertime;
    global FRUGetLKEmpCountByRegionOptions() {

    }
}
global class FRUGetLKEmpCountByRegionRequest implements SVMXC.WSCH_IRequest {
    global String date_x;
    global String freeTime;
    global String FRUID;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global SVMXC.WSCH_Provider_SP_StubsV91.FRUGetLKEmpCountByRegionOptions options;
    global FRUGetLKEmpCountByRegionRequest() {

    }
}
global class FRUSetCapacityOverridesRequest implements SVMXC.WSCH_IRequest {
    global String FRUID;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.CapacityOverrides> overrides;
    global FRUSetCapacityOverridesRequest() {

    }
}
global class FixBreakTimesOptions {
    global Boolean NotUsed;
    global FixBreakTimesOptions() {

    }
}
global class FixBreakTimesRequest implements SVMXC.WSCH_IRequest {
    global List<SVMXC.WSCH_Provider_SP_StubsV91.BreakTimes> breaks;
    global String empID;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global SVMXC.WSCH_Provider_SP_StubsV91.FixBreakTimesOptions options;
    global FixBreakTimesRequest() {

    }
}
global class FixBreakTimesResponse implements SVMXC.WSCH_IResponse {
    global SVMXC.WSCH_Provider_SP_StubsV91.ReturnCode result;
    global FixBreakTimesResponse() {

    }
}
global class ForceFixJobOptions {
    global Boolean AllowShuffle;
    global Boolean IgnAccessHours;
    global Boolean IgnAll;
    global Boolean IgnAppointment;
    global Boolean IgnCapacity;
    global Boolean IgnContract;
    global Boolean IgnEmpReqs;
    global Boolean IgnLK;
    global Boolean IgnMaxOvertime;
    global Boolean IgnOverlapJobs;
    global Boolean IgnOverlapStdActs;
    global Boolean IgnSched;
    global Boolean IgnServiceHours;
    global Boolean IgnShift;
    global Boolean IgnSkill;
    global Boolean IgnSpares;
    global Boolean IgnStatus;
    global ForceFixJobOptions() {

    }
    global override String toString() {
        return null;
    }
}
global class ForceFixJobRequest implements SVMXC.WSCH_IRequest {
    global String empID;
    global String jobID;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global SVMXC.WSCH_Provider_SP_StubsV91.ForceFixJobOptions options;
    global String startDateTime;
    global ForceFixJobRequest() {

    }
    global override String toString() {
        return null;
    }
}
global class GCJAttr {
    global String arrival;
    global String disStatus;
    global String empID;
    global String finish;
    global Integer overdue;
    global String start;
    global GCJAttr() {

    }
    global override String toString() {
        return null;
    }
}
global class GCJJobAttr {
    global SVMXC.WSCH_Provider_SP_StubsV91.GCJAttr attr;
    global String jobID;
    global SVMXC.WSCH_Provider_SP_StubsV91.JeopConditions jobJeopardy;
    global GCJJobAttr() {

    }
}
global class GCJWorkItemAttr {
    global SVMXC.WSCH_Provider_SP_StubsV91.GCJAttr attr;
    global Boolean isFixed;
    global SVMXC.WSCH_Provider_SP_StubsV91.JeopConditions jobJeopardy;
    global String workItemID;
    global String workItemType;
    global GCJWorkItemAttr() {

    }
    global override String toString() {
        return null;
    }
}
global class GPSAddress {
    global String address1;
    global String address2;
    global String address3;
    global String address4;
    global String country;
    global String postcode;
    global GPSAddress() {

    }
}
global class GeoFence {
    global String name;
    global String type_x;
    global GeoFence() {

    }
}
global class GetActsRequest implements SVMXC.WSCH_IRequest {
    global Integer ActCount;
    global String ActNo;
    global String Date_x;
    global String EmpId;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global Integer PreAct;
    global GetActsRequest() {

    }
}
global class GetActsResponse implements SVMXC.WSCH_IResponse {
    global Integer ActCount;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.Activity> Acts;
    global Integer PreAct;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReturnCode result;
    global GetActsResponse() {

    }
}
global class GetChangedEmpOptions {
    global Boolean unused;
    global GetChangedEmpOptions() {

    }
}
global class GetChangedEmpRequest implements SVMXC.WSCH_IRequest {
    global String EmpID;
    global List<String> FRUs;
    global String lastExtractedEmpID;
    global String lastExtractTime;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global SVMXC.WSCH_Provider_SP_StubsV91.GetChangedEmpOptions options;
    global List<String> requiredObjects;
    global List<String> teams;
    global GetChangedEmpRequest() {

    }
}
global class GetChangedEmpResponse implements SVMXC.WSCH_IResponse {
    global List<SVMXC.WSCH_Provider_SP_StubsV91.ChangedEmpRecord> emps;
    global Integer numRecords;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReturnCode result;
    global Integer totalRecords;
    global GetChangedEmpResponse() {

    }
}
global class GetChangedJobsOptions {
    global Boolean JeopOnly;
    global GetChangedJobsOptions() {

    }
    global override String toString() {
        return null;
    }
}
global class GetChangedJobsRequest implements SVMXC.WSCH_IRequest {
    global String FRUID;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global SVMXC.WSCH_Provider_SP_StubsV91.GetChangedJobsOptions options;
    global String timeStampIn;
    global GetChangedJobsRequest() {

    }
}
global class GetChangedJobsResponse implements SVMXC.WSCH_IResponse {
    global String actNumOut;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.GCJJobAttr> job;
    global Boolean more;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReturnCode result;
    global String timeStampOut;
    global GetChangedJobsResponse() {

    }
}
global class GetChangedWorkItemsRequest implements SVMXC.WSCH_IRequest {
    global String FRUID;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global SVMXC.WSCH_Provider_SP_StubsV91.GetChangedJobsOptions options;
    global String timeStampIn;
    global GetChangedWorkItemsRequest() {

    }
    global override String toString() {
        return null;
    }
}
global class GetChangedWorkItemsResponse implements SVMXC.WSCH_IResponse {
    global String actNumOut;
    global Boolean more;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReturnCode result;
    global String timeStampOut;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.GCJWorkItemAttr> workItem;
    global GetChangedWorkItemsResponse() {

    }
    global override String toString() {
        return null;
    }
}
global class GetEffectiveTimeRequest {
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global GetEffectiveTimeRequest() {

    }
}
global class GetEffectiveTimeResponse implements SVMXC.WSCH_IResponse {
    global String efftime;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReturnCode result;
    global GetEffectiveTimeResponse() {

    }
}
global class GetEmpLocationsResponse implements SVMXC.WSCH_IResponse {
    global List<SVMXC.WSCH_Provider_SP_StubsV91.EmpLocations> empLocations;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReturnCode result;
    global GetEmpLocationsResponse() {

    }
}
global class GetEmpsRequest implements SVMXC.WSCH_IRequest {
    global String Date_x;
    global Integer EmpCount;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global String PrevEmp;
    global String RespUnit;
    global GetEmpsRequest() {

    }
}
global class GetEmpsResponse implements SVMXC.WSCH_IResponse {
    global Integer EmpCount;
    global List<String> Emps;
    global String PrevEmp;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReturnCode result;
    global GetEmpsResponse() {

    }
}
global class GetJobRequest implements SVMXC.WSCH_IRequest {
    global String jobID;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global GetJobRequest() {

    }
}
global class GetJobResponse implements SVMXC.WSCH_IResponse {
    global SVMXC.WSCH_Provider_SP_StubsV91.JobDetails jobDetails;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReturnCode result;
    global GetJobResponse() {

    }
}
global class GetJobStatusRequest implements SVMXC.WSCH_IRequest {
    global String jobID;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global GetJobStatusRequest() {

    }
    global override String toString() {
        return null;
    }
}
global class GetJobStatusResponse implements SVMXC.WSCH_IResponse {
    global String currentStatus;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReturnCode result;
    global GetJobStatusResponse() {

    }
    global override String toString() {
        return null;
    }
}
global class GetJobsRequest implements SVMXC.WSCH_IRequest {
    global Integer AuditInfoCount;
    global Integer CustomerInfoCount;
    global String DispatchDate;
    global Integer DispatchInfoCount;
    global String EmpID;
    global Integer JobCount;
    global Integer JobInfoCount;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global String PrevJob;
    global String RespUnit;
    global Integer SparesInfoCount;
    global GetJobsRequest() {

    }
}
global class GetJobsResponse implements SVMXC.WSCH_IResponse {
    global List<SVMXC.WSCH_Provider_SP_StubsV91.JobAudit> AuditInfo;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.Customer> Customer;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.DispatchInfo> DispatchInfo;
    global Integer JobCount;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.Job> JobInfo;
    global String PrevJob;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReturnCode result;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.JobSpares> SparesInfo;
    global GetJobsResponse() {

    }
}
global class GetLKEmpCountByRegionResponse implements SVMXC.WSCH_IResponse {
    global List<SVMXC.WSCH_Provider_SP_StubsV91.LKEmpCountByRegion> regionEmpCount;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReturnCode result;
    global GetLKEmpCountByRegionResponse() {

    }
}
global class GetRespUnitsRequest implements SVMXC.WSCH_IRequest {
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global String ParentRespUnit;
    global String PrevRespUnit;
    global Integer RespUnitCount;
    global GetRespUnitsRequest() {

    }
}
global class GetRespUnitsResponse implements SVMXC.WSCH_IResponse {
    global String PrevRespUnit;
    global Integer RespUnitCount;
    global List<String> RespUnits;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReturnCode result;
    global GetRespUnitsResponse() {

    }
}
global class GetWorkItemStatusRequest implements SVMXC.WSCH_IRequest {
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global String workItemID;
    global String workItemType;
    global GetWorkItemStatusRequest() {

    }
}
global class GetWorkItemStatusResponse implements SVMXC.WSCH_IResponse {
    global String currentStatus;
    global Boolean fixedFlag;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReturnCode result;
    global GetWorkItemStatusResponse() {

    }
}
global class JeopConditions {
    global String ADJUnsuitableShift;
    global String beforeContract;
    global String depMissedTime;
    global String depNotDiffOper;
    global String depNotSameOper;
    global String depUnscheduled;
    global String dispFailBatch;
    global String dispFailEarmark;
    global String dispFailReearmark;
    global String dispFailUnearmark;
    global String lateContact;
    global String lateEarmark;
    global String lateLogoff;
    global String lateLogon;
    global String lateTravel;
    global String missedAppt;
    global String missedApptEarly;
    global String missedApptLate;
    global String noGo;
    global String outsideAccHours;
    global String outsideServHours;
    global String ovlJob;
    global String ovlOT;
    global String ovlShift;
    global String ovlStdAct;
    global String pastContract;
    global String promise;
    global String unscheduled;
    global JeopConditions() {

    }
    global Map<String,Object> getAttributes() {
        return null;
    }
    global override String toString() {
        return null;
    }
}
global class JeopReportOptions {
    global Boolean apptMissed;
    global Boolean contractMissed;
    global Boolean unresApptMissed;
    global Boolean unresContractMissed;
    global JeopReportOptions() {

    }
}
global class JeopReportRequest implements SVMXC.WSCH_IRequest {
    global String APITimeZone;
    global List<String> FRUs;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global SVMXC.WSCH_Provider_SP_StubsV91.JeopReportOptions options;
    global SVMXC.WSCH_Provider_SP_StubsV91.JeopConditions statesToReport;
    global List<String> teams;
    global JeopReportRequest() {

    }
}
global class JeopReportResponse implements SVMXC.WSCH_IResponse {
    global List<SVMXC.WSCH_Provider_SP_StubsV91.WorkItemJeopardy> jobJeopardy;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReturnCode returnCode;
    global JeopReportResponse() {

    }
}
global class Job {
    global Integer BreakTime;
    global String EmpID;
    global String EndDate;
    global Integer EstimatedDuration;
    global String ExpectedEnd;
    global String ExpectedStart;
    global String JobID;
    global String JobType;
    global String StartDate;
    global Integer TravelTime;
    global Integer Version;
    global Job() {

    }
}
global class JobAudit {
    global String Creation;
    global String Dispatched;
    global Integer JeopardyStatus;
    global Integer JeopardyStatus2;
    global Integer JobStatus;
    global String Postcode;
    global String Scheduled;
    global Integer ScheduleStatus;
    global String Update_x;
    global JobAudit() {

    }
}
global class JobBook {
    global SVMXC.WSCH_Provider_SP_StubsV91.AccHoursPatts accHoursPatts;
    global Boolean allowRebook;
    global String bookLoc;
    global SVMXC.WSCH_Provider_SP_StubsV91.JobBookBookOptions bookOptions;
    global String capacityCategory;
    global SVMXC.WSCH_Provider_SP_StubsV91.ClosedAccHoursOvrs closedAccHoursOvrs;
    global SVMXC.WSCH_Provider_SP_StubsV91.ClosedDates closedDates;
    global SVMXC.WSCH_Provider_SP_StubsV91.ClosedPubHolSets closedPubHols;
    global String contractEarliest;
    global String contractLatest;
    global SVMXC.WSCH_Provider_SP_StubsV91.Customer customer;
    global Integer deliverySize;
    global List<String> desc_x;
    global String extraDuration;
    global Integer extraOverhead;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReqSkills extraSkills;
    global SVMXC.WSCH_Provider_SP_StubsV91.JobBookForceOptions forceOptions;
    global String groupID;
    global String importance;
    global String jobID;
    global String jobType;
    global SVMXC.WSCH_Provider_SP_StubsV91.ListReqEmps listReqEmps;
    global SVMXC.WSCH_Provider_SP_StubsV91.OpenAccHoursOvrs openAccHoursOvrs;
    global Integer pickupSize;
    global String postcode;
    global String priority;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReqEmps reqEmps;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReqSpares reqSpares;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReqUnit reqUnit;
    global SVMXC.WSCH_Provider_SP_StubsV91.ServHoursPatts servHoursPatts;
    global SVMXC.WSCH_Provider_SP_StubsV91.ServHoursPreDefPatts servHoursPreDefPatts;
    global String siteID;
    global JobBook() {

    }
}
global class JobBookBookOptions {
    global Boolean AllowEmpOT;
    global Boolean CallToFix;
    global Boolean ConsecShift;
    global Boolean ContigShift;
    global Boolean FixToEmp;
    global Boolean NonConsecShift;
    global Boolean ReqConfirm;
    global Boolean ServAsAccHours;
    global Boolean SpareIgnVanStock;
    global JobBookBookOptions() {

    }
}
global class JobBookForceOptions {
    global Boolean IgnoreCapacity;
    global Boolean InTray;
    global Boolean InTrayAfterAll;
    global Boolean InTrayWithSkill;
    global Boolean NoLocalKnowledge;
    global Boolean NoTravel;
    global Boolean Reassign;
    global Boolean SpareForceGo;
    global JobBookForceOptions() {

    }
}
global class JobBookRequest implements SVMXC.WSCH_IRequest {
    global SVMXC.WSCH_Provider_SP_StubsV91.AccHoursPatts accHoursPatts;
    global Boolean allowRebook;
    global String bookLoc;
    global SVMXC.WSCH_Provider_SP_StubsV91.JobBookBookOptions bookOptions;
    global String capacityCategory;
    global SVMXC.WSCH_Provider_SP_StubsV91.ClosedAccHoursOvrs closedAccHoursOvrs;
    global SVMXC.WSCH_Provider_SP_StubsV91.ClosedDates closedDates;
    global SVMXC.WSCH_Provider_SP_StubsV91.ClosedPubHolSets closedPubHols;
    global String contractEarliest;
    global String contractLatest;
    global SVMXC.WSCH_Provider_SP_StubsV91.Customer customer;
    global Integer deliverySize;
    global String desc2;
    global List<String> desc_x;
    global String extraDuration;
    global Integer extraOverhead;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReqSkills extraSkills;
    global SVMXC.WSCH_Provider_SP_StubsV91.JobBookForceOptions forceOptions;
    global String groupID;
    global String importance;
    global String jobID;
    global String jobType;
    global SVMXC.WSCH_Provider_SP_StubsV91.ListReqEmps listReqEmps;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global SVMXC.WSCH_Provider_SP_StubsV91.OpenAccHoursOvrs openAccHoursOvrs;
    global Integer pickupSize;
    global String postcode;
    global String priority;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReqEmps reqEmps;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReqSpares reqSpares;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReqUnit reqUnit;
    global SVMXC.WSCH_Provider_SP_StubsV91.ServHoursPatts servHoursPatts;
    global SVMXC.WSCH_Provider_SP_StubsV91.ServHoursPreDefPatts servHoursPreDefPatts;
    global String siteID;
    global JobBookRequest() {

    }
    global override String toString() {
        return null;
    }
}
global class JobBookResponse implements SVMXC.WSCH_IResponse {
    global SVMXC.WSCH_Provider_SP_StubsV91.BookInfo bookJobInfo;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReturnCode result;
    global JobBookResponse() {

    }
    global override String toString() {
        return null;
    }
}
global class JobCancelInfo {
    global Integer bookDuration;
    global String disStatus;
    global String empID;
    global String jobID;
    global Boolean onHold;
    global JobCancelInfo() {

    }
    global override String toString() {
        return null;
    }
}
global class JobCancelRequest implements SVMXC.WSCH_IRequest {
    global String jobID;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global JobCancelRequest() {

    }
    global override String toString() {
        return null;
    }
}
global class JobCancelResponse implements SVMXC.WSCH_IResponse {
    global SVMXC.WSCH_Provider_SP_StubsV91.JobCancelInfo jobInfo;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReturnCode result;
    global JobCancelResponse() {

    }
    global override String toString() {
        return null;
    }
}
global class JobChangeArrivalTimeOptions {
    global Boolean allowSpanDays;
    global Boolean fixJob;
    global Boolean setStatusBack;
    global JobChangeArrivalTimeOptions() {

    }
}
global class JobChangeArrivalTimeRequest implements SVMXC.WSCH_IRequest {
    global String arrivalTime;
    global String jobID;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global SVMXC.WSCH_Provider_SP_StubsV91.JobChangeArrivalTimeOptions options;
    global JobChangeArrivalTimeRequest() {

    }
}
global class JobChangeFinishTimeOptions {
    global Boolean allowSpanDays;
    global Boolean fixJob;
    global Boolean setStatusBack;
    global JobChangeFinishTimeOptions() {

    }
}
global class JobChangeFinishTimeRequest implements SVMXC.WSCH_IRequest {
    global String finishTime;
    global String jobID;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global SVMXC.WSCH_Provider_SP_StubsV91.JobChangeFinishTimeOptions options;
    global JobChangeFinishTimeRequest() {

    }
}
global class JobChangeStartTimeOptions {
    global Boolean allowSpanDays;
    global Boolean fixJob;
    global Boolean setStatusBack;
    global JobChangeStartTimeOptions() {

    }
}
global class JobChangeStartTimeRequest implements SVMXC.WSCH_IRequest {
    global String jobID;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global SVMXC.WSCH_Provider_SP_StubsV91.JobChangeStartTimeOptions options;
    global String startTime;
    global JobChangeStartTimeRequest() {

    }
}
global class JobDep {
    global String costID;
    global String depEmpType;
    global String depJobID;
    global String depJobsTime;
    global Integer earliestTime;
    global String earliestTimeUnits;
    global Integer latestTime;
    global String latestTimeUnits;
    global Integer targetTime;
    global String targetTimeUnits;
    global String targJobID;
    global String targJobsTime;
    global JobDep() {

    }
}
global class JobDetails {
    global String actNotes;
    global Integer breakTime;
    global SVMXC.WSCH_Provider_SP_StubsV91.Customer customer;
    global String disStatus;
    global String earliest;
    global String expectedEnd;
    global String expectedStart;
    global Integer fixedStatus;
    global String FRU;
    global String fruDescription;
    global Boolean isAllDayJob;
    global Integer jobStatus;
    global String jobType;
    global String latest;
    global SVMXC.WSCH_Provider_SP_StubsV91.ListReqEmps listReqEmps;
    global String moreNotes;
    global String postcode;
    global String primaryEmployee;
    global Integer priority;
    global Integer region;
    global String ReqEmpType;
    global String scheduledEmp;
    global String secondaryEmployee;
    global Integer travel;
    global JobDetails() {

    }
}
global class JobSpares {
    global Boolean ForceGo;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.SpareQuatity> ReqSpares;
    global String Source;
    global JobSpares() {

    }
}
global class JobStatusChange {
    global String dateTime_x;
    global String jobID;
    global String newStatus;
    global JobStatusChange() {

    }
}
global class JobType {
    global String activityType;
    global String bookingLeadTime;
    global String capacityCategory;
    global String category;
    global String description;
    global String duration;
    global String endDate;
    global Boolean forcible;
    global Boolean fragmentation_allowed;
    global String id;
    global Integer max_fragment_gap;
    global Integer max_split_jobs;
    global Integer min_first_frag_duration;
    global Integer min_frag_duration;
    global Integer min_split_job_duration;
    global String overheadDuration;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.SkillWithLevel> skillsAndLevels;
    global String startDate;
    global JobType() {

    }
}
global class JobTypeCreateOptions {
    global Boolean replace;
    global JobTypeCreateOptions() {

    }
}
global class JobTypeCreateRequest implements SVMXC.WSCH_IRequest {
    global SVMXC.WSCH_Provider_SP_StubsV91.JobType jobType;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global SVMXC.WSCH_Provider_SP_StubsV91.JobTypeCreateOptions options;
    global JobTypeCreateRequest() {

    }
}
global class JobTypeDeleteRequest implements SVMXC.WSCH_IRequest {
    global String id;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global JobTypeDeleteRequest() {

    }
}
global class JobUpdateOptions {
    global Boolean FixToEmp;
    global Boolean RemoveMandatory;
    global Boolean SetConfirmed;
    global Boolean SetDispStatusBack;
    global Boolean SetNotFixed;
    global Boolean SetUnEarmark;
    global Boolean UseAccessHours;
    global JobUpdateOptions() {

    }
    global override String toString() {
        return null;
    }
}
global class JobUpdateRequest implements SVMXC.WSCH_IRequest {
    global String checkEmp;
    global SVMXC.WSCH_Provider_SP_StubsV91.DateAndTimeRange closedAccHoursOvr;
    global SVMXC.WSCH_Provider_SP_StubsV91.Customer customer;
    global String importance;
    global String jobID;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.DateAndTimeRange> openAccHoursOvrs;
    global SVMXC.WSCH_Provider_SP_StubsV91.JobUpdateOptions options;
    global String priority;
    global JobUpdateRequest() {

    }
    global override String toString() {
        return null;
    }
}
global class Journey {
    global String profile;
    global String time_x;
    global Journey() {

    }
}
global class JourneyOverrideRequest implements SVMXC.WSCH_IRequest {
    global SVMXC.WSCH_Provider_SP_StubsV91.Journey journey;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global String region1;
    global String region2;
    global JourneyOverrideRequest() {

    }
}
global class JourneyTMGetRequest implements SVMXC.WSCH_IRequest {
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global String region1;
    global String region2;
    global JourneyTMGetRequest() {

    }
}
global class JourneyTMGetResponse implements SVMXC.WSCH_IResponse {
    global SVMXC.WSCH_Provider_SP_StubsV91.Journey journey;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReturnCode result;
    global JourneyTMGetResponse() {

    }
}
global class LKEmpCountByRegion {
    global Integer empCount;
    global String regionID;
    global LKEmpCountByRegion() {

    }
}
global class ListReqEmps {
    global List<SVMXC.WSCH_Provider_SP_StubsV91.ReqEmp> reqEmp;
    global ListReqEmps() {

    }
}
global class LoginResponse implements SVMXC.WSCH_IResponse {
    global SVMXC.WSCH_Provider_SP_StubsV91.ReturnCode result;
    global LoginResponse() {

    }
    global override String toString() {
        return null;
    }
}
global class Offer {
    global String day;
    global String DRU;
    global String empID;
    global String end_x;
    global String FRU;
    global String IRU;
    global String offerText;
    global String offerToken;
    global String promBand;
    global String promType;
    global String siteIndicator;
    global String start;
    global Integer travelTime;
    global Offer() {

    }
    global override String toString() {
        return null;
    }
}
global class OfferApp {
    global SVMXC.WSCH_Provider_SP_StubsV91.Band band;
    global String capacityCategory;
    global String days;
    global Integer deliverySize;
    global SVMXC.WSCH_Provider_SP_StubsV91.DateOptTime end_x;
    global String extraDuration;
    global Integer extraOverhead;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReqSkills extraSkills;
    global SVMXC.WSCH_Provider_SP_StubsV91.ApptOfferForceOptions forceOptions;
    global String groupID;
    global String importance;
    global Integer index;
    global String jobType;
    global SVMXC.WSCH_Provider_SP_StubsV91.ListReqEmps listReqEmps;
    global Integer numReq;
    global String numReqType;
    global SVMXC.WSCH_Provider_SP_StubsV91.ApptOfferOfferOptions offerOptions;
    global Integer pickupSize;
    global String postcode;
    global String preferredDate;
    global String promSet;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReqEmps reqEmps;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReqSpares reqSpares;
    global SVMXC.WSCH_Provider_SP_StubsV91.ReqUnit reqUnit;
    global String siteID;
    global SVMXC.WSCH_Provider_SP_StubsV91.DateOptTime start;
    global String stdExtraDuration;
    global Integer Version;
    global OfferApp() {

    }
}
global class OfferAppsMultRequest implements SVMXC.WSCH_IRequest {
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global Integer MinPartialMatchCount;
    global SVMXC.WSCH_Provider_SP_StubsV91.ApptOfferMultOptions MultOptions;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.OfferApp> OfferAppts;
    global Integer OfferCount;
    global Integer RequestCount;
    global OfferAppsMultRequest() {

    }
}
global class Offers {
    global Boolean more;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.Offer> offer;
    global Offers() {

    }
    global override String toString() {
        return null;
    }
}
global class OpenAccHoursOvrs {
    global List<SVMXC.WSCH_Provider_SP_StubsV91.DateAndTimeRange> openHours;
    global String openType;
    global OpenAccHoursOvrs() {

    }
}
global class OptimizerStartRequest implements SVMXC.WSCH_IRequest {
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global SVMXC.WSCH_Provider_SP_StubsV91.StartOptimizer StartRequest;
    global OptimizerStartRequest() {

    }
}
global class OptimizerStartStopOption {
    global OptimizerStartStopOption() {

    }
}
global class OptimizerStopRequest implements SVMXC.WSCH_IRequest {
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global SVMXC.WSCH_Provider_SP_StubsV91.StopOptimizer StopRequest;
    global OptimizerStopRequest() {

    }
}
global class QuitRequest implements SVMXC.WSCH_IRequest {
    global QuitRequest() {

    }
}
global class RefreshRequest implements SVMXC.WSCH_IRequest {
    global String fru;
    global String refreshType;
    global RefreshRequest() {

    }
}
global class RefreshResponse implements SVMXC.WSCH_IResponse {
    global SVMXC.WSCH_Provider_SP_StubsV91.ReturnCode result;
    global RefreshResponse() {

    }
}
global class ReqEmp {
    global String empID;
    global String MPX;
    global ReqEmp() {

    }
}
global class ReqEmpBreakPeriod {
    global List<SVMXC.WSCH_Provider_SP_StubsV91.EmpBreakPeriod> reqBreaks;
    global ReqEmpBreakPeriod() {

    }
}
global class ReqEmps {
    global List<String> empIDs;
    global String MPX;
    global ReqEmps() {

    }
}
global class ReqSkills {
    global List<SVMXC.WSCH_Provider_SP_StubsV91.SkillWithLevel> reqSkills;
    global ReqSkills() {

    }
}
global class ReqSpare {
    global Integer quantity;
    global String spare;
    global ReqSpare() {

    }
}
global class ReqSpares {
    global List<SVMXC.WSCH_Provider_SP_StubsV91.ReqSpare> reqSpare;
    global ReqSpares() {

    }
}
global class ReqUnit {
    global String RUID;
    global String unitType;
    global ReqUnit() {

    }
}
global class ReturnCode implements SVMXC.WSCH_IResponse {
    global Integer code;
    global String errNote;
    global String type_x;
    global ReturnCode() {

    }
    global override String toString() {
        return null;
    }
}
global class ServHoursPatt {
    global SVMXC.WSCH_Provider_SP_StubsV91.DateRange dateRange;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.DayAndTimePeriod> dayAndTimes;
    global String gracePeriod;
    global ServHoursPatt() {

    }
}
global class ServHoursPatts {
    global List<SVMXC.WSCH_Provider_SP_StubsV91.ServHoursPatt> servHoursPatt;
    global ServHoursPatts() {

    }
}
global class ServHoursPreDef {
    global List<SVMXC.WSCH_Provider_SP_StubsV91.DayAndTimePeriod> daysAndTimes;
    global String gracePeriod;
    global String servHoursName;
    global String servHoursPattID;
    global ServHoursPreDef() {

    }
}
global class ServHoursPreDefCreateOptions {
    global Boolean replace;
    global ServHoursPreDefCreateOptions() {

    }
}
global class ServHoursPreDefCreateRequest implements SVMXC.WSCH_IRequest {
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global SVMXC.WSCH_Provider_SP_StubsV91.ServHoursPreDefCreateOptions options;
    global SVMXC.WSCH_Provider_SP_StubsV91.ServHoursPreDef servHoursPreDef;
    global ServHoursPreDefCreateRequest() {

    }
}
global class ServHoursPreDefDeleteRequest implements SVMXC.WSCH_IRequest {
    global String id;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global ServHoursPreDefDeleteRequest() {

    }
}
global class ServHoursPreDefPatt {
    global SVMXC.WSCH_Provider_SP_StubsV91.DateRange dateRange;
    global String servHoursPattID;
    global ServHoursPreDefPatt() {

    }
}
global class ServHoursPreDefPatts {
    global List<SVMXC.WSCH_Provider_SP_StubsV91.ServHoursPreDefPatt> servHoursPreDef;
    global ServHoursPreDefPatts() {

    }
}
global class SetJobClearedRequest implements SVMXC.WSCH_IRequest {
    global String dateTime_x;
    global String jobID;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.SpareStock> spareStock;
    global SetJobClearedRequest() {

    }
}
global class SkillCreateRequest implements SVMXC.WSCH_IRequest {
    global String Desc_x;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global String SkillID;
    global Integer Version;
    global SkillCreateRequest() {

    }
}
global class SkillWithLevel {
    global String skillID;
    global String skillLevel;
    global SkillWithLevel() {

    }
}
global class SpareQuatity {
    global Integer Quantity;
    global List<String> SpareID;
    global SpareQuatity() {

    }
}
global class SpareStock {
    global Integer quantity;
    global String spareID;
    global String spareLoc;
    global SpareStock() {

    }
}
global class SparesStock {
    global String LocType;
    global Integer Quantity;
    global String SpareID;
    global String SpareLoc;
    global SparesStock() {

    }
}
global class SplitGrp {
    global Integer groupDuration;
    global Integer groupNumber;
    global String groupType;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.SplitOffer> offer;
    global SplitGrp() {

    }
    global override String toString() {
        return null;
    }
}
global class SplitJobTimes {
    global Integer Duration;
    global String EarliestStartTime;
    global String LatestStartTime;
    global String OfferToken;
    global SplitJobTimes() {

    }
}
global class SplitOffer {
    global String day;
    global String DRU;
    global Integer duration;
    global String empID;
    global String end_x;
    global String FRU;
    global String IRU;
    global String offerText;
    global String offerToken;
    global String promBand;
    global String promType;
    global String siteIndicator;
    global String start;
    global Integer travelTime;
    global SplitOffer() {

    }
    global override String toString() {
        return null;
    }
}
global class SplitOffers {
    global List<SVMXC.WSCH_Provider_SP_StubsV91.SplitGrp> group_x;
    global SplitOffers() {

    }
    global override String toString() {
        return null;
    }
}
global class StandardResponse implements SVMXC.WSCH_IResponse {
    global SVMXC.WSCH_Provider_SP_StubsV91.ReturnCode result;
    global StandardResponse() {

    }
    global override String toString() {
        return null;
    }
}
global class StartOptimizer {
    global String Date_x;
    global String FRU;
    global SVMXC.WSCH_Provider_SP_StubsV91.OptimizerStartStopOption Options;
    global Integer RunTime;
    global Integer Version;
    global StartOptimizer() {

    }
}
global class StopOptimizer {
    global String Date_x;
    global String FRU;
    global SVMXC.WSCH_Provider_SP_StubsV91.OptimizerStartStopOption Options;
    global Integer Version;
    global StopOptimizer() {

    }
}
global class TeamGetEmpLocationsRequest implements SVMXC.WSCH_IRequest {
    global String date_x;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global String teamID;
    global TeamGetEmpLocationsRequest() {

    }
}
global class TeamGetLKEmpCountByRegionOptions {
    global Boolean IncludeFrozenDays;
    global Boolean IncludeOvertime;
    global TeamGetLKEmpCountByRegionOptions() {

    }
}
global class TeamGetLKEmpCountByRegionRequest implements SVMXC.WSCH_IRequest {
    global String date_x;
    global String freeTime;
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global SVMXC.WSCH_Provider_SP_StubsV91.TeamGetLKEmpCountByRegionOptions options;
    global String teamID;
    global TeamGetLKEmpCountByRegionRequest() {

    }
}
global class TeamSetCapacityOverridesRequest implements SVMXC.WSCH_IRequest {
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.CapacityOverrides> overrides;
    global String team;
    global TeamSetCapacityOverridesRequest() {

    }
}
global class UpdateSparesStocksRequest implements SVMXC.WSCH_IRequest {
    global SVMXC.WSCH_Provider_SP_StubsV91.spLogin login;
    global String NumLocs;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.SparesStock> SpareStock;
    global UpdateSparesStocksRequest() {

    }
}
global class WorkItemJeopardy {
    global String currEmpID;
    global String expectedArrival;
    global String expectedStart;
    global String FRU;
    global SVMXC.WSCH_Provider_SP_StubsV91.JeopConditions jeopStates;
    global String latestAccess;
    global String latestEarliest;
    global Integer overdue;
    global String stateDue;
    global String team;
    global String workItemID;
    global String workItemType;
    global WorkItemJeopardy() {

    }
}
global class WorkItemStatusChange {
    global String dateTime_x;
    global String newStatus;
    global String workItemID;
    global String workItemType;
    global WorkItemStatusChange() {

    }
    global override String toString() {
        return null;
    }
}
global class WorkPattDay {
    global String day;
    global SVMXC.WSCH_Provider_SP_StubsV91.EmpLoc endLoc;
    global SVMXC.WSCH_Provider_SP_StubsV91.EmpLoc LKCLoc;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.EmpLocKnowRange> rangeLK;
    global String rangeLKoption;
    global List<SVMXC.WSCH_Provider_SP_StubsV91.EmpLocKnowRegion> regionLK;
    global String regionLKoption;
    global SVMXC.WSCH_Provider_SP_StubsV91.EmpLoc startLoc;
    global Integer weekNum;
    global WorkPattDay() {

    }
}
global class spLogin {
    global String databaseUser;
    global String password;
    global String spUser;
    global spLogin() {

    }
    global override String toString() {
        return null;
    }
}
}
