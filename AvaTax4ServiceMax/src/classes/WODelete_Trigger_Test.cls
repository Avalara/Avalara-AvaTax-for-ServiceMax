@IsTest
private class WODelete_Trigger_Test 
{
    private static testMethod void testDelete()
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
    
    delete workOrder;
    
     AVA_Utilities.AsyncCancelTax(workOrder.Id, workOrder.Name, true);
        }

    
}