public with sharing class AvaCompanyValidate
extends AvaBaseValidate
{
	private ID m_CompanyRec = null;
	
    public AvaCompanyValidate(ApexPages.StandardController controller)
    {
		m_CompanyRec =  m_apCurPage.getParameters().get('id');
    }
    
    public AvaCompanyValidate(AVA_SVMXC__AvaTaxCompany__c compRec)
    {
    	m_CompanyRec = compRec.ID;
    }

    public override AVA_SVMXC.AddressSvc.BaseAddress FetchOriginalAddress()
    {
    	AVA_SVMXC.AddressSvc.BaseAddress retVal = new AVA_SVMXC.AddressSvc.BaseAddress();
    	
        List<AVA_SVMXC__AvaTaxCompany__c> compAddrList = [select Name, AVA_SVMXC__City__c, AVA_SVMXC__CompanyCode__c, AVA_SVMXC__Country__c, 
        	AVA_SVMXC__PostalCode__c, AVA_SVMXC__Region__c, AVA_SVMXC__CompanyAddress__c
        	from AVA_SVMXC__AvaTaxCompany__c where ID =: m_CompanyRec];
        	
        if(compAddrList.size() > 0)
        {
        	List<String> Lines = AvaStaticUtils.parseStreetAddress(compAddrList[0].AVA_SVMXC__CompanyAddress__c);
        	retVal.Line1 = Lines[0];
        	retVal.Line2 = Lines[1];
        	retVal.Line3 = Lines[2];
         	retVal.City = compAddrList[0].AVA_SVMXC__City__c;
        	retVal.Region = compAddrList[0].AVA_SVMXC__Region__c;
        	retVal.PostalCode = compAddrList[0].AVA_SVMXC__PostalCode__c;
        	retVal.Country = compAddrList[0].AVA_SVMXC__Country__c;

        }
        return retVal;
    }
    
    public override PageReference Validate()
    {
    	return Validate(false);
    }

    public override PageReference Validate(boolean apiSuccessFlag)
    {
    	m_Redirect = Page.AvaCompAddrValPage;
    	PageReference pref = super.Validate(apiSuccessFlag);
  	
    	return pref;
    }
}