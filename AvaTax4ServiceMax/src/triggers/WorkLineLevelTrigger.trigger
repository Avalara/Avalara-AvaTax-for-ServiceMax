trigger WorkLineLevelTrigger on SVMXC__Service_Order_Line__c (before update) {
    
    if(Trigger.isbefore)
    {
        if(Trigger.isupdate)
        {
            for(Integer lc = 0; lc < Trigger.new.size(); lc++)
            {
                if(Trigger.new[lc].AVA_SMAX__Non_Taxable__c!=Trigger.old[lc].AVA_SMAX__Non_Taxable__c ||Trigger.new[lc].SVMXC__From_Location__c!=Trigger.old[lc].SVMXC__From_Location__c
                   || Trigger.new[lc].SVMXC__Requested_Location__c!=Trigger.old[lc].SVMXC__Requested_Location__c)
                {
                    
                    List<SVMXC__Service_Order_Line__c> WODetailList =  [select Name,SVMXC__Service_Order__c
                                                                        from SVMXC__Service_Order_Line__c where id=:Trigger.new[0].Id];
                    
                    
                    List<SVMXC__Service_Order__c> WODetailHeader =  [select Name,Avalara_Status__c 
                                                                     from SVMXC__Service_Order__c where id=:WODetailList[0].SVMXC__Service_Order__c];
                    
                    
                    
                    WODetailHeader[0].Avalara_Status__c = 'Save';
                    update WODetailHeader[0];
                    
                }
            }
        }
    }
}