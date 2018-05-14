public with sharing class AvaContactOtherValidate
extends AvaBaseValidate
{
	private ID m_ContactRec = null;
	
    public AvaContactOtherValidate(ApexPages.StandardController controller)
    {
    	m_ContactRec = m_apCurPage.getParameters().get('id');
    }
    
    public AvaContactOtherValidate(Contact contRec)
    {
    	m_ContactRec = contRec.ID;
    }
    
    
    public override AVA_SVMXC.AddressSvc.BaseAddress FetchOriginalAddress()
    {
    	AVA_SVMXC.AddressSvc.BaseAddress retVal = new AVA_SVMXC.AddressSvc.BaseAddress();
    	
        List<Contact> contactAddrList = [select Name, ID, OtherStreet, OtherCity, OtherState, 
        	OtherPostalCode, OtherCountry from Contact where ID =: m_ContactRec];
        	
        if(contactAddrList.size() > 0)
        {
        	List<String> Lines = AvaStaticUtils.parseStreetAddress(contactAddrList[0].OtherStreet);
        	retVal.Line1 = Lines[0];
        	retVal.Line2 = Lines[1];
        	retVal.Line3 = Lines[2];
         	retVal.City = contactAddrList[0].OtherCity;
        	retVal.Region = contactAddrList[0].OtherState;
        	retVal.PostalCode = contactAddrList[0].OtherPostalCode;
        	retVal.Country = contactAddrList[0].OtherCountry;
        }
        return retVal;
    }
    
    public override PageReference Validate()
    {
    	return Validate(false);
    }
    
    public override PageReference Validate(boolean apiSuccessFlag)
    {
    	m_Redirect = Page.AvaContactOtherAddrValPage;
    	PageReference pref = super.Validate(apiSuccessFlag);
  	
    	return pref;
    }
}