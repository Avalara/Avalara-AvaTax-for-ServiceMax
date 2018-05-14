public with sharing class AvaContactMailingValidate
extends AvaBaseValidate
{
	private ID m_ContactRec = null;
	
    public AvaContactMailingValidate(ApexPages.StandardController controller)
    {
    	m_ContactRec = m_apCurPage.getParameters().get('id');
    }
    
    public AvaContactMailingValidate(Contact contRec)
    {
    	m_ContactRec = contRec.ID;
    }

    public override AVA_SVMXC.AddressSvc.BaseAddress FetchOriginalAddress()
    {
    	AVA_SVMXC.AddressSvc.BaseAddress retVal = new AVA_SVMXC.AddressSvc.BaseAddress();
    	
        List<Contact> contactAddrList = [select Name, ID, MailingStreet, MailingCity, MailingState, 
        	MailingPostalCode, MailingCountry from Contact where ID =: m_ContactRec];
        	
        if(contactAddrList.size() > 0)
        {
        	List<String> Lines = AvaStaticUtils.parseStreetAddress(contactAddrList[0].MailingStreet);
        	retVal.Line1 = Lines[0];
        	retVal.Line2 = Lines[1];
        	retVal.Line3 = Lines[2];
         	retVal.City = contactAddrList[0].MailingCity;
        	retVal.Region = contactAddrList[0].MailingState;
        	retVal.PostalCode = contactAddrList[0].MailingPostalCode;
        	retVal.Country = contactAddrList[0].MailingCountry;
        }
        return retVal;
    }
    
    public override PageReference Validate()
    {
    	return Validate(false);
    }
    
    public override PageReference Validate(boolean apiSuccessFlag)
    {
    	m_Redirect = Page.AvaContactMailingAddrValPage;
    	PageReference pref = super.Validate(apiSuccessFlag);
  	
    	return pref;
    }
}