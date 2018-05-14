public with sharing class AvaCompAddrValMsg 
extends AvaMessageBox
{
    public PageReference UpdateAddress()
    {
    	AVA_SVMXC__AvaTaxCompany__c compRec = new AVA_SVMXC__AvaTaxCompany__c(
    		ID=m_oUserMessage.ReturnPageID__c,
    		AVA_SVMXC__CompanyAddress__c = m_oUserMessage.AVA_SVMXC__Message_Addr2__c,
    		AVA_SVMXC__City__c = m_oUserMessage.AVA_SVMXC__City_Col2__c,
    		AVA_SVMXC__Region__c = m_oUserMessage.AVA_SVMXC__Region_Col2__c,
    		AVA_SVMXC__PostalCode__c = m_oUserMessage.AVA_SVMXC__PostalCode_Col2__c,
    		AVA_SVMXC__Country__c = m_oUserMessage.AVA_SVMXC__Country_Col2__c
    	);
    	update compRec;
   	
        return super.DismissPage();               
    }

}