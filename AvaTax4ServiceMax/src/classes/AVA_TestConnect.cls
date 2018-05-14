////////////////////////////////////////////////////////////////////////////////
// Called from Tax Service Custom Object.  Controller class for VF Page 
// invoked by "Test Connect" button.
////////////////////////////////////////////////////////////////////////////////
global with sharing class AVA_TestConnect
{
    string logs;
    global String apCurPage;
    global List<Avalara__c> avaConfig;
    private AvaMessage__c m_oUserMessage;
    global AVA_TestConnect(ApexPages.StandardController controller) 
    {
        apCurPage = ApexPages.currentPage().getParameters().get('id');
        m_oUserMessage = new AvaMessage__c();
    }
    
    global AVA_TestConnect(Id currSetting)
    {
        apCurPage = currSetting; 
    }
    
    global PageReference AVATestConnection()
    {
        return AVATestConnection(false,'',false);
    }
    
    global PageReference AVATestConnection(boolean verifyValidatedAddressFlag, String ResultCode, boolean configFlag)
    {
        
        try
        {
            //When Test Flag false and current page id not generate return silently
            if(null == apCurPage && verifyValidatedAddressFlag == false)
            {
                return null; 
            } 
            //Fetch current settings
            avaConfig = AVA_Utilities.FetchCurrentSettings(apCurPage);
            
            
            String s = JSON.serialize(avaConfig);
            
            if(verifyValidatedAddressFlag == true)
            {
                avaConfig = new List<Avalara__c>();
                Avalara__c tmp = new Avalara__c();
                avaConfig.add(tmp);
                if(configFlag == true)
                {
                    avaConfig.add(new Avalara__c());
                }
            }
            // At least one configuration setting would be active
            if(avaConfig.size() != 1)
            {
                if(avaConfig.size() != 1)
                {
                    List<string> MsgLines = new List<string>{'Expected 1 and only 1 Active Settings Record, but Found ' + avaConfig.size(),
                        ' Active Settings Record(s)','Check The TaxNowSettings Tab and be sure there is 1 and only 1',
                        'TaxNowSettings record with \'Active Tax Now Setting\' checked'};
                            return AVA_Utilities.ShowMessageBox('Error Fetching TaxNow Settings', MsgLines, apCurPage);
                } 
            }
            // if Service URL is not entered, throw error
            if(avaConfig[0].Service_URL__c == null)
            {
                List<string> MsgLines = new List<string>{'Please Enter Servicee URL ',
                    'Service URL is blank.',
                    'You must enter Service URL. It is blank'};
                        return AVA_Utilities.ShowMessageBox('Error Fetching TaxNow Settings', MsgLines, apCurPage);
            }
            //If Username is not entered, throw error.
            
            //if cutomer entered wrong Password, handle from client site. Not hit the Avalara Services.
            if(avaConfig[0].License_Key__c == null)
            {
                List<string> MsgLines = new List<string>{'Please Enter Password',
                    'Password is blank.',
                    'You must enter password. It is blank'};
                        return AVA_Utilities.ShowMessageBox('Error Fetching TaxNow Settings', MsgLines, apCurPage);
            }
            //if cutomer entered wrong Account Id, handle from client site. Not hit the Avalara Services.
            if(avaConfig[0].Account_ID__c == null)
            {
                List<string> MsgLines = new List<string>{'Please Enter Account ID',
                    'Account ID is blank.',
                    'You must enter account id. It is blank'};
                        return AVA_Utilities.ShowMessageBox('Error Fetching TaxNow Settings', MsgLines, apCurPage);
            }
            
            
            AVA_TaxSvc.TaxSvcSoap taxSvc = new AVA_TaxSvc.TaxSvcSoap(avaConfig[0].Service_URL__c);
            taxSvc.Security = new AVA_TaxSvc.Security();
            taxSvc.Security.UsernameToken.Username = avaConfig[0].Account_ID__c;
            taxSvc.Security.UsernameToken.Password = avaConfig[0].License_Key__c;
            taxSvc.Profile.Client = 'AvaTax4SMax 1.7||1.2';
            taxSvc.timeout_x = 30000;   // timeout 30 seconds
            AVA_TaxSvc.IsAuthorizedResult pingAuthorizationResult = null;
            AVA_TaxSvc.PingResult pingResult = null;
            if(verifyValidatedAddressFlag == false)
            {
                pingAuthorizationResult = taxSvc.IsAuthorized('IsAuthorized');
                pingResult = taxSvc.Ping('');
            }
            
            List<string> MsgLines = new List<string>();
            m_oUserMessage.Title__c = 'Test Connect Result';
            m_oUserMessage.MsgLine1__c = 'Test Connection Returned: ' + pingResult.ResultCode;
            
            if(pingResult.ResultCode == 'Success' || pingAuthorizationResult.ResultCode == 'Success')
            {
                
                if(avaConfig[0].Service_URL__c != 'https://avatax.avalara.net')
                {
                    logs = '['+ '"CallerAccuNum":' + '"' +  avaConfig[0].Account_ID__c + '"' + ',"LogType":"Debug","LogLevel":"Informational","ConnectorName":"AvaTax for  ServiceMax","ConnectorVersion":"1.2","Operation":"IsAuthorized","ServiceURL":"'  +  'Sandbox' +'","FunctionName":"TestConnection","Message":"You are Connected to AvaTax"]';
                } else {
                    logs = '['+ '"CallerAccuNum":' + '"' +  avaConfig[0].Account_ID__c + '"' + ',"LogType":"Debug","LogLevel":"Informational","ConnectorName":"AvaTax for ServiceMax","ConnectorVersion":"1.2","Operation":"IsAuthorized","ServiceURL":"'  +  'Production' +'","FunctionName":"TestConnection","Message":"You are Connected to AvaTax"]';
                }   
                
                
                
                MsgLines.add('Test Connection Returned: ' + pingResult.ResultCode);
                MsgLines.add('Credentials and Service Availability Verified');
                MsgLines.add('Current Service Version : ' + pingResult.Version);
                MsgLines.add('Avalara Connector Version Number : ' + taxSvc.Profile.Client);
                MsgLines.add('Current Account Expiration : ' + (pingAuthorizationResult.Expires.date()+1));
            }
            else
            {  
                if(avaConfig[0].Service_URL__c != 'https://avatax.avalara.net')
                {
                    logs = '['+ '"CallerAccuNum":' + '"' +  avaConfig[0].Account_ID__c + '"' + ',"LogType":"Debug","LogLevel":"Error","ConnectorName":"AvaTax for  ServiceMax","ConnectorVersion":"1.2","Operation":"IsAuthorized","ServiceURL":"'  +  'Sandbox' +'","FunctionName":"TestConnection","Message":' + '"' + pingResult.Messages.Message[0].Summary +'"'+']';
                } else {
                    logs = '['+ '"CallerAccuNum":' + '"' +  avaConfig[0].Account_ID__c + '"' + ',"LogType":"Debug","LogLevel":"Error","ConnectorName":"AvaTax for ServiceMax","ConnectorVersion":"1.2","Operation":"IsAuthorized","ServiceURL":"'  +  'Production' +'","FunctionName":"TestConnection","Message":'+ '"' +pingResult.Messages.Message[0].Summary +'"'+']';
                }   
                
                MsgLines.add('Test Connection Returned : ' + 'Failed');
                
                MsgLines.add('Error Message : ' + pingResult.Messages.Message[0].Name);
                MsgLines.add('Summary : ' + pingResult.Messages.Message[0].Summary );
                MsgLines.add('Details : ' + pingResult.Messages.Message[0].Details);
            }
            Ava_Utilities.GenerateLogs(logs);     
            
            PageReference foo = AVA_Utilities.ShowMessageBox('Test Connect Result', MsgLines, apCurPage);
            
            return foo;            
        }
        catch( Exception ex ) 
        {
            if(avaConfig!=null)
            {
                if(avaConfig[0].Service_URL__c != 'https://avatax.avalara.net')
                {
                    logs = '['+ '"CallerAccuNum":' + '"' +  avaConfig[0].Account_ID__c + '"' + ',"LogType":"Debug","LogLevel":"Exception","ConnectorName":"AvaTax for  ServiceMax","ConnectorVersion":"1.2","Operation":"IsAuthorized","ServiceURL":"'  +  'Sandbox' +'","FunctionName":"TestConnection","Message":' + '"' + ex.getMessage() +'"'+']';
                } else {
                    logs = '['+ '"CallerAccuNum":' + '"' +  avaConfig[0].Account_ID__c + '"' + ',"LogType":"Debug","LogLevel":"Exception","ConnectorName":"AvaTax for ServiceMax","ConnectorVersion":"1.2","Operation":"IsAuthorized","ServiceURL":"'  +  'Production' +'","FunctionName":"TestConnection","Message":'+ '"' +ex.getMessage() +'"'+']';
                }
            }
            else
            {  
                logs = '['+ '"CallerAccuNum":' + '"' +  'null' + '"' + ',"LogType":"Debug","LogLevel":"Exception","ConnectorName":"AvaTax for  ServiceMax","ConnectorVersion":"1.2","Operation":"IsAuthorized","ServiceURL":"'  +  'Sandbox' +'","FunctionName":"TestConnection","Message":' + '"' + ex.getMessage() +'"'+']';
            }
            Ava_Utilities.GenerateLogs(logs);    
            
            return AVA_Utilities.ShowMessageBox('Test Connect Encountered An Exception', ex.getMessage(), apCurPage);
        }
    }
    
    global PageReference RedirectPage()
    {
        // Redirect the user back to the original page         
        PageReference pageRef = new PageReference('/' + apCurPage);         
        
        pageRef.setRedirect(true);         
        return pageRef;               
    }
}