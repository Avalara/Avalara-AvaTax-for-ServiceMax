////////////////////////////////////////////////////////////////////////////////
// Cosmic base class for all tax Calcs
// FetchTaxData, UpdateTaxData, and ShouldCalcTax 
// are to be implemented in the derived class
////////////////////////////////////////////////////////////////////////////////
global with sharing abstract class AVA_GetTaxBase 
{
    //Handle the error exception. so make one constractor
    public with sharing class GetTaxException
        extends Exception
    {
        
    }
    
    global Id apCurPage = null; // To store current page id
    global List<Avalara__c> avaConfig; // To create variable to save Avalara__c 
    global List<String> avalaraStatuses; // To save statuses on Invoice like: Avalara Status, Tax Now Status like that
    AVA_TaxSvc.GetTaxRequest getTaxRequest = null;
    //Constroctor for fetch the current page id
    global AVA_GetTaxBase()
    {
        if(ApexPages.currentPage() != null) // will be null if invoked from a trigger
        {
            apCurPage = ApexPages.currentPage().getParameters().get('id');
        }
        BaseInitialize();
    }
    // fetch invoice data
    global abstract AVA_TaxSvc.GetTaxRequest FetchTaxData(boolean commitFlag);
    global abstract void UpdateTaxData(AVA_TaxSvc.GetTaxResult oGTRes, boolean finalizeFlag);
    // checks object to see if tax calc should be called.  If object should have tax calc
    // if so returns null, if not returns error message explaining why tax calc should not be called 
    global abstract string ShouldCalcTax();
    // Create virtual string to Handle Signature code dynamically 
    global virtual string FetchSignature()
    {
        return 'AvaTax4SMax 1.6||1.2';
    }
    ////////////////////////////////////////////////////////////////////////////////
    // VFPage button handlers.
    ////////////////////////////////////////////////////////////////////////////////
    global PageReference CalcTax() //Call Calculate Tax Button with uncommit
    {
        string[] summary = null;
        string[] details = null;
        List<string> MsgBoxLines; 
        
        AVA_TaxSvc.GetTaxResult getTaxResult = CalcTax(false);
        system.debug('Get Result Code' + getTaxResult);
        if(getTaxResult.ResultCode == 'Success')
        {
            return RedirectPage();
        }
        else
        {
            if(getTaxResult.Messages.Message[0].Summary.length() >255 || getTaxResult.Messages.Message[0].Details.length() >255)
            {
                if(getTaxResult.Messages.Message[0].Summary.length() >255)
                {
                    summary = getTaxResult.Messages.Message[0].Summary.split('\\.');
                }
                if(getTaxResult.Messages.Message[0].Details.length() >255)
                {
                    details = getTaxResult.Messages.Message[0].Details.split('\\.');
                    
                }
                
                MsgBoxLines = new List<string>{'Name: ' + getTaxResult.Messages.Message[0].Name,
                    'Summary: ' + summary[0], 'Details: ' + details[1]};
                        
                        }
            else
            {
                MsgBoxLines = new List<string>{'Name: ' + getTaxResult.Messages.Message[0].Name,
                    'Summary: ' + getTaxResult.Messages.Message[0].Summary, 'Details: ' + getTaxResult.Messages.Message[0].Details};
                        }
            return AVA_Utilities.ShowMessageBox('Tax Calculation Returned: ' + getTaxResult.ResultCode,MsgBoxLines,apCurPage);
            
        }
    }
    
    global PageReference Finalize() // Call calculate tax button with commit
    {
        
        List<Avalara__c> avaConfig = AVA_Utilities.FetchActiveSettings();
        
        // if config page tax calculation is not enable, throw error
        if(avaConfig[0].Disable_Document_Commit__c == true)
        {
            List<string> MsgBoxLines = new List<string>{'Name: ' + 'Validation Error',
                'Summary: ' + 'Document Committs are Disabled ', 'Details: ' + ' UnCheck \'Disable Document Commit\' in the Avalara tab to be able to commit the document in AvaTax'};
                    return AVA_Utilities.ShowMessageBox('Tax Calculation Returned: Error'  ,MsgBoxLines,apCurPage);
            // return 'Document Committs are Disabled - UnCheck \'Disable Document Comment\' in the Avalara tab';
        }
        
        AVA_TaxSvc.GetTaxResult getTaxResult = CalcTax(true);
        
        if(getTaxResult.ResultCode == 'Success')
        {
            system.debug('Result: ' + getTaxResult);
            return RedirectPage();
        }
        else
        {
            List<string> MsgBoxLines = new List<string>{'Name: ' + getTaxResult.Messages.Message[0].Name,
                'Summary: ' + getTaxResult.Messages.Message[0].Summary, 'Details: ' + getTaxResult.Messages.Message[0].Details};
                    return AVA_Utilities.ShowMessageBox('Tax Calculation Returned: ' + getTaxResult.ResultCode,MsgBoxLines,apCurPage);
        }
        
        
    }
    // Method calling from above function - Make one function and passing flag like true and false
    global AVA_TaxSvc.GetTaxResult CalcTax(boolean finalizeFlag)
    {    AVA_TaxSvc.GetTaxResult getTaxResult = null;
     
     Integer  TotalConnTime= (((System.Now().second()) * 1000)+ (System.Now().millisecond())+((System.Now().minute()) * 60000));
     
     
     
     if(avaConfig.size() != 1)
     {
         List<string> MsgBoxLines = new List<string>{'Error','Multiple Active Avalara',
             'Expected 1 and only 1 Active Settings Record, but Found ' + avaConfig.size(),
             'Check The Avalara Tab and be sure there is 1 and only 1',
             'Avalara record with \'Active Tax Now Setting\' checked'};
                 getTaxResult = AVA_Utilities.ShowGetTaxErrors(MsgBoxLines);
         system.debug('Get Rewsult Code' +getTaxResult);
         return getTaxResult;
     }
     
     
     // checks to see current Object is not in a finalized state, etc.
     // if not null, then do not calculate tax, else proceed.
     string qualmsg = ShouldCalcTax();
     if(null != ShouldCalcTax())
     {
         List<string> Messages = new List<string>{'Error','PreQualification Error',qualmsg};
             getTaxResult = AVA_Utilities.ShowGetTaxErrors(Messages);
         return getTaxResult;
     }
     // we sending flag to AVA_GetTaxWorkOrder class and create gettax request from it.
     getTaxRequest = FetchTaxData(finalizeFlag);
     
     system.debug(getTaxRequest);
     
     
     
     String s  = getTaxRequest.toString();
     
     
     try
     {
         Integer  TotalConnTime1= (((System.Now().second()) * 1000)+ (System.Now().millisecond())+((System.Now().minute()) * 60000));
         
         
         Integer InitTime1 = TotalConnTime1 - TotalConnTime;
         
         AVA_TaxSvc.TaxSvcSoap taxSvc = new AVA_TaxSvc.TaxSvcSoap(avaConfig[0].Service_URL__c);
         taxSvc.Security.UsernameToken.Username = avaConfig[0].Account_ID__c;
         taxSvc.Security.UsernameToken.Password = avaConfig[0].License_Key__c;
         taxSvc.Profile = new AVA_TaxSvc.Profile();
         taxSvc.Profile.Client = FetchSignature();
         taxSvc.timeout_x = 30000;   // timeout to 10 seconds
         
         
         getTaxResult = taxSvc.GetTax(getTaxRequest);
         
         
         
         Integer  TotalConnTime2= (((System.Now().second()) * 1000)+ (System.Now().millisecond())+((System.Now().minute()) * 60000));
         
         Integer Latency = TotalConnTime2 - TotalConnTime1;
         
         
         
         
         if(getTaxResult.ResultCode == 'Success')
         {string logs;
          
          UpdateTaxData(getTaxResult,finalizeFlag); //OGTReq.Commit_x);
          
          
          if(avaConfig[0].Automatic_Tax_Calculation__c == false)
          {
              if(getTaxResult.DocType == 'SalesInvoice')
              {
                  if(finalizeFlag != true)
                  {
                      if( avaConfig[0].Service_URL__c != 'https://avatax.avalara.net')
                      {
                          logs = '[' + '"CallerAccuNum":' + '"' +  avaConfig[0].Account_ID__c + '"' +
                              ',"LogType":"Performance","LogLevel":"Informational","ConnectorName":"AvaTax for ServiceMax","ConnectorVersion":"1.2",'+ '"DocCode"'+':' + '"' + getTaxResult.DocCode  + '",' + '"Operation":"GetTax","ServiceURL":"Sandbox","Source":"WorkOrder.CalculateSalesTax",'+ '"LineCount"'+':' + '"' + getTaxResult.TaxLines.TaxLine.size()  + '",' 
                              + '"DocType"'+':' + '"' + getTaxResult.DocType  + '",' +'"EventBlock":"PostGetTax","FunctionName":"CalcTax"'+ '",' 
                              +  '"ConnectorTime":' + '"' +  InitTime1  + '",' + '"ConnectorLatency":' + '"' +  Latency + '"' +
                              
                              ',"Message":' +' CONNECTORMETRICS, TYPE-GETTAX,'+' LINECOUNT-'+getTaxResult.TaxLines.TaxLine.size() +',DocCode- '+getTaxResult.DocCode +', ConnectorTime -'+ ' ' + InitTime1  + ',' + 'Connector Latency -' + Latency + ']';
                          
                          
                          
                      } else {
                          logs = '[' + '"CallerAccuNum":' + '"' +  avaConfig[0].Account_ID__c + '"' +
                              ',"LogType":"Performance","LogLevel":"Informational","ConnectorName":"AvaTax for ServiceMax","ConnectorVersion":"1.2",'+ '"DocCode"'+':' + '"' + getTaxResult.DocCode  + '",' + '"Operation":"GetTax ","ServiceURL":"Production","Source":"WorkOrder.CalculateSalesTax",'+ '"LineCount"'+':' + '"' + getTaxResult.TaxLines.TaxLine.size()  + '",'
                              + '"DocType"'+':' + '"' + getTaxResult.DocType + '",'+'"EventBlock":"PostGetTax","FunctionName":"CalcTax"' + '",'    
                              +   '"ConnectorTime":' + '"' +  InitTime1  + '",' + '"ConnectorLatency":' + '"' +  Latency + '"' +
                              ',"Message":' +' CONNECTORMETRICS, TYPE-GETTAX,'+' LINECOUNT-'+getTaxResult.TaxLines.TaxLine.size() +',DocCode- '+getTaxResult.DocCode +', ConnectorTime -'+ ' ' + InitTime1 + ',' + 'Connector Latency -' + Latency + ']';
                          
                          
                      } 
                  }
                  else
                  {
                      if( avaConfig[0].Service_URL__c != 'https://avatax.avalara.net')
                      {
                          logs = '[' + '"CallerAccuNum":' + '"' +  avaConfig[0].Account_ID__c + '"' +
                              ',"LogType":"Performance","LogLevel":"Informational","ConnectorName":"AvaTax for ServiceMax","ConnectorVersion":"1.2",'+ '"DocCode"'+':' + '"' + getTaxResult.DocCode  + '",' + '"Operation":"GetTax","ServiceURL":"Sandbox","Source":"WorkOrder.FinalizeSalesTax",'+ '"LineCount"'+':' + '"' + getTaxResult.TaxLines.TaxLine.size()  + '",'
                              + '"DocType"'+':' + '"' + getTaxResult.DocType + '",'+'"EventBlock":"PostGetTax","FunctionName":"CalcTax"'   + '",'  
                              + '"ConnectorTime":' + '"' +  InitTime1  + '",' + '"ConnectorLatency":' + '"' +  Latency + '"' +
                              
                              ',"Message":' +' CONNECTORMETRICS, TYPE-GETTAX,'+' LINECOUNT-'+getTaxResult.TaxLines.TaxLine.size() +',DocCode- '+getTaxResult.DocCode +', ConnectorTime -'+ ' ' + InitTime1  + ',' + 'Connector Latency -' + Latency + ']';
                          
                          
                          
                      } else {
                          logs = '[' + '"CallerAccuNum":' + '"' +  avaConfig[0].Account_ID__c + '"' +
                              ',"LogType":"Performance","LogLevel":"Informational","ConnectorName":"AvaTax for ServiceMax","ConnectorVersion":"1.2",'+ '"DocCode"'+':' + '"' + getTaxResult.DocCode  + '",' + '"Operation":"GetTax ","ServiceURL":"Production","Source":"WorkOrder.FinalizeSalesTax",'+ '"LineCount"'+':' + '"' + getTaxResult.TaxLines.TaxLine.size()  + '",'
                              + '"DocType"'+':' + '"' + getTaxResult.DocType + '",'+'"EventBlock":"PostGetTax","FunctionName":"CalcTax"'  + '",'   
                              + '"ConnectorTime":' + '"' +  InitTime1  + '",' + '"ConnectorLatency":' + '"' +  Latency + '"' +
                              ',"Message":' +' CONNECTORMETRICS, TYPE-GETTAX,'+' LINECOUNT-'+getTaxResult.TaxLines.TaxLine.size() +',DocCode- '+getTaxResult.DocCode +', ConnectorTime -'+ ' ' + InitTime1 + ',' + 'Connector Latency -' + Latency + ']';
                          
                          
                      } 
                  }
                  
                  
              }
              else
              {
                  if( avaConfig[0].Service_URL__c != 'https://avatax.avalara.net')
                  {
                      logs = '[' + '"CallerAccuNum":' + '"' +  avaConfig[0].Account_ID__c + '"' +
                          ',"LogType":"Performance","LogLevel":"Informational","ConnectorName":"AvaTax for ServiceMax","ConnectorVersion":"1.2",'+ '"DocCode"'+':' + '"' + getTaxResult.DocCode  + '",' + '"Operation":"GetTax","ServiceURL":"Sandbox","Source":"ServiceQuote.CalculateSalesTax",'+ '"LineCount"'+':' + '"' + getTaxResult.TaxLines.TaxLine.size()  + '",'
                          + '"DocType"'+':' + '"' + getTaxResult.DocType  + '",'+'"EventBlock":"PostGetTax","FunctionName":"CalcTax"'  + '",'    
                          + '"ConnectorTime":' + '"' +  InitTime1  + '",' + '"ConnectorLatency":' + '"' +  Latency + '"' +
                          
                          ',"Message":' +' CONNECTORMETRICS, TYPE-GETTAX,'+' LINECOUNT-'+getTaxResult.TaxLines.TaxLine.size() +',DocCode- '+getTaxResult.DocCode +', ConnectorTime -'+ ' ' + InitTime1  + ',' + 'Connector Latency -' + Latency + ']';
                      
                      
                      
                  } else {
                      logs = '[' + '"CallerAccuNum":' + '"' +  avaConfig[0].Account_ID__c + '"' +
                          ',"LogType":"Performance","LogLevel":"Informational","ConnectorName":"AvaTax for ServiceMax","ConnectorVersion":"1.2",'+ '"DocCode"'+':' + '"' + getTaxResult.DocCode  + '",' + '"Operation":"GetTax ","ServiceURL":"Production","Source":"ServiceQuote.CalculateSalesTax",'+ '"LineCount"'+':' + '"' + getTaxResult.TaxLines.TaxLine.size()  + '",'
                          + '"DocType"'+':' + '"' + getTaxResult.DocType  + '",'+'"EventBlock":"PostGetTax","FunctionName":"CalcTax"' + '",'    
                          + '"ConnectorTime":' + '"' +  InitTime1  + '",' + '"ConnectorLatency":' + '"' +  Latency + '"' +
                          ',"Message":' +' CONNECTORMETRICS, TYPE-GETTAX,'+' LINECOUNT-'+getTaxResult.TaxLines.TaxLine.size() +',DocCode- '+getTaxResult.DocCode +', ConnectorTime -'+ ' ' + InitTime1 + ',' + 'Connector Latency -' + Latency + ']';
                      
                      
                  } 
                  
              }
              Ava_Utilities.AsyncGenerateLogs(logs);
          }
          
         }
         else
         {
             UpdateTaxData(getTaxResult,finalizeFlag); //OGTReq.Commit_x);
             
             throw new GetTaxException('' + getTaxResult.Messages.Message[0].RefersTo + ' - ' + getTaxResult.Messages.Message[0].Details + '' + getTaxResult.Messages.Message[0].Summary);
         }
         
         
     }
     catch(Exception ex)
     {
         
         List<string> MsgBoxLines = new List<string>{'Error','GetTax Threw an Error',ex.getMessage(),ex.getMessage()};
             getTaxResult = AVA_Utilities.ShowGetTaxErrors(MsgBoxLines);
         
     }
     //
     
     return getTaxResult; 
    }
    
    global PageReference RedirectPage()
    {
        // Redirect the user back to the original page         
        PageReference pageRef = new PageReference('/' + apCurPage);         
        
        pageRef.setRedirect(true);         
        return pageRef;               
    }
    
    private void BaseInitialize()
    {
        // When page is initialize we set the status using FetStatusValues as per configuration page setting
        avalaraStatuses = AVA_Utilities.FetchStatusVals();
        avaConfig = AVA_Utilities.FetchActiveSettings();
    }
}