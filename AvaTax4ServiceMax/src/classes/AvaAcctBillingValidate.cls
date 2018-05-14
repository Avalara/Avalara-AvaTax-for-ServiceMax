public with sharing class AvaAcctBillingValidate
extends AvaBaseValidate
{
	private ID m_AccountRec = null;
	
    public AvaAcctBillingValidate(ApexPages.StandardController controller)
    {
    	m_AccountRec =  m_apCurPage.getParameters().get('id');
    }
    
    public AvaAcctBillingValidate(Account acctRec)
    {
    	m_AccountRec = acctRec.ID;
    }
    
    public override AVA_SVMXC.AddressSvc.BaseAddress FetchOriginalAddress()
    {
    	AVA_SVMXC.AddressSvc.BaseAddress retVal = new AVA_SVMXC.AddressSvc.BaseAddress();
    	
        List<Account> acctAddrList = [select Name, ID, BillingStreet, BillingCity, BillingState, 
        	BillingPostalCode, BillingCountry from Account where ID =: m_AccountRec];
        	
        if(acctAddrList.size() > 0)
        {
        	List<String> Lines = AvaStaticUtils.parseStreetAddress(acctAddrList[0].BillingStreet);
        	retVal.Line1 = Lines[0];
        	retVal.Line2 = Lines[1];
        	retVal.Line3 = Lines[2];
         	retVal.City = acctAddrList[0].BillingCity;
        	retVal.Region = acctAddrList[0].BillingState;
        	retVal.PostalCode = acctAddrList[0].BillingPostalCode;
        	retVal.Country = acctAddrList[0].BillingCountry;
        }
        return retVal;
    }
    
    public override PageReference Validate()
    {
    	return Validate(false);
    }
    
    public override PageReference Validate(boolean apiSuccessFlag)
    {
    	m_Redirect = Page.AvaAcctBillingAddrValPage;
    	PageReference pref = super.Validate(apiSuccessFlag);
  	
    	return pref;
    }
}