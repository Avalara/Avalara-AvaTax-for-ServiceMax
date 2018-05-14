trigger AVA_WOTriggers on SVMXC__Service_Order__c (before insert, before update ) {
    
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
                    
                    if(Trigger.new[lc].Work_Order_Status__c == lsTaxNowStatusVals[3])
                    {
                        
                        Trigger.new[lc].Avalara_Status__c = 'Committed';
                    }
                    
                    
                    if(true == avaConfig[0].Automatic_Tax_Calculation__c &&
                       Trigger.new[lc].SVMXC__Order_Status__c== avaConfig[0].Commit_on_Status__c &&
                       Trigger.new[lc].Work_Order_Status__c != lsTaxNowStatusVals[3] && avaConfig[0].Disable_Document_Commit__c ==true &&
                       !System.isBatch() &&
                       !test.isRunningTest() &&
                       !System.isFuture())
                    {
                        
                        commitFlag = false;
                        Trigger.new[lc].Work_Order_Status__c = lsTaxNowStatusVals[5];  // Auto Commit Triggered
                        Trigger.new[lc].Avalara_Status__c = 'Temporary';
                        
                        AVA_WorkOrderUtils.AsyncWOGetTax(Trigger.new[lc].Id,commitFlag);
                        
                    } 
                    
                    else if(true == avaConfig[0].Automatic_Tax_Calculation__c &&
                            Trigger.new[lc].SVMXC__Order_Status__c== avaConfig[0].Commit_on_Status__c &&
                            Trigger.new[lc].Work_Order_Status__c != lsTaxNowStatusVals[3] &&
                            
                            !System.isBatch() &&
                            !test.isRunningTest() &&
                            !System.isFuture())
                    {
                        
                        commitFlag = true;
                        Trigger.new[lc].Work_Order_Status__c = lsTaxNowStatusVals[5];  // Auto Commit Triggered
                        Trigger.new[lc].Avalara_Status__c = 'Commiting....';
                        
                        AVA_WorkOrderUtils.AsyncWOGetTax(Trigger.new[lc].Id,commitFlag);
                        
                    }
                    
                    
                    
                    else if(true == avaConfig[0].Automatic_Tax_Calculation__c && 
                            !System.isBatch() && 
                            !test.isRunningTest() && 
                            !System.isFuture())
                    {
                        
                        if(avaConfig[0].Enable_AvaTax_Tax_Calculation__c == false)
                        {
                            
                            Trigger.new[lc].Avalara_Status__c = 'Tax Calculations are Disabled - Check \'Enable Tax Calculations\' in the TaxServices tab';
                            Trigger.new[lc].Work_Order_Status__c = 'Sales Tax Not Current'; 
                        }
                        else
                        {
                            
                            commitFlag = false;
                        }
                        
                        Trigger.new[lc].Work_Order_Status__c = lsTaxNowStatusVals[4];
                        Trigger.new[lc].Avalara_Status__c = 'Calculating...';
                        
                        AVA_WorkOrderUtils.AsyncWOGetTax(Trigger.new[lc].Id,commitFlag);
                    }
                    if(!lLatchIds.contains(Trigger.new[lc].Id)) // not a latched update - override changes to
                    {
                        
                        if(true == avaConfig[0].Automatic_Tax_Calculation__c && Trigger.new[lc].SVMXC__Order_Status__c== avaConfig[0].Commit_on_Status__c &&
                           Trigger.new[lc].Work_Order_Status__c != lsTaxNowStatusVals[3])
                        {
                            Trigger.new[lc].Work_Order_Status__c = lsTaxNowStatusVals[5];  // Auto Commit Triggered
                            Trigger.new[lc].Avalara_Status__c = 'Commiting....';
                        }
                        
                        
                        else
                        {
                            List<SVMXC__Service_Order_Line__c> WODetailList =  [select Name, SVMXC__Product__c, SVMXC__Actual_Quantity2__c,SVMXC__Work_Description__c,
                                                                                SVMXC__Total_Line_Price__c, SVMXC__From_Location__c, SVMXC__Requested_Location__c
                                                                                from SVMXC__Service_Order_Line__c where SVMXC__Service_Order__c =:Trigger.new[lc].Id];
                            
                            
                            
                            
                            Trigger.new[lc].Work_Order_Status__c = 'Sales Tax Not Current';
                            Trigger.new[lc].Avalara_Status__c = 'Temporary';
                            
                        }
                    }
                    
                    if(Trigger.old[lc].Work_Order_Status__c == lsTaxNowStatusVals[3])    // stop the update! - Work Order is Finalized
                    {
                        
                        Trigger.newMap.get(Trigger.new[lc].Id).addError('Cannot Update - Work Orderis Finalized, and One or More of the changes might change the tax amount');
                        continue;
                    }
                    if(Trigger.new[lc].Work_Order_Status__c != 'Success')
                    {
                        
                        if(AVA_WorkOrderUtils.TaxCalcInputChanged(Trigger.new[lc],Trigger.old[lc]))
                        {
                            
                            
                            if(Trigger.new[lc].Work_Order_Status__c != 'Sales Tax Current')
                            {    
                                //CONNECT-5745
                                
                                if(true == avaConfig[0].Automatic_Tax_Calculation__c && Trigger.new[lc].SVMXC__Order_Status__c== avaConfig[0].Commit_on_Status__c &&
                                   Trigger.new[lc].Work_Order_Status__c != lsTaxNowStatusVals[3])
                                {
                                    Trigger.new[lc].Work_Order_Status__c = lsTaxNowStatusVals[5];  // Auto Commit Triggered
                                    Trigger.new[lc].Avalara_Status__c = 'Commiting....';
                                }
                                
                                
                            }
                            else
                            {
                                
                                if(true == avaConfig[0].Automatic_Tax_Calculation__c && 
                                   !System.isBatch() && 
                                   !test.isRunningTest() &&
                                   !System.isFuture()&&avaConfig[0].Enable_AvaTax_Tax_Calculation__c == false)
                                {
                                    
                                    Trigger.new[lc].Avalara_Status__c = 'Tax Calculations are Disabled - Check \'Enable Tax Calculations\' in the TaxServices tab';
                                    Trigger.new[lc].Work_Order_Status__c = 'Sales Tax Not Current'; 
                                }
                                else if(true == avaConfig[0].Automatic_Tax_Calculation__c && 
                                        
                                        !System.isBatch() && 
                                        !test.isRunningTest() &&
                                        !System.isFuture())
                                {
                                    
                                    commitFlag = false;
                                    
                                    AVA_WorkOrderUtils.AsyncWOGetTax(Trigger.new[lc].Id,commitFlag);
                                }
                                
                                else
                                {
                                    
                                    if(Trigger.new[lc].Avalara_Status__c != Trigger.old[lc].Avalara_Status__c)
                                    { 
                                        
                                        
                                        
                                        Trigger.new[lc].Work_Order_Status__c = lsTaxNowStatusVals[1];
                                        
                                    }
                                    else
                                    {
                                        
                                        Trigger.new[lc].Work_Order_Status__c = lsTaxNowStatusVals[1];  // not current
                                        
                                    }
                                }
                            }
                        }
                        else if(true == avaConfig[0].Automatic_Tax_Calculation__c &&
                                Trigger.new[lc].SVMXC__Order_Status__c== avaConfig[0].Commit_on_Status__c &&
                                Trigger.new[lc].Work_Order_Status__c != lsTaxNowStatusVals[3] &&
                                !System.isBatch() &&
                                !test.isRunningTest() &&
                                !System.isFuture())
                        {
                            
                            commitFlag = true;
                            Trigger.new[lc].Work_Order_Status__c = lsTaxNowStatusVals[5];  // Auto Commit Triggered
                            Trigger.new[lc].Avalara_Status__c = 'Commiting....';
                            
                            AVA_WorkOrderUtils.AsyncWOGetTax(Trigger.new[lc].Id,commitFlag);
                            
                        }
                        
                    } // TaxNowStatus != 'Success'
                    else
                    {
                        if(Trigger.new[lc].Avalara_Status__c == 'Committed')
                        {
                            
                            Trigger.new[lc].Work_Order_Status__c = lsTaxNowStatusVals[3];  // Finalized
                        }
                        else
                        {
                            
                            Trigger.new[lc].Work_Order_Status__c = lsTaxNowStatusVals[1];  // current
                        }
                    } // TaxNowStatus = 'Success'
                } // for lc=0...
            }
            
        } // isUpdate
        
        if(Trigger.isInsert)
        {
            
            if (Trigger.new.size() >0)
            {
                
                for(lc = 0; lc < Trigger.new.size(); lc++)
                {
                    
                    if(true == avaConfig[0].Automatic_Tax_Calculation__c && 
                       !System.isBatch() &&
                       !test.isRunningTest() &&
                       !System.isFuture())
                    {
                        
                        Trigger.new[lc].Work_Order_Status__c = lsTaxNowStatusVals[4];  // Auto Calc Triggered
                        Trigger.new[lc].Avalara_Status__c = 'Calculating...';
                        AVA_WorkOrderUtils.AsyncWOGetTax(Trigger.new[lc].Id,commitFlag);
                    }
                    else if(avaConfig[0].Enable_AvaTax_Tax_Calculation__c == false)
                    {
                        
                        Trigger.new[lc].Avalara_Status__c = 'Tax Calculations are Disabled - Check \'Enable Tax Calculations\' in the TaxServices tab';
                        Trigger.new[lc].Work_Order_Status__c = 'Sales Tax Not Current'; 
                    }
                    else
                    {
                        
                        Trigger.new[lc].Work_Order_Status__c = lsTaxNowStatusVals[0];  // not calculated
                        Trigger.new[lc].Avalara_Status__c = '';
                    }
                }
            }
        }
        
        
    }
}