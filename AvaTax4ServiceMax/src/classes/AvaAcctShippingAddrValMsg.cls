public with sharing class AvaAcctShippingAddrValMsg 
extends AvaMessageBox
{
    public PageReference UpdateAddress()
    {
    	Account compRec = new Account(
    		ID=m_oUserMessage.ReturnPageID__c,
    		ShippingStreet = m_oUserMessage.Message_Addr2__c,
    		ShippingCity = m_oUserMessage.City_Col2__c,
    		ShippingState = m_oUserMessage.Region_Col2__c,
    		ShippingPostalCode = m_oUserMessage.PostalCode_Col2__c,
    		ShippingCountry = m_oUserMessage.Country_Col2__c
    	);
    	update compRec;
    	return DismissPage();
    }
}