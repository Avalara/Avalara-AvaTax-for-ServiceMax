public with sharing abstract class AvaBaseValidate 
{
    protected PageReference m_apCurPage;
    protected PageReference m_Redirect;

    public AvaBaseValidate() 
    {
       m_apCurPage = ApexPages.currentPage();
    }
    
	public virtual PageReference Validate(boolean apiSuccessFlag)
	{
		try
		{
			AVA_SVMXC.AddressSvc.BaseAddress Original = FetchOriginalAddress();
			Original.Line1 = Original.Line1 != null ? Original.Line1.trim() : '';
			Original.Line2 = Original.Line2 != null ? Original.Line2.trim() : '';
	        Original.Line3 = Original.Line3 != null ? Original.Line3.trim() : '';
    	    Original.City = Original.City != null ? Original.City.trim() : '';
        	Original.Region = Original.Region != null ? Original.Region.trim() : '';
        	Original.PostalCode = Original.PostalCode != null ? Original.PostalCode.trim() : '';
        	Original.Country = Original.Country != null ? Original.Country.trim() : '';
        	if(Original.Country.toLowerCase() != 'us' && Original.Country.toLowerCase() != 'ca' && Original.Country.length() > 0)
        	{
        		return AvaStaticUtils.ShowMessageBox('UnSupported Country:[' + Original.Country + ']', 'Address Validation Only Supports US and Canada Addresses', m_apCurPage);
        	}
			AVA_SVMXC__AvaTaxConfiguration__c config;
			//string svcUrl;
			
			if(!Test.IsRunningTest())
			{
				config = AVA_SVMXC.AvaStaticUtils.FetchActiveCredentials();
				//svcUrl = config.AVA_SVMXC__Avalara_Service_URL__c;
			}
			else
			{
				config = new AVA_SVMXC__AvaTaxConfiguration__c(AVA_SVMXC__Avalara_Service_URL__c = 'https://testingsvcurl.net',
					AVA_SVMXC__Account_Number__c = '12345678',AVA_SVMXC__License_Key__c ='Excelsior'); 
			}
			AVA_SVMXC.AddressSvc.AddressSvcSoap aSvc = new AVA_SVMXC.AddressSvc.AddressSvcSoap(config.AVA_SVMXC__Avalara_Service_URL__c);
			aSvc.apiSuccessFlag = apiSuccessFlag;
	        aSvc.Security = new AVA_SVMXC.AddressSvc.Security();
	        aSvc.Security.UsernameToken.Username = config.AVA_SVMXC__Account_Number__c;
	        aSvc.Security.UsernameToken.Password = config.AVA_SVMXC__License_Key__c;
	        aSvc.Profile.Client = 'AvaTax4ServiceMax,0.9.0';
	        aSvc.timeout_x = 30000;   // timeout 30 seconds
			AVA_SVMXC.AddressSvc.ValidateRequest vreq = new AVA_SVMXC.AddressSvc.ValidateRequest();
			vreq.Address = Original;
		
			vreq.TextCase = 'Mixed';
			vreq.Coordinates = true;
			AddressSvc.ValidateResult vres = null;
		
			vres = aSvc.Validate(vreq);
			if(vres.ResultCode == 'Success')
			{
				return AvaStaticUtils.ShowAddresses('Avalara Address Validation', Original, 
					vres.ValidAddresses.ValidAddress[0], m_apCurPage,m_Redirect);
			}
			else
			{
				return AvaStaticUtils.ShowMessageBox('Validate Returned: ' + vres.ResultCode, 
					'Error Message: ' + vres.Messages.Message[0].Name + '\r\n' +
                	'Summary: ' + vres.Messages.Message[0].Summary + '\r\n' +
                 	'Details: ' + vres.Messages.Message[0].Details, m_apCurPage);
			}
		}
		catch(Exception ex)
		{
			return AvaStaticUtils.ShowException(ex, m_apCurPage);
		}
	}
	

	/* Call to implementation instantiates m_Original */
	public abstract AVA_SVMXC.AddressSvc.BaseAddress FetchOriginalAddress();
    public abstract PageReference Validate();
}