trigger AVA_WOCancelOnDelete  on SVMXC__Service_Order__c (before delete) {
    if(Trigger.isBefore && Trigger.isDelete)
    {
        set<Id> lLatchIds = new set<Id>();
        
      
            for(UDL__c latch:[select ObjectId__c from UDL__c LIMIT 50]  )
                lLatchIds.add(latch.ObjectId__c);
        
        for(Integer us = 0; us < Trigger.size; us++)
        {
            boolean testFlag = false;
            if(lLatchIds.contains(Trigger.old[us].Id))
            {
                testFlag = true;
            }
            AVA_Utilities.AsyncCancelTax(Trigger.old[us].Id, Trigger.old[us].Name, testFlag);
        }   
    }
}