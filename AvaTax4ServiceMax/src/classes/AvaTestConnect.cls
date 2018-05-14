public with sharing class AvaTestConnect 
{
    private PageReference apCurPage;

   
    public AvaTestConnect(ApexPages.StandardController controller) 
    {
       apCurPage = ApexPages.currentPage();
    }
    
    public AvaTestConnect(PageReference currentPage)
    {
		apCurPage = currentPage;    
    }
    
    public PageReference TestConnection()
    {
    	return TestConnection(false);	
    }
    
    public PageReference TestConnection(boolean successFlag)
    {
    	string UserMessage;
    	string Title;
    	
        AVA_SVMXC__AvaTaxConfiguration__c config = null;
        
        if(!Test.isRunningTest())
        {
        	config = AVA_SVMXC.AvaStaticUtils.FetchCurrentCredentials();
        }
        else
        {
        	config = new AVA_SVMXC__AvaTaxConfiguration__c(AVA_SVMXC__Account_Number__c = '123456', 
        		AVA_SVMXC__Avalara_Service_URL__c = 'https://bogusavalaraurl.net', 
        		AVA_SVMXC__License_Key__c = 'foo',  
        		AVA_SVMXC__Current_Setting__c = true);
        }
        
        	
        if(config != null)
        {
            AVA_SVMXC.TaxSvc.TaxSvcSoap taxSvc = new AVA_SVMXC.TaxSvc.TaxSvcSoap(config.AVA_SVMXC__Avalara_Service_URL__c);
            taxSvc.Security = new AVA_SVMXC.TaxSvc.Security();
            taxSvc.Security.UsernameToken.Username = config.AVA_SVMXC__Account_Number__c;
            taxSvc.Security.UsernameToken.Password = config.AVA_SVMXC__License_Key__c;
            taxSvc.Profile.Client = 'AvaTax4ServiceMax,1.0.0';
            taxSvc.timeout_x = 30000;   // timeout 30 seconds
			taxSvc.IsAuthorizedResult opres = null;
			try
			{
				if(!Test.isRunningTest())
				{
					opres = taxSvc.IsAuthorized('IsAuthorized');
				}
				else
				{
					opres = new taxSvc.IsAuthorizedResult();
					if(successFlag)
					{
						opres.ResultCode = 'Success';
					}					
					else
					{
						opres.ResultCode = 'Fail';
	            		opres.Messages = new TaxSvc.ArrayOfMessage();
	            		opres.Messages.Message = new TaxSvc.Message[1];
	            		//opres.Messages.Message[0].Name = apCurPage;
	            		opres.Messages.Message[0].Summary = 'Contrived Error for Unit Tests';
	            		opres.Messages.Message[0].Details = 'Contrived Error for Unit Tests';
					}
				}
				
				Title = 'TestConnect Result: ' + opres.ResultCode + '\r\n';
				if(opres.ResultCode == 'Success')
				{
					UserMessage = 'Avalara Service URL \'' + config.AVA_SVMXC__Avalara_Service_URL__c +
						'\' Availability Verified\r\nAccount Number \'' + config.AVA_SVMXC__Account_Number__c +
						'\' Validated\r\nExpiration Date: ' + opres.Expires.date();
	            }
    	        else
        	    {
            	    UserMessage = 'Error Message: ' + opres.Messages.Message[0].Name + '\r\n' +
                		'Summary: ' + opres.Messages.Message[0].Summary + '\r\n' +
                 		'Details: ' + opres.Messages.Message[0].Details;
				}
			}
			catch(Exception ex)
			{
				return AvaStaticUtils.ShowException(ex, apCurPage);
			}
            
        }
        else
        {
        	Title = 'No Configuration Object Found';
            UserMessage = 'Error: No AvaTaxConfiguration Object Found';
        }
        return AvaStaticUtils.ShowMessageBox(Title,UserMessage,apCurPage);
    }
}