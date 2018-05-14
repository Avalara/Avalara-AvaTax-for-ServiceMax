public with sharing class AvaLocationValidate 
extends AvaBaseValidate
{
	private ID m_LocRec = null;
	
    public AvaLocationValidate(ApexPages.StandardController controller)
    {
    	m_LocRec = m_apCurPage.getParameters().get('id');
    }
    
    public AvaLocationValidate(SVMXC__Site__c locRec)
    {
    	m_LocRec = locRec.ID;
    }
    
    public override AVA_SVMXC.AddressSvc.BaseAddress FetchOriginalAddress()
    {
    	AVA_SVMXC.AddressSvc.BaseAddress retVal = new AVA_SVMXC.AddressSvc.BaseAddress();
    	
        List<SVMXC__Site__c> locAddrList = [select Name, SVMXC__Street__c, SVMXC__City__c, SVMXC__State__c,
        	SVMXC__Zip__c, SVMXC__Country__c, SVMXC__Latitude__c, SVMXC__Longitude__c
        	from SVMXC__Site__c where ID =: m_LocRec];

        if(locAddrList.size() > 0)
        {
        	if(locAddrList[0].SVMXC__Country__c.toLowerCase() == 'united states')
        	{
        		locAddrList[0].SVMXC__Country__c = 'US';
        	}
        	else if(locAddrList[0].SVMXC__Country__c.toLowerCase() == 'canada')
        	{
        		locAddrList[0].SVMXC__Country__c = 'CA';
        	}
        	List<String> Lines = AvaStaticUtils.parseStreetAddress(locAddrList[0].SVMXC__Street__c);
        	retVal.Line1 = Lines[0];
        	retVal.Line2 = Lines[1];
        	retVal.Line3 = Lines[2];
         	retVal.City = locAddrList[0].SVMXC__City__c;
        	retVal.Region = locAddrList[0].SVMXC__State__c;
        	retVal.PostalCode = locAddrList[0].SVMXC__Zip__c;
        	retVal.Country = locAddrList[0].SVMXC__Country__c;
        	retVal.Latitude = String.valueOf(locAddrList[0].SVMXC__Latitude__c);
        	retVal.Longitude = String.valueOf(locAddrList[0].SVMXC__Longitude__c);
        }
        return retVal;
    }
    
    public override PageReference Validate()
    {
    	return Validate(false);
    }
    
    public override PageReference Validate(boolean apiSuccessFlag)
    {
    	m_Redirect = Page.AvaLocationAddrValPage;
    	PageReference pref = super.Validate(apiSuccessFlag);
  	
    	return pref;
    }
}