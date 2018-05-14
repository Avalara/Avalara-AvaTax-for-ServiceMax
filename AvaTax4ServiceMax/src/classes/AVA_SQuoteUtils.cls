////////////////////////////////////////////////////////////////////////////////
// SQuoteUtils class - a namespace for static helper methods
// specific to Service Quotes
////////////////////////////////////////////////////////////////////////////////
public with sharing class AVA_SQuoteUtils 
{
    public class AVAException extends Exception
    {
        
    }
    
    // for autocalc so webservice callout can be done from Trigger
    // argument is id for Opportunity object (page id)
    @future (callout = true)
    static public void AsyncSQGetTax(string curServiceQuotes, boolean finalizeFlag)
    {
        AVA_GetTaxQuote autoTaxServiceQuotes = new AVA_GetTaxQuote(curServiceQuotes);
        autoTaxServiceQuotes.CalcTax();
    }
    static public boolean TaxCalcInputChanged(SVMXC__Quote__c newServiceQuotes, SVMXC__Quote__c oldServiceQuotes)
    {
        Integer lc;
        // Avalara Doc Code counts, because of potentially committed invoices
        if(oldServiceQuotes.AvaTax_Entity_Use_Code__c!= newServiceQuotes.AvaTax_Entity_Use_Code__c)
        {
            return true;
        }
        if(oldServiceQuotes.SVMXC__Contact__c!= newServiceQuotes.SVMXC__Contact__c)
        {
            return true;
        }  
        List<SVMXC__Quote_Line__c> SQDetailList = [select Name, SVMXC__Product__c, SVMXC__Quantity2__c,SVMXC__Line_Type__c,SVMXC__Line_Price2__c,SVMXC__Unit_Price2__c 
                                                   from SVMXC__Quote_Line__c where SVMXC__Quote__c =: newServiceQuotes.Id];
        List<SVMXC__Quote_Line__c> OldWODetailList = [select Name, SVMXC__Product__c, SVMXC__Quantity2__c,SVMXC__Line_Type__c,SVMXC__Line_Price2__c,SVMXC__Unit_Price2__c 
                                                      from SVMXC__Quote_Line__c where SVMXC__Quote__c =: oldServiceQuotes.Id];
        for(lc = 0; lc < SQDetailList.size(); lc++)
        {
            if(TaxCalcLineInfoChanged(SQDetailList [lc],OldWODetailList [lc]))
            {
                return true;
            }
        }  
        
        
        return false;
    }
    static public boolean TaxCalcLineInfoChanged(SVMXC__Quote_Line__c oldLine, SVMXC__Quote_Line__c newLine)
    {
        if(oldLine.SVMXC__Quantity2__c!= newLine.SVMXC__Quantity2__c)
        {
            return true;
        }
        if(oldLine.SVMXC__Unit_Price2__c!= newLine.SVMXC__Unit_Price2__c)
        {
            return true;
        }
        if(oldLine.SVMXC__Line_Type__c!= newLine.SVMXC__Line_Type__c)
        {
            return true;
        }
        if(oldLine.SVMXC__Product__c!= newLine.SVMXC__Product__c)
        {
            return true;
        }
        if(oldLine.SVMXC__Line_Price2__c != newLine.SVMXC__Line_Price2__c )
        {
            return true;
        }
        return false;
        
    }
}