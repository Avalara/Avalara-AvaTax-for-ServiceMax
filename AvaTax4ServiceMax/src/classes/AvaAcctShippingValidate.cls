public with sharing class AvaAcctShippingValidate 
extends AvaBaseValidate
{
	private ID m_AccountRec = null;
	
    public AvaAcctShippingValidate(ApexPages.StandardController controller)
    {
    	m_AccountRec =  m_apCurPage.getParameters().get('id');
    }
    
    public AvaAcctShippingValidate(Account acctRec)
    {
    	m_AccountRec = acctRec.ID;
    }
    
    public override AVA_SVMXC.AddressSvc.BaseAddress FetchOriginalAddress()
    {
    	AVA_SVMXC.AddressSvc.BaseAddress retVal = new AVA_SVMXC.AddressSvc.BaseAddress();
    	
        List<Account> acctAddrList = [select Name, ID, ShippingStreet, ShippingCity, ShippingState, 
        	ShippingPostalCode, ShippingCountry from Account where ID =: m_AccountRec];
        	
        if(acctAddrList.size() > 0)
        {
        	List<String> Lines = AvaStaticUtils.parseStreetAddress(acctAddrList[0].ShippingStreet);
        	retVal.Line1 = Lines[0];
        	retVal.Line2 = Lines[1];
        	retVal.Line3 = Lines[2];
         	retVal.City = acctAddrList[0].ShippingCity;
        	retVal.Region = acctAddrList[0].ShippingState;
        	retVal.PostalCode = acctAddrList[0].ShippingPostalCode;
        	retVal.Country = acctAddrList[0].ShippingCountry;
        }
        return retVal;
    }
    
    public override PageReference Validate()
    {
    	return Validate(false);
    }
    
    public override PageReference Validate(boolean apiSuccessFlag)
    {
    	m_Redirect = Page.AvaAcctShippingAddrValPage;
    	PageReference pref = super.Validate(apiSuccessFlag);
  	
    	return pref;
    }
}