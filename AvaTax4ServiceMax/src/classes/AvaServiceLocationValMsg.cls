public with sharing class AvaServiceLocationValMsg 
extends AvaMessageBox
{
    public PageReference UpdateAddress()
    {
    	SVMXC__Service_Order__c compRec = new SVMXC__Service_Order__c(
    		ID=m_oUserMessage.ReturnPageID__c,
    		SVMXC__Street__c = m_oUserMessage.AVA_SVMXC__Message_Addr2__c,
    		SVMXC__City__c = m_oUserMessage.AVA_SVMXC__City_Col2__c,
    		SVMXC__State__c = m_oUserMessage.AVA_SVMXC__Region_Col2__c,
    		SVMXC__Zip__c = m_oUserMessage.AVA_SVMXC__PostalCode_Col2__c,
    		SVMXC__Country__c = m_oUserMessage.AVA_SVMXC__Country_Col2__c
    	);
    	
    	if(!Test.isRunningTest())
    	{
    		update compRec;
    	}
   	
        String retPage = '/apex/SVMXC__COMM_validateAddress?objID=' +  compRec.ID + 
             '&city=SVMXC__City__c&country=SVMXC__Country__c&latitude=SVMXC__Latitude__c&longitude=SVMXC__Longitude__c&' +
             'objName=SVMXC__Service_Order__c&state=SVMXC__State__c&street=SVMXC__Street__c&zip=SVMXC__Zip__c';
       
        PageReference pageRef = new PageReference(retPage);         
        pageRef.setRedirect(true);         
        return pageRef;
    }
}