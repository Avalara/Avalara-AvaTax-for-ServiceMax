////////////////////////////////////////////////////////////////////////////////
// Insert/Update trigger for Avalara Object.  Purpose is to 
// maintain a state of "1 and only 1 Avalara__c record has the Active
// check box checked."
////////////////////////////////////////////////////////////////////////////////

trigger AvalaraConfigSettingTrigger on Avalara__c (before insert, before update) {
    List<Avalara__c> activeList = AVA_Utilities.FetchActiveSettings();
    if(activeList == null || activeList.size() < 1)
    {
        return; // TriggerLimit exceeded or no active Avalara Setting- take no action
    }

    if(activeList[0].Trigger_Limit__c == null)
    {
        activeList[0].Trigger_Limit__c = 1;   // default to 1
    }
    
    if(activeList[0].Trigger_Limit__c < Trigger.new.size())
    {
        return;     // bail - trigger limit exceeded
    }
    if(Trigger.isBefore)
    {
        if(Trigger.isUpdate)
        {
            set<Id> lLatchIds = new set<Id>();
            
            for(UDL__c latch:[select ObjectId__c from UDL__c])
                lLatchIds.add(latch.ObjectId__c);
                
            for(Integer us = 0; us < Trigger.new.size(); us++)
            {
                
                boolean resetFlag=true;
               
                if(lLatchIds.contains(Trigger.new[us].Id)) // not a latched update - override changes to
                {
                    resetFlag = false;
                }
               
                if(Trigger.old[us].Active_Avalara_Setting__c != Trigger.new[us].Active_Avalara_Setting__c)
                {   // Active setting record has changed
                    if(Trigger.new[us].Active_Avalara_Setting__c == true)  // changed from false to true
                    {
                        for(Avalara__c tnsa : activeList)
                        {
                           tnsa.Active_Avalara_Setting__c = false;
                        }
                        AVA_Utilities.LatchedUpdate(activeList);
                    }
                    else  // changing from true to false
                    {
                        if(resetFlag)   // must be done via LatchedUpdate
                        {
                            System.debug('Before Get');
                            Trigger.newMap.get(Trigger.new[us].Id).addError('Cannot Update - Must Always Have an Active Avalara Setting Record');
                            System.debug('After Get');
                        }
                    }
               }
            }
        }
        if(Trigger.isInsert)
        {
        boolean resetFlag=false;
            for(Integer us = 0; us < Trigger.size; us++)
            {
                // if activelist size is 0, make this one the active record
                
                if(activeList.size() == 0)
                {
                    Trigger.new[us].Active_Avalara_Setting__c = true;
                }
                else
                {
                    // Active setting record has changed
                     Trigger.new[us].Enable_AvaTax_Tax_Calculation__c = true;
                     Trigger.new[us].Enable_AvaTax_address_validation__c = true;
                     Trigger.new[us].Automatic_Tax_Calculation__c = true;
                     Trigger.new[us].Commit_On_Status__c = 'Closed';
                     Trigger.new[us].Active_Avalara_Setting__c = true;
                     if(Trigger.new[us].Active_Avalara_Setting__c == true)  // changed from false to true
                    {
                        for(Avalara__c tnsa : activeList)
                        {
                           tnsa.Active_Avalara_Setting__c= false;
                        }
                        AVA_Utilities.LatchedUpdate(activeList);
                    }
                    else  // changing from true to false
                    {
                        
                        if(resetFlag)   // must be done via LatchedUpdate
                        {
                            Trigger.newMap.get(Trigger.new[us].Id).addError('Cannot Update - Must Always Have an Active Avalara Setting Record');
                        }
                    }
                    
                }
                
            }
        }
      }   
}