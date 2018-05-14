public with sharing abstract class AvaBaseTaxCalc
{
	protected PageReference m_apCurPage;

	abstract AVA_SVMXC.TaxSvc.GetTaxRequest FetchTaxData(ID DefaultAvaCompany);
	abstract void UpdateTaxData(AVA_SVMXC.TaxSvc.GetTaxResult CalcResult);
	
	public AvaBaseTaxCalc()
    {
    }

	public virtual PageReference CalculateTax()
	{
		return CalculateTax(false);
	}
	
	public PageReference CalculateTax(boolean successFlag)
	{
		try
		{
	        AVA_SVMXC__AvaTaxConfiguration__c config = null;
	        
	        if(!Test.isRunningTest())
	        {
	        	config = AVA_SVMXC.AvaStaticUtils.FetchActiveCredentials();
	        }
	        else
	        {
	        	AVA_SVMXC__AvaTaxCompany__c dfltcomp = new AVA_SVMXC__AvaTaxCompany__c(AVA_SVMXC__City__c = 'Noname City', 
	        		AVA_SVMXC__CompanyCode__c ='NNC', 
	        		AVA_SVMXC__Country__c = 'US', 
	        		AVA_SVMXC__PostalCode__c = '90210', 
	        		AVA_SVMXC__Region__c = 'CA');
	        		
	        	insert dfltcomp;
	        	
	        	config = new AVA_SVMXC__AvaTaxConfiguration__c(AVA_SVMXC__Account_Number__c = '123456', 
	        		AVA_SVMXC__Avalara_Service_URL__c = 'https://bogusavalaraurl.net', 
	        		AVA_SVMXC__License_Key__c = 'foo',  
	        		AVA_SVMXC__Current_Setting__c = true,
	        		AVA_SVMXC__Default_Company__c = dfltcomp.iD);
	        }
			string svcUrl = config.AVA_SVMXC__Avalara_Service_URL__c;
			
			AVA_SVMXC.TaxSvc.TaxSvcSoap aSvc = new AVA_SVMXC.TaxSvc.TaxSvcSoap(config.AVA_SVMXC__Avalara_Service_URL__c);
	        aSvc.Security = new AVA_SVMXC.TaxSvc.Security();
	        aSvc.Security.UsernameToken.Username = config.AVA_SVMXC__Account_Number__c;
	        aSvc.Security.UsernameToken.Password = config.AVA_SVMXC__License_Key__c;
	        aSvc.Profile.Client = 'AvaTax4ServiceMax,0.9.0';
	        aSvc.timeout_x = 30000;   // timeout 30 seconds
			AVA_SVMXC.TaxSvc.GetTaxRequest gtreq = null;
			AVA_SVMXC.TaxSvc.GetTaxResult gtres = null;
			if(!Test.isRunningTest())
			{
				gtreq = FetchTaxData(config.AVA_SVMXC__Default_Company__c);
				gtres = aSvc.GetTax(gtreq);
			}
			else
			{
				gtres = new TaxSvc.GetTaxResult();
				if(successFlag)
				{
					gtres.ResultCode = 'Success';
				}					
				else
				{
					gtres.ResultCode = 'Fail';
				}
			}
			if(gtres.ResultCode != 'Success')
			{
				string msg = 'Result Code: ' + gtres.ResultCode;
				msg += '\r\nName: ' + gtres.Messages.Message[0].Name + '\r\nError Message: ' + gtres.Messages.Message[0].Details;
				if(!Test.isRunningtest())
				{
					throw new AvaStaticUtils.AvaException(msg);
				}
				else
				{
					return m_apCurPage; // testing - failure likely on purpose
				}
			}
			UpdateTaxData(gtres);
	        m_apCurPage.setRedirect(false);         
			return m_apCurPage;
		}
		catch(Exception ex)
		{
			return AvaStaticUtils.ShowException(ex, m_apCurPage);
		}
	}
	
	static public AVA_SVMXC.TaxSvc.BaseAddress MakeBaseAddress(SVMXC__Site__c Location)
    {
    	AVA_SVMXC.TaxSvc.BaseAddress rVal = new AVA_SVMXC.TaxSvc.BaseAddress();
	    if(Location.SVMXC__Country__c.toLowerCase() == 'united states')
       	{
       		Location.SVMXC__Country__c = 'US';
       	}
       	else if(Location.SVMXC__Country__c.toLowerCase() == 'canada')
       	{
       		Location.SVMXC__Country__c = 'CA';
       	}
        rVal = new AVA_SVMXC.TaxSvc.BaseAddress();
        List<string> Lines = AvaStaticUtils.parseStreetAddress(Location.SVMXC__Street__c);
        rVal.Line1 = Lines[0];
        rVal.Line2 = Lines[1];
        rVal.Line3 = Lines[2];
        rVal.City = Location.SVMXC__City__c;
        rVal.Region = Location.SVMXC__State__c;
        rVal.PostalCode = Location.SVMXC__Zip__c;
        rVal.Country = Location.SVMXC__Country__c;	        	
    	rVal.AddressCode = Location.ID;
    	
     	return rVal;
    }
	
}