public with sharing class AvaLocAddrValMsg 
extends AvaMessageBox
{
    public PageReference UpdateAddress()
    {
    	string Country = '';
    	if(m_oUserMessage.AVA_SVMXC__Country_Col2__c != null && m_oUserMessage.AVA_SVMXC__Country_Col2__c.toLowerCase() == 'us')
    	{
    		Country = 'United States';
    	} 
    	else if(m_oUserMessage.AVA_SVMXC__Country_Col2__c != null && m_oUserMessage.AVA_SVMXC__Country_Col2__c.toLowerCase() == 'ca')
    	{
    		Country = 'Canada';
    	}
     	SVMXC__Site__c LocationRec = new SVMXC__Site__c(
    		ID=m_oUserMessage.ReturnPageID__c,  // != null ? m_oUserMessage.ReturnPageID__c : ApexPages.currentPage().getParameters().get('Id') ,
    		SVMXC__Street__c = m_oUserMessage.AVA_SVMXC__Message_Addr2__c,
    		SVMXC__City__c = m_oUserMessage.AVA_SVMXC__City_Col2__c,
    		SVMXC__State__c = m_oUserMessage.AVA_SVMXC__Region_Col2__c,
    		SVMXC__Zip__c = m_oUserMessage.AVA_SVMXC__PostalCode_Col2__c,
    		SVMXC__Country__c = Country,
    		SVMXC__Latitude__c = m_oUserMessage.AVA_SVMXC__Latitude_Col2__c,
    		SVMXC__Longitude__c = m_oUserMessage.AVA_SVMXC__Longitude_Col2__c
    	);
    	
    	if(!Test.IsRunningTest())
    	{
    		update LocationRec;
    	}
   	
        return super.DismissPage();               
    }

}