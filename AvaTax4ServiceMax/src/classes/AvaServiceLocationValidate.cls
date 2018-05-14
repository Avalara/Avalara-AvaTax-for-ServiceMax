public with sharing class AvaServiceLocationValidate
extends AvaBaseValidate
{
	private ID m_LocRec = null;
	
    public AvaServiceLocationValidate(ApexPages.StandardController controller)
    {
    	m_LocRec = m_apCurPage.getParameters().get('id');
    }
    
    public AvaServiceLocationValidate(SVMXC__Service_Order__c locRec)
    {
    	m_LocRec = locRec.ID;
    }
    
    public override AVA_SVMXC.AddressSvc.BaseAddress FetchOriginalAddress()
    {
        AVA_SVMXC.AddressSvc.BaseAddress retVal = new AVA_SVMXC.AddressSvc.BaseAddress();
        
        List<SVMXC__Service_Order__c> compAddrList = [select Name, ID, SVMXC__Street__c, SVMXC__City__c, 
            SVMXC__State__c, SVMXC__Zip__c, SVMXC__Country__c
            from SVMXC__Service_Order__c where ID =: m_locRec];
            
        if(compAddrList.size() > 0)
        {
        	List<String> Lines = AvaStaticUtils.parseStreetAddress(compAddrList[0].SVMXC__Street__c);
        	retVal.Line1 = Lines[0];
        	retVal.Line2 = Lines[1];
        	retVal.Line3 = Lines[2];
            retVal.City = compAddrList[0].SVMXC__City__c;
            retVal.Region = compAddrList[0].SVMXC__State__c;
            retVal.PostalCode = compAddrList[0].SVMXC__Zip__c;
            retVal.Country = compAddrList[0].SVMXC__Country__c;
        }
        return retVal;
    }
    
    public override PageReference Validate()
    {
    	return Validate(false);
    }
    
    public override PageReference Validate(boolean apiSuccessFlag)
    {
        m_Redirect = Page.AvaServiceLocValPage;
        PageReference pref = super.Validate(apiSuccessFlag);
    
        return pref;
    }
}