public with sharing virtual class AvaMessageBox 
{
    public AvaMessage__c m_oUserMessage {get; set;}
    protected List<AvaMessage__c> m_msgList = null;

    private class SVMAXException extends Exception
    {
    
    }
    
    public AvaMessageBox()
    {
    	m_msgList = [select Name, MsgBoxTitle__c, 
    		Message_Col1__c, AVA_SVMXC__City_Col1__c, AVA_SVMXC__Region_Col1__c, AVA_SVMXC__PostalCode_Col1__c, AVA_SVMXC__Country_Col1__c,
     		Message_Addr2__c, AVA_SVMXC__City_Col2__c, AVA_SVMXC__Region_Col2__c, AVA_SVMXC__PostalCode_Col2__c, AVA_SVMXC__Country_Col2__c, 
    		AVA_SVMXC__Latitude_Col1__c,AVA_SVMXC__Longitude_Col1__c,AVA_SVMXC__Latitude_Col2__c,AVA_SVMXC__Longitude_Col2__c,
    		ReturnPageID__c, TimeStamp__c
    		from AvaMessage__c where Name =: UserInfo.getUserID() order by TimeStamp__c DESC];
    	
    	if(m_msgList.size() > 0)
    	{   // should not be possible for their to be more than one, but if there is
    		// take first one - order by timestamp assures this is the latest
    		m_oUserMessage = m_msgList[0];
    	}
    	else
    	{
    		m_oUserMessage = new AvaMessage__c(MsgBoxTitle__c='Internal Error',Name = UserInfo.getUserID(),ID = ApexPages.currentPage().getParameters().get('id'),Message_Col1__c='Error Retrieving Message');
  			//throw new SVMAXException('Error Retrieving Message');
    	}
    }   
    
    public PageReference DismissPage()
    {
        String retPage = '/' + m_oUserMessage.ReturnPageID__c;
        try
        {
        	delete m_msgList; // delete the list so that if there is more than one record for this user, all are deleted
        }
        catch (Exception ex)
        {
        	// ignore - User may have already deleted message from another tab
        	// for example, test connect on Config tab and Validate Company address on another
        	// then attempting to dismiss each one - the first will delete all messages, and the second 
        	// will attempt again - we ignore the exception the second delete causes - it is benign
        }
        // Redirect the user back to the original page         
        PageReference pageRef = new PageReference(retPage);         
    
        pageRef.setRedirect(true);         
        return pageRef;               
    }
   
}