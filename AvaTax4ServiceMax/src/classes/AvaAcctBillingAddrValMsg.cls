public with sharing class AvaAcctBillingAddrValMsg
extends AvaMessageBox
{
    public PageReference UpdateAddress()
    {
    	Account compRec = new Account(
    		ID=m_oUserMessage.ReturnPageID__c,
    		BillingStreet = m_oUserMessage.Message_Addr2__c,
    		BillingCity = m_oUserMessage.City_Col2__c,
    		BillingState = m_oUserMessage.Region_Col2__c,
    		BillingPostalCode = m_oUserMessage.PostalCode_Col2__c,
    		BillingCountry = m_oUserMessage.Country_Col2__c
    	);
    	update compRec;
    	return DismissPage();
    }
}