trigger AVA_QuoteItemTrigger on SVMXC__Quote_Line__c (before insert, before update,after insert) 
{  List<Avalara__c> avaConfig = AVA_Utilities.FetchActiveSettings();
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
     
     if(Trigger.isBefore)
     {
         if(Trigger.isUpdate)
         {
             
             set<Id> lLatchIds = new set<Id>();
             
             for(Integer lc = 0; lc < Trigger.new.size(); lc++)
             {
                 
                 List <SVMXC__Quote__c> quoteDetails1= [SELECT Id FROM SVMXC__Quote__c
                                                        WHERE Name = :Trigger.new[0].SVMXC__Quote__c];
                 
             }
             
             
         }
     }
     if(Trigger.isInsert)
     {
         
         set<Id> lLatchIds = new set<Id>();
         for(UDL__c latch:[select ObjectId__c from UDL__c])
             lLatchIds.add(latch.ObjectId__c);
         for(Integer lc = 0; lc < Trigger.new.size(); lc++)
         {
             List <SVMXC__Quote__c> quoteDetails1= [SELECT Id FROM SVMXC__Quote__c
                                                    WHERE Name = :Trigger.new[lc].SVMXC__Quote__c];
             for(UDL__c latch:[select ObjectId__c from UDL__c])
             {
                 List <SVMXC__Quote__c> opiRecords1 = [SELECT Id ,Name from SVMXC__Quote__c where Id=:Trigger.new[lc].SVMXC__Quote__c];
                 
                 lLatchIds.add(latch.ObjectId__c);
             }
             
             if(true == avaConfig[0].Automatic_Tax_Calculation__c&& 
                !System.isBatch() && 
                !test.isRunningTest() &&
                !System.isFuture())
             {
                 AVA_SQuoteUtils.AsyncSQGetTax(Trigger.new[lc].SVMXC__Quote__c,false);
                 
             }
         }
     }
 }
}