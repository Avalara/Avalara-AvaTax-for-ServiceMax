trigger AvalaraConfigurSettingTrigger on Avalara__c (before insert, before update,before delete) {
    
    if(Trigger.isBefore)
    {
        List<Avalara__c> activeList = AVA_Utilities.FetchActiveSettings();
        string logs;
        
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
                            Trigger.newMap.get(Trigger.new[us].Id).addError('Cannot Update - Must Always Have an Active Avalara Setting Record');
                        }
                    }
                }
                if(!Test.IsRunningTest())
                {
                    if( Trigger.new[us].Service_URL__c != 'https://avatax.avalara.net')
                    {
                        logs = AVA_Utilities.CreateConfigurationLogs(Trigger.new[us], 'Productin');
                    } else {
                        logs = AVA_Utilities.CreateConfigurationLogs(Trigger.new[us], 'Sandbox');
                        
                    }  
                    
                    Ava_Utilities.AsyncGenerateLogs(logs);    
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
                
                if(!Test.IsRunningTest())
                {
                    if( Trigger.new[us].Service_URL__c != 'https://avatax.avalara.net')
                    {
                                logs = AVA_Utilities.CreateConfigurationLogs(Trigger.new[us], 'Productin');
                
                        
                    } else {
                             logs = AVA_Utilities.CreateConfigurationLogs(Trigger.new[us], 'Sandbox');
                   
                    }  
                    
                    Ava_Utilities.AsyncGenerateLogs(logs);    
                }
                
            }
            
        }
        if(Trigger.isDelete)
        {
            for(Integer us = 0; us < Trigger.size; us++)
            {
                if(activeList.size() <= 1 && Trigger.old[us].Active_Avalara_Setting__c== true)
                {
                    Trigger.oldMap.get(Trigger.old[us].Id).addError('Cannot Delete Active Avalara Record');
                }
                else
                {
                    if(!Test.IsRunningTest())
                    {
                        if( Trigger.old[us].Service_URL__c != 'https://avatax.avalara.net')
                        {
                                      logs = AVA_Utilities.CreateConfigurationLogs(Trigger.old[us], 'Productin');
              
                            
                        } else {
                            
                                   logs = AVA_Utilities.CreateConfigurationLogs(Trigger.old[us], 'Productin');
                 
                            
                            
                        }  
                        
                        Ava_Utilities.AsyncGenerateLogs(logs);    
                    }
                }
                
            }
        }
    }   
}