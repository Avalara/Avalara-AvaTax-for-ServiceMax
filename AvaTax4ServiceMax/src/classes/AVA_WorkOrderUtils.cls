////////////////////////////////////////////////////////////////////////////////
// AVA_WorkOrderUtils class - a namespace for static helper methods
// specific to WorkOrder
////////////////////////////////////////////////////////////////////////////////
public with sharing class AVA_WorkOrderUtils 
{
    public class TNException extends Exception
    {
        
    }
    
    // for autocalc so webservice callout can be done from Trigger
    // argument is id of WorkOrder object (page id)
    @future (callout = true)
    static public void AsyncWOGetTax(string curWorkOrder, boolean finalizeFlag)
    {
        AVA_GetTaxWorkOrder autoTaxWorkOrder = new AVA_GetTaxWorkOrder(curWorkOrder);
        if(finalizeFlag)
        {
            autoTaxWorkOrder.Finalize();
        }
        else
        {
            autoTaxWorkOrder.CalcTax();
        }
    }
    
    static public  List<SVMXC__Service_Order__c> WOAvalaraStatus(string Id)
    {
        
        List<SVMXC__Service_Order__c> WODetailList = [select Id,Name,Avalara_Status__c from SVMXC__Service_Order__c where Name =:Id];
        return WODetailList ;
    }
    
    
    static public boolean TaxCalcInputChanged(SVMXC__Service_Order__c newWorkOrder, SVMXC__Service_Order__c oldWorkOrder)
    {
        Integer lc;
        
        // Avalara Doc Code counts, because of potentially committed invoices
        if(oldWorkOrder.SVMXC__Total_Work_Order_Cost__c != newWorkOrder.SVMXC__Total_Work_Order_Cost__c)
        {
            return true;
        }
        if(oldWorkOrder.SVMXC__Total_Billable_Amount__c != newWorkOrder.SVMXC__Total_Billable_Amount__c)
        {
            return true;
        }  
        if(oldWorkOrder.SVMXC__Street__c != newWorkOrder.SVMXC__Street__c)
        {
            return true;
        }
        if(oldWorkOrder.SVMXC__State__c != newWorkOrder.SVMXC__State__c)
        {
            return true;
        }
        if(oldWorkOrder.SVMXC__City__c!= newWorkOrder.SVMXC__City__c)
        {
            return true;
        }
        if(oldWorkOrder.SVMXC__Zip__c!= newWorkOrder.SVMXC__Zip__c)
        {
            return true;
        }
        if(oldWorkOrder.SVMXC__Country__c!= newWorkOrder.SVMXC__Country__c)
        {
            return true;
        }
        if(oldWorkOrder.Avalara_Status__c!= newWorkOrder.Avalara_Status__c)
        {
            return true;
        }
        if(oldWorkOrder.AvaTax_Entity_Use_Code__c!= newWorkOrder.AvaTax_Entity_Use_Code__c)
        {
            return true;
        }
        if(oldWorkOrder.SVMXC__Contact__c!= newWorkOrder.SVMXC__Contact__c)
        {
            return true;
        }
        List<SVMXC__Service_Order_Line__c> WODetailList = [select Name, SVMXC__Product__c, SVMXC__Actual_Quantity2__c,
                                                           SVMXC__Total_Line_Price__c, SVMXC__From_Location__c, SVMXC__Requested_Location__c
                                                           from SVMXC__Service_Order_Line__c where SVMXC__Service_Order__c =: newWorkOrder.Id];
        List<SVMXC__Service_Order_Line__c> OldWODetailList = [select Name, SVMXC__Product__c, SVMXC__Actual_Quantity2__c,
                                                              SVMXC__Total_Line_Price__c, SVMXC__From_Location__c, SVMXC__Requested_Location__c
                                                              from SVMXC__Service_Order_Line__c where SVMXC__Service_Order__c =: oldWorkOrder.Id];
        for(lc = 0; lc < WODetailList.size(); lc++)
        {
            if(TaxCalcLineInfoChanged(WODetailList[lc],OldWODetailList [lc]))
            {
                return true;
            }
        }     
        return false;
    }
    // returns true iff any fields relevant to the tax calc have changed from oldLine to newLine
    // relevant fields: [Quantity, TotalPrice, Product Code, Tax_Code]
    static public boolean TaxCalcLineInfoChanged(SVMXC__Service_Order_Line__c oldLine, SVMXC__Service_Order_Line__c newLine)
    {
        
        if(oldLine.SVMXC__Actual_Quantity2__c != newLine.SVMXC__Actual_Quantity2__c)
        {
            return true;
        }
        if(oldLine.SVMXC__Total_Line_Price__c != newLine.SVMXC__Total_Line_Price__c)
        {
            return true;
        }
        
        return false;
    }
}