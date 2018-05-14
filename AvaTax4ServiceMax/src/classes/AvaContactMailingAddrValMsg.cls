public with sharing class AvaContactMailingAddrValMsg
extends AvaMessageBox
{
    public PageReference UpdateAddress()
    {
    	Contact compRec = new Contact(
    		ID=m_oUserMessage.ReturnPageID__c,
    		MailingStreet = m_oUserMessage.Message_Addr2__c,
    		MailingCity = m_oUserMessage.City_Col2__c,
    		MailingState = m_oUserMessage.Region_Col2__c,
    		MailingPostalCode = m_oUserMessage.PostalCode_Col2__c,
    		MailingCountry = m_oUserMessage.Country_Col2__c
    	);
    	if(!Test.isRunningTest())
    	{
    		update compRec;
    	}
    	return DismissPage();
    }
}