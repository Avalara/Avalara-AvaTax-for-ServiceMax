@isTest(SeeAllData=true)
private class Ava_WorkDetailTriggerUnitTest{
    static testmethod void TestWorkDetailTrigger()
    {
   
   List<String> ListOfIds = new List<String>();

   
    Case caseTestData = new Case(Origin = 'Phone', Status = 'New');
    
   insert caseTestData;
   
    ListOfIds.add(caseTestData.Id);
   
    Account a = new Account(Name = 'Test Account');
    a.Type = 'Customer';
    insert a;
    ListOfIds.add(a.Id);
    
      Contact c = new Contact(LastName = 'Test Contact');
    insert c;
      ListOfIds.add(c.Id);
    
    SVMXC__Service_Order__c workOrder = new SVMXC__Service_Order__c(SVMXC__Case__c = ListOfIds[0],SVMXC__Company__c=ListOfIds[1], SVMXC__Contact__c=ListOfIds[2],
    SVMXC__Order_Status__c = 'Open',SVMXC__Priority__c= 'High',SVMXC__Order_Type__c = 'Field Service');
    
    insert workOrder;
    
    Map <String,Schema.RecordTypeInfo> recordTypeMap = SVMXC__Service_Order_Line__c.sObjectType.getDescribe().getRecordTypeInfosByName();
    
    
    SVMXC__Service_Order_Line__c workDetail = new SVMXC__Service_Order_Line__c(SVMXC__Service_Order__c= workOrder.id, 
    SVMXC__Line_Type__c= 'Labor',SVMXC__Actual_Quantity2__c = 2,SVMXC__Actual_Price2__c=1000);
    
    insert workDetail;
    
    
   List< SVMXC__Service_Order_Line__c> workDetailRetrieve =[Select SVMXC__Actual_Quantity2__c from SVMXC__Service_Order_Line__c  where id=:workDetail.id];
    
    workDetailRetrieve[0].SVMXC__Actual_Quantity2__c =3;
    
    update workDetailRetrieve;
   
   
   List< SVMXC__Service_Order__c > workOrderRetrieve =[Select Avalara_Status__c from SVMXC__Service_Order__c where id=:workOrder.id];
   
    system.debug('Test Value of Avalara Status ' +workOrderRetrieve[0].Avalara_Status__c);
    
  //  System.assertEquals('Save',workOrderRetrieve[0].Avalara_Status__c);
    
    }
   }