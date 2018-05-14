trigger AVA_SQTriggers on SVMXC__Quote__c (before insert, before update) {
    
    Integer lc;
    List<Avalara__c> avaConfig = AVA_Utilities.FetchActiveSettings();
    List<String> lsTaxNowStatusVals = AVA_Utilities.FetchStatusVals();
    if(avaConfig == null || avaConfig.size() < 1 || avaConfig[0].Trigger_Limit__c < Trigger.new.size())
    {
        
        return; // TriggerLimit exceeded or no active taxNowSetting - take no action
    }
    
    if(avaConfig[0].Trigger_Limit__c == null)
    {
        
        avaConfig[0].Trigger_Limit__c = 1;   // default to 1
    }
    
    
    if(avaConfig.size()>0){
        
        if(avaConfig[0].Trigger_Limit__c == null)
        {
            
            avaConfig[0].Trigger_Limit__c = 1;   // default to 1
        }
        
        
    }
    boolean commitFlag = false;
    
    if(Trigger.isBefore)
    {
        
        if(Trigger.isUpdate)
        {
            
            set<Id> lLatchIds = new set<Id>();
            for(UDL__c latch:[select ObjectId__c from UDL__c])
                lLatchIds.add(latch.ObjectId__c);
            if (Trigger.new.size() >0)
            {
                
                for(lc = 0; lc < Trigger.new.size(); lc++)
                {
                    
                    if(true == avaConfig[0].Automatic_Tax_Calculation__c &&
                       !System.isBatch() &&
                       !test.isRunningTest() &&
                       !System.isFuture())
                    {
                        system.debug('b28');
                        commitFlag = false;
                        
                        AVA_SQuoteUtils.AsyncSQGetTax(Trigger.new[lc].Id,commitFlag);
                        
                    }
                    
                    
                    
                    if(true == avaConfig[0].Automatic_Tax_Calculation__c && 
                       !System.isBatch() && 
                       !test.isRunningTest() &&
                       !System.isFuture())
                    {
                        commitFlag = false;
                        
                        AVA_SQuoteUtils.AsyncSQGetTax(Trigger.new[lc].Id,commitFlag);
                    }
                    if(AVA_SQuoteUtils.TaxCalcInputChanged(Trigger.new[lc],Trigger.old[lc]))
                    {
                        if(true == avaConfig[0].Automatic_Tax_Calculation__c && 
                           !System.isBatch() && 
                           !test.isRunningTest() &&
                           !System.isFuture())
                        {
                            commitFlag = false;
                            
                            AVA_SQuoteUtils.AsyncSQGetTax(Trigger.new[lc].Id,commitFlag);
                        }
                        
                        
                        
                        
                        
                    } // TaxNowStatus != 'Success'
                } // for lc=0...
            }
            
        } // isUpdate
        
        if(Trigger.isInsert)
        {
            
            if (Trigger.new.size() >0)
            {
                
                for(lc = 0; lc < Trigger.new.size(); lc++)
                {
                    
                    List<Account> loacct = [select Id,ExemptEntityType__c, Name from Account where Id=:Trigger.new[lc].SVMXC__Company__c];
                    Trigger.new[lc].AvaTax_Entity_Use_Code__c= loacct[0].ExemptEntityType__c;
                    if(true == avaConfig[0].Automatic_Tax_Calculation__c && 
                       !System.isBatch() &&
                       !test.isRunningTest() &&
                       !System.isFuture())
                    {
                        
                        
                        AVA_SQuoteUtils.AsyncSQGetTax(Trigger.new[lc].Id,commitFlag);
                    }
                    
                }
            }
        }
        
    }
}