////////////////////////////////////////////////////////////////////////////////
// Utilities class - a namespace for static helper methods common to both
// WorkOrder and Service Quotes
////////////////////////////////////////////////////////////////////////////////
global with sharing class AVA_Utilities
{
    
    //Make one function of Exception which one use to shoe exception message using this.
    private class AVAException extends Exception
    {
        
    }
    
    static public boolean PickListsEnabled()
    {
        // if Account Billing Address is enabled, assume all addresses are enabled
        Map<String, Schema.SObjectField> M = Schema.SObjectType.Account.fields.getMap();
        return M.containsKey('billingstatecode');
    }
    
    
    
    public enum LogType {
        AuditLogs
            }
    
    public enum Month {
        Information
            }
    
    /**
* Returns an ...
* @Author : Ashish Bakhtar
* Method to Call Log Entries.
*
* @param  name  the name ...
* @return      the string ...
*/
    // Method to Call Log Entries
    //    @future(callout=true)
    public static Boolean GenerateLogs(String logs) {
        
        List<Avalara__c> AvaConfig = FetchActiveSettings();
        
        HttpRequest req = new HttpRequest();
        req.setMethod('POST');
        
        string logsCurl = logs.replace('=',':');
        string logsRCurl =  logsCurl.replace(':LogEntriesRequestConfigurations:','');
        
        req.setBody(logs );
        
        if(AvaConfig[0].Service_URL__c == 'https://avatax.avalara.net')
        {
            req.setEndpoint('https://webhook.logentries.com/noformat/logs/63a059a2-fecb-4334-8e58-c25c6a1a8129');
        }
        else
        {
            req.setEndpoint('https://webhook.logentries.com/noformat/logs/f9917a57-8348-4eb4-9bbe-fbd2d8ed0520');
            
        }
        Http http = new Http();
        
        HTTPResponse res = http.send(req);
        
        return true;
        
    }
    
    /**
* Returns an ...
* @Author : Ashish Bakhtar
* Method to Call Log Entries.
*
* @param  name  the name ...
* @return      the string ...
*/
    // Method to Call Log Entries
    @future(callout=true)
    public static void AsyncGenerateLogs(String logs) {
        List<Avalara__c> AvaConfig = FetchActiveSettings();
        
        
        HttpRequest req = new HttpRequest();
        req.setMethod('POST');
        
        string logsCurl = logs.replace('=',':');
        string logsRCurl =  logsCurl.replace(':LogEntriesRequestConfigurations:','');
        
        req.setBody(logs );
        
        if(AvaConfig[0].Service_URL__c == 'https://avatax.avalara.net')
        {
            req.setEndpoint('https://webhook.logentries.com/noformat/logs/63a059a2-fecb-4334-8e58-c25c6a1a8129');
        }
        else
        {
            req.setEndpoint('https://webhook.logentries.com/noformat/logs/f9917a57-8348-4eb4-9bbe-fbd2d8ed0520');
            
        } Http http = new Http();
        
        HTTPResponse res = http.send(req);
        system.debug('Service Response' +res.getBody());
        
    }        
    //Method to Generate Logs
    //To Show error messages proper 
    static public AVA_TaxSvc.GetTaxResult ShowGetTaxErrors(List<string> Messages)
    {
        AVA_TaxSvc.GetTaxResult getTaxErrors = new AVA_TaxSvc.GetTaxResult();
        getTaxErrors.Messages = new AVA_TaxSvc.ArrayOfMessage();
        getTaxErrors.Messages.Message = new List<AVA_TaxSvc.Message>();
        getTaxErrors.Messages.Message.add(new AVA_TaxSvc.Message());
        getTaxErrors.ResultCode = 'Unknown';
        getTaxErrors.Messages.Message[0].Name = '';
        getTaxErrors.Messages.Message[0].Summary = '';
        getTaxErrors.Messages.Message[0].Details = '';
        if(Messages == null)
        {
            throw new AVAException('ShowGetTaxErrors expects Non-Null Argument');
        }
        
        if(Messages.size() == 0)
        {
            Messages.add('Unknown');
        }
        
        while(Messages.size() < 4)
        {
            Messages.add(' ');
        }
        getTaxErrors.ResultCode = Messages[0];
        getTaxErrors.Messages.Message[0].Name = Messages[1];
        getTaxErrors.Messages.Message[0].Summary = Messages[2];
        for(Integer mc = 3; mc < Messages.size(); mc++)
        {
            getTaxErrors.Messages.Message[0].Details += Messages[mc] + ' ';
        }
        return getTaxErrors;
    }
    
    // called to get credentials for most Avalara ops - should return only 1 record
    // caller should check that only one is returned.
    static global List<Avalara__c> FetchActiveSettings()
    {
        List<Avalara__c> avaConfigRetVal = [select Id, Name, Active_Avalara_Setting__c,Commit_On_Status__c,
                                            Service_URL__c, Account_ID__c, License_Key__c,Origin_County__c,Company_Code__c,Customer_Code_Field__c,Enable_AvaTax_address_validation__c,Verify_Validated_Addresses__c,
                                            Origin_Street__c, Origin_City__c, Origin_State__c,Disable_Document_Commit__c,
                                            Origin_Postal_Code__c, Country__c,Return_address_in_upper_case__c,
                                            Enable_AvaTax_Tax_Calculation__c, 
                                            Automatic_Tax_Calculation__c, Trigger_Limit__c
                                            from Avalara__c where Active_Avalara_Setting__c= true];
        
        return avaConfigRetVal;   
    }
    
    // called to fetch credentials for current page - called by 
    // AvaTax4SFSettings Tab to test connect or validate origin address
    // for the current page.     
    
    static public List<Avalara__c> FetchCurrentSettings(Id apCurPage)
    {
        List<Avalara__c> avaConfigRetVal = [select Id, Name, Active_Avalara_Setting__c,Commit_On_Status__c,
                                            Service_URL__c, License_Key__c,Origin_County__c,Account_ID__c, Company_Code__c,Customer_Code_Field__c,Enable_AvaTax_address_validation__c,Verify_Validated_Addresses__c,
                                            Origin_Street__c, Origin_City__c, Origin_State__c,Return_address_in_upper_case__c,
                                            Origin_Postal_Code__c, Country__c,
                                            Enable_AvaTax_Tax_Calculation__c, 
                                            Automatic_Tax_Calculation__c,Trigger_Limit__c
                                            from Avalara__c where id=:apCurPage];
        return avaConfigRetVal;   
    }
    //Showing the messsages on pop up box
    static global PageReference ShowMessageBox(string MsgBoxTitle, List<string> MsgLines, ID RetPage)
    {
        //Connect-3200
        List<AvaMessage__c> m_loUserMessage;
        m_loUserMessage = [select  Title__c, MsgLine1__c, MsgLine2__c, MsgLine3__c, MsgLine4__c, MsgLine5__c, ReturnPage__c,
                           Increment__c from AvaMessage__c order by Increment__c];
        if(m_loUserMessage.size() > 9)
        {
            for(Integer i=0;i<(m_loUserMessage.size()-9);i++)
            {
                
                
                //Notes [Start] | Ashish Bakhtar <::> 2017-26-04 : Adding this code as a part of Salesforce Certification Security Issue Fixation | The Insert Code Part will get executed when Delete Permission Check is done | */  
                
                if (!AvaMessage__c.sObjectType.getDescribe().isDeletable())
                {
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL,'Insufficient access to delete AvaMessage__c custom object'));
                    
                    return null;
                }
                else
                {
                    delete m_loUserMessage[i];
                }
                //Notes [End] | Ashish Bakhtar <::> 2017-26-04 : Adding this code as a part of Salesforce Certification Security Issue Fixation | The Insert Code Part will get executed when Delete Permission Check is done | */  
                
            }
        }
        //Connect-3200
        AvaMessage__c oMsgBoxMessage = new AvaMessage__c();   
        
        //Notes [Start] | Ashish Bakhtar <::> 2017-26-04 : Adding this code as a part of Salesforce Certification Security Issue Fixation | The Insert Code Part will get executed when Create Permission Check is done | */  
        
        if (!(Schema.sObjectType.AvaMessage__c.fields.ReturnPage__c.isCreateable() && Schema.sObjectType.AvaMessage__c.fields.Title__c.isCreateable()
              && Schema.sObjectType.AvaMessage__c.fields.TimeStamp__c.isCreateable()   && Schema.sObjectType.AvaMessage__c.fields.ReturnPage__c.isCreateable() && Schema.sObjectType.AvaMessage__c.fields.Increment__c.isCreateable()))
        {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL,'Insufficient access to Create AvaMessage__c Custom Object'));
            
            return null;
        }
        
        //Notes [End] | Ashish Bakhtar <::> 2017-26-04 : Adding this code as a part of Salesforce Certification Security Issue Fixation | The Insert Code Part will get executed when Create Permission Check is done | */  
        
        oMsgBoxMessage.Title__c = MsgBoxTitle;
        AVA_Utilities.LoadMessage(oMsgBoxMessage, MsgLines);
        
        
        
        
        oMsgBoxMessage.ReturnPage__c = RetPage;
        DateTime n = datetime.now();
        oMsgBoxMessage.TimeStamp__c =  datetime.now();
        
        long increment = n.year() * 10000000000000L + n.dayOfYear()*10000000000L + n.hour()*100000000L + 
            n.minute()*1000000L + n.second()*10000L + n.millisecond();
        oMsgBoxMessage.Increment__c = increment;
        
        insert oMsgBoxMessage;
        
        PageReference pageRef = Page.MessageBoxPage;         
        pageRef.setRedirect(true);         
        return pageRef;               
    }
    //Showing the messsages on pop up box by passing id and message string and ID of that page
    static global PageReference ShowMessageBox(string MsgBoxTitle, string Msg, ID RetPage)
    {
        List<AvaMessage__c> m_loUserMessage;
        m_loUserMessage = [select  Title__c, MsgLine1__c, MsgLine2__c, MsgLine3__c, MsgLine4__c, MsgLine5__c, ReturnPage__c,
                           Increment__c from AvaMessage__c order by Increment__c];
        if(m_loUserMessage.size() > 9)
        {
            for(Integer i=0;i<(m_loUserMessage.size()-9);i++)
            {
                //Notes [Start] | Ashish Bakhtar <::> 2017-26-04 : Adding this code as a part of Salesforce Certification Security Issue Fixation | The Insert Code Part will get executed when Delete Permission Check is done | */  
                
                if (!AvaMessage__c.sObjectType.getDescribe().isDeletable())
                {
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL,'Insufficient access to delete AvaMessage__c custom object'));
                    
                    return null;
                }
                else
                {
                    
                    delete m_loUserMessage[i];
                }
                
                //Notes [End] | Ashish Bakhtar <::> 2017-26-04 : Adding this code as a part of Salesforce Certification Security Issue Fixation | The Insert Code Part will get executed when Delete Permission Check is done | */  
                
            }
        }
        AvaMessage__c oMsgBoxMessage = new AvaMessage__c();           
        
        //Notes [Start] | Ashish Bakhtar <::> 2017-26-04 : Adding this code as a part of Salesforce Certification Security Issue Fixation | The Insert Code Part will get executed when Create Permission Check is done | */  
        
        if (!(Schema.sObjectType.AvaMessage__c.fields.ReturnPage__c.isCreateable() && Schema.sObjectType.AvaMessage__c.fields.Title__c.isCreateable()
              && Schema.sObjectType.AvaMessage__c.fields.TimeStamp__c.isCreateable()   && Schema.sObjectType.AvaMessage__c.fields.ReturnPage__c.isCreateable() && Schema.sObjectType.AvaMessage__c.fields.Increment__c.isCreateable()))
        {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL,'Insufficient access to Create AvaMessage__c Custom Object'));
            
            return null;
        }
        
        //Notes [End] | Ashish Bakhtar <::> 2017-26-04 : Adding this code as a part of Salesforce Certification Security Issue Fixation | The Insert Code Part will get executed when Create Permission Check is done | */  
        
        oMsgBoxMessage.Title__c = MsgBoxTitle;
        List<string> MsgLines = AVA_Utilities.MessageChunk(Msg, 255);
        AVA_Utilities.LoadMessage(oMsgBoxMessage, MsgLines);
        oMsgBoxMessage.ReturnPage__c = RetPage;
        
        DateTime n = datetime.now();
        oMsgBoxMessage.TimeStamp__c =  datetime.now();
        long increment = n.year() * 10000000000000L + n.dayOfYear()*10000000000L + n.hour()*100000000L + 
            n.minute()*1000000L + n.second()*10000L + n.millisecond();
        oMsgBoxMessage.Increment__c = increment;
        
        insert oMsgBoxMessage;
        
        PageReference pageRef = Page.MessageBoxPage;         
        pageRef.setRedirect(true);
        return pageRef;
    }
    
    // Loads the lines from msgLines to msg2Load.MsgLineX__c
    // distributes evenly.  Silently loses all lines beyond the first 5
    static public void LoadMessage(AvaMessage__c msg2Load, List<String> msgLines)
    {
        if(msgLines == null) return;
        if(msgLines.size() == 0) return;
        
        
        if(msgLines.size() >= 5)
        {
            msg2Load.MsgLine1__c = msgLines[0];
            msg2Load.MsgLine2__c = msgLines[1];
            msg2Load.MsgLine3__c = msgLines[2];
            msg2Load.MsgLine4__c = msgLines[3];
            msg2Load.MsgLine5__c = msgLines[4];
        }
        else if(msgLines.size() == 4)
        {
            msg2Load.MsgLine1__c = msgLines[0];
            msg2Load.MsgLine2__c = msgLines[1];
            msg2Load.MsgLine3__c = msgLines[2];
            msg2Load.MsgLine4__c = msgLines[3];          
        }
        else if(msgLines.size() == 3)
        {
            msg2Load.MsgLine2__c = msgLines[0];
            msg2Load.MsgLine3__c = msgLines[1];
            msg2Load.MsgLine4__c = msgLines[2];          
        }
        else if(msgLines.size() == 2)
        {
            msg2Load.MsgLine3__c = msgLines[0];
            msg2Load.MsgLine4__c = msgLines[1];          
        }
        else
        {
            msg2Load.MsgLine3__c = msgLines[0];
        }
        return;
    }
    
    // MessageChunk breaks a String into up to an array of Strings that are
    // up to MaxLen chars each, broken on word boundaries.
    static public List<String> MessageChunk(String inMessage, Integer MaxLen)
    {
        List<String> words = inMessage.split(' ');
        List<String> returnVal = new List<String>();
        String buffer = '';
        for(String w : words)
        {
            if((buffer.length() + w.length() + 1) < MaxLen)
            {
                buffer += w + ' ';
            }
            else
            {
                returnVal.add(buffer);
                buffer = w;
            }
        }
        if(buffer.length() > 0)
        {
            returnVal.add(buffer);
        }
        return returnVal;
    }
    
    // returns a list of possible values for AvaTax4_SF_Status__c - so various
    // routines access common values
    static global List<String> FetchStatusVals()
    {
        
        return new List<String>{'Sales Tax Not Calculated','Sales Tax Current', 'Sales Tax Not Current', 'Finalized', 
            'Auto Sales Tax Calc Triggered - Refresh Your Browser For Result','Auto Commit Triggered - Refresh Your Browser For Result'};
                
                }
    // does an update with the update latch set (so that restricted fields can be updated)
    static global void LatchedUpdate(sObject dbObj)
    {
        UDL__c oUpdateLatch = new UDL__c(Name=dbObj.Id, ObjectId__c=dbObj.Id);
        insert oUpdateLatch;
        try
        {
            update dbObj;
            
            //Notes [Start] | Ashish Bakhtar <::> 2017-26-04 : Adding this code as a part of Salesforce Certification Security Issue Fixation | The Insert Code Part will get executed when Delete Permission Check is done | */  
            
            if (!UDL__c.sObjectType.getDescribe().isDeletable())
            {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL,'Insufficient access to delete UDL__c custom object'));
                
                return ;
            }
            else
            {
                
                delete oUpdateLatch;
            } 
            
            //Notes [End] | Ashish Bakhtar <::> 2017-26-04 : Adding this code as a part of Salesforce Certification Security Issue Fixation | The Insert Code Part will get executed when Delete Permission Check is done | */  
            
        }
        catch(Exception ex)
        {
            throw new AVAException(ex.getMessage());
        }
    }
    //Update the fields of current page in SF
    static global void LatchedUpdate(List<sObject> ldbObj)
    {
        if(ldbObj.size() == 0)
        {
            return;
        }
        List<UDL__c> lUpdateLatches = new List<UDL__c>();
        for(sObject sobj:ldbObj)
        {
            lUpdateLatches.add(new UDL__c(Name=sobj.Id, ObjectId__c=sobj.Id));
        }
        insert lUpdateLatches;
        try
        {
            update ldbObj;
            Integer  TotalConnTime= (((System.Now().second()) * 1000)+ (System.Now().millisecond())+((System.Now().minute()) * 60000));
            System.debug('Time to End' + TotalConnTime/1000 +'sec');
            
        }
        catch(Exception ex)
        {
            
            //Notes [Start] | Ashish Bakhtar <::> 2017-26-04 : Adding this code as a part of Salesforce Certification Security Issue Fixation | The Insert Code Part will get executed when Delete Permission Check is done | */  
            
            if ( !UDL__c.sObjectType.getDescribe().isDeletable())
            {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL,'Insufficient access to delete UDL__c custom object'));
                
                return ;
            }
            else
            {
                delete lUpdateLatches;
            }
            
            //Notes [End] | Ashish Bakhtar <::> 2017-26-04 : Adding this code as a part of Salesforce Certification Security Issue Fixation | The Insert Code Part will get executed when Delete Permission Check is done | */  
            
            throw new AVAException(ex.getMessage());
        }
        
        //Notes [Start] | Ashish Bakhtar <::> 2017-26-04 : Adding this code as a part of Salesforce Certification Security Issue Fixation | The Insert Code Part will get executed when Delete Permission Check is done | */  
        
        if (!UDL__c.sObjectType.getDescribe().isDeletable())
        {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL,'Insufficient access to delete UDL__c custom object'));
            
            return ;
        }
        else
        {
            delete lUpdateLatches; 
        } 
        //Notes [End] | Ashish Bakhtar <::> 2017-26-04 : Adding this code as a part of Salesforce Certification Security Issue Fixation | The Insert Code Part will get executed when Delete Permission Check is done | */  
        
    }
    @future (callout=true)
    static global void AsyncCancelTax(string PropBillingNum, string AltDocCode,  boolean testFlag )
    {
        string DocCode = 'notset';
        system.debug('id: ' + PropBillingNum);
        
        
        List<Avalara__c> avaConfig = AVA_Utilities.FetchActiveSettings();
        
        string CompanyCode;
        
        
        if(!Test.isRunningTest())	{
            AVA_TaxSvc.TaxSvcSoap taxSvc = new AVA_TaxSvc.TaxSvcSoap(avaConfig[0].Service_URL__c);
            taxSvc.Security.UsernameToken.Username = avaConfig[0].Account_ID__c;
            taxSvc.Security.UsernameToken.Password = avaConfig[0].License_Key__c;
            taxSvc.Profile = new AVA_TaxSvc.Profile();
            taxSvc.Profile.Client = 'AvaTax4SM';
            taxSvc.timeout_x = 30000;   // timeout to 10 seconds
            
            DocCode = AltDocCode;
            
            if(DocCode == null || DocCode.length() == 0)
            {
                DocCode = AltDocCode;
            }
            
            AVA_TaxSvc.CancelTaxRequest ctReq = new AVA_TaxSvc.CancelTaxRequest();
            ctReq.DocCode = DocCode;
            system.debug('Doccode' +DocCode);
            ctReq.CompanyCode = avaConfig[0].Company_Code__c;
            ctReq.CancelCode = 'DocVoided';
            ctReq.DocType = 'SalesInvoice';
            
            
            AVA_TaxSvc.CancelTaxresult ctres = null;
            
            if(testFlag == false)
            {
                
                ctres =  taxSvc.CancelTax(ctReq);
            }
            else
            {
                ctres = new AVA_TaxSvc.CancelTaxresult();
                ctres.ResultCode = 'Success';
            }
            
            string logs;
            
        } 
        
        
    }
 
    
     public static string CreateConfigurationLogs(Avalara__c avalara,string source) {
        string logs;
        string url;
        
           logs = '[' + '"CallerAccuNum":'+ '"' + Avalara.Account_ID__c  + '"' +
                            ',"LogType":"ConfigAudit","LogLevel":"Informational","ConnectorName":"AvaTax for ServiceMax","ConnectorVersion":"1.2","Operation":"ConfigChanges",'
                            +'"ServiceURL":' +'"' +  'Sandbox' +'"' +','+ '"Source":' +'"' +  'AvalaraConfiguration' +'"' +','+
                            '"FunctionName":"AvalaraConfigurSettingTrigger",'  +
                            '"Message":' + 'Account Number - ' + Avalara.Account_ID__c  + ','+ 
                            'Avalara Account Name- ' +  Avalara.Name+','+
                            'Active Avalara Setting - ' +  Avalara.Active_Avalara_Setting__c + ',' + 
                            'ServiceURL - ' + 'Sandbox'  + ',' + 'Company Code - ' + Avalara.Company_Code__c + ',' +                             
                            'Enable AvaTax Tax Calculation - ' +  Avalara.Enable_AvaTax_Tax_Calculation__c + ',' + 
                            'Re-calculate Tax upon Invoice Editing - ' +  Avalara.Automatic_Tax_Calculation__c +','+
                            'Enable AvaTax Address Validation - ' +  Avalara.Enable_AvaTax_address_validation__c+ ','+
                            'Return address in upper case - ' +  Avalara.Return_address_in_upper_case__c + ',' +
                            'Customer Code Field - ' +  Avalara.Customer_Code_Field__c+','+
                            'Verify Validated Addresses- ' +  Avalara.Verify_Validated_Addresses__c +','+
                            'Disable Document Commit - ' +  Avalara.Disable_Document_Commit__c + ',' + 
                            'Post WorkOrder on Status- ' +  Avalara.Commit_On_Status__c +',' +
                            
                            'Street- ' +  Avalara.Origin_Street__c +','+
                            'City - ' +  Avalara.Origin_City__c + ',' +
                            'State - ' +  Avalara.Origin_State__c +','+
                            'Postal Code- ' +  Avalara.Origin_Postal_Code__c + ',' +
                            'Country - ' +  Avalara.Country__c +']' ;
                        
                        
        return logs;
        
     }
   
}