public with sharing class AvaContactOtherAddrValMsg
extends AvaMessageBox
{
    public PageReference UpdateAddress()
    {
    	Contact compRec = new Contact(
    		ID=m_oUserMessage.ReturnPageID__c,
    		OtherStreet = m_oUserMessage.Message_Addr2__c,
    		OtherCity = m_oUserMessage.City_Col2__c,
    		OtherState = m_oUserMessage.Region_Col2__c,
    		OtherPostalCode = m_oUserMessage.PostalCode_Col2__c,
    		OtherCountry = m_oUserMessage.Country_Col2__c
    	);
    	if(!Test.isRunningTest())
    	{
    		update compRec;
    	}
    	return DismissPage();
    }
}