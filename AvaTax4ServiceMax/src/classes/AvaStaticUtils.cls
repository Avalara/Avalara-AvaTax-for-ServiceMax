public with sharing class AvaStaticUtils 
{
	 public class AvaException extends Exception {}
	 
     static public PageReference ShowMessageBox(string MsgBoxTitle, string MsgContent, PageReference RetPage)
     {
     	ID UserID = UserInfo.getUserId();
        AvaMessage__c oMsgBoxMessage = new AvaMessage__c();           
        oMsgBoxMessage.MsgBoxTitle__c = MsgBoxTitle.substring(0, Math.min(128,MsgBoxTitle.length()));
        oMsgBoxMessage.Message_Col1__c = MsgContent.substring(0, Math.min(255,MsgContent.length()));
        oMsgBoxMessage.ReturnPageID__c = RetPage.getParameters().get('id');
        oMsgBoxMessage.Name = UserID;
        insert oMsgBoxMessage;

        PageReference pageRef = Page.AvaMessageBoxPage;         
        pageRef.setRedirect(false);         
        return pageRef;                     
     }
     
	 static public PageReference ShowAddresses(string Title,AVA_SVMXC.AddressSvc.BaseAddress Original, 
     	AVA_SVMXC.AddressSvc.ValidAddress Validated, PageReference RetPage, PageReference DispPage)
     {
     	ID UserID = UserInfo.getUserId();
        AvaMessage__c oMsgBoxMessage = new AvaMessage__c();           
        oMsgBoxMessage.MsgBoxTitle__c = Title;
        
        oMsgBoxMessage.Message_Col1__c = (Original.Line1 + '\r\n' + Original.Line2.trim() + '\r\n' + Original.Line3).trim() + '\r\n';
        oMsgBoxMessage.City_Col1__c = Original.City.trim();
        oMsgBoxMessage.Region_Col1__c = Original.Region.trim();
        oMsgBoxMessage.PostalCode_Col1__c = Original.PostalCode.trim();
        oMsgBoxMessage.Country_Col1__c = Original.Country.trim();
        oMsgBoxMessage.Latitude_Col1__c = Original.Latitude != null ? Decimal.valueOf(Original.Latitude) : 0.0;
        oMsgBoxMessage.Longitude_Col1__c = Original.Longitude != null ? Decimal.valueOf(Original.Longitude) : 0.0;

        oMsgBoxMessage.Message_Addr2__c = (Validated.Line1 + '\r\n' + Validated.Line2.trim() + '\r\n' + Validated.Line3).trim();
        oMsgBoxMessage.City_Col2__c = Validated.City.trim();
        oMsgBoxMessage.Region_Col2__c = Validated.Region.trim();
        oMsgBoxMessage.PostalCode_Col2__c = Validated.PostalCode.trim();
        oMsgBoxMessage.Country_Col2__c = Validated.Country.trim();
        oMsgBoxMessage.Latitude_Col2__c = Validated.Latitude != null ? Decimal.valueOf(Validated.Latitude) : 0.0;
        oMsgBoxMessage.Longitude_Col2__c = Validated.Longitude != null ? Decimal.valueOf(Validated.Longitude) : 0.0;
        
        oMsgBoxMessage.ReturnPageID__c = RetPage.getParameters().get('id');
        oMsgBoxMessage.Name = UserID;
        insert oMsgBoxMessage;
        
        DispPage.setRedirect(false);
        return DispPage;
     }
    
     // Fetches the active credential object
     static public AVA_SVMXC__AvaTaxConfiguration__c FetchActiveCredentials()
     {
        List<AvaTaxConfiguration__c> credList = [select AVA_SVMXC__Account_Number__c, AVA_SVMXC__Avalara_Service_URL__c,
            AVA_SVMXC__License_Key__c, AVA_SVMXC__Default_Company__c from AVA_SVMXC__AvaTaxConfiguration__c where AVA_SVMXC__Current_Setting__c =: true];
        
        if(credList.size() > 0)
        {
            return credList[0];
        }
        else
        {
            return null;
        }
     }

     // Fetches the credential object on the current page
     static public AVA_SVMXC__AvaTaxConfiguration__c FetchCurrentCredentials()
     {
        List<AvaTaxConfiguration__c> credList = [select AVA_SVMXC__Account_Number__c, AVA_SVMXC__Avalara_Service_URL__c,
            AVA_SVMXC__License_Key__c, AVA_SVMXC__Default_Company__c from AVA_SVMXC__AvaTaxConfiguration__c where id =: ApexPages.currentPage().getParameters().get('id')];
        
        if(credList.size() > 0)
        {
            return credList[0];
        }
        else
        {
            return null;
        }
     }
     
     // Displays Exception info - centralized for consistency
     static public PageReference ShowException(Exception ex, PageReference apCurPage)
     {
     	return AvaStaticUtils.ShowMessageBox('Validate Threw an Exception of Type ' + ex.getTypeName(), 
			ex.getMessage() + '\r\n\r\nStackTrace:\r\n' + ex.getStackTraceString(), apCurPage);    	
     }
     
     // parse a free form street address into a list of exactly 3 strings, each representing
     // line1, line2, line3.  Useful for instantiating an avalara BaseAddress structure from SF.
     static public List<string> parseStreetAddress(string StreetAddress)
     {
     	List<string> rVal = new List<string>();
     	if(StreetAddress == null)
     		StreetAddress = '';
        	
       	List<String> Lines = StreetAddress.trim().split('\r\n');
        
        rVal.add(Lines[0]);
        rVal.add(Lines.size() > 1 ? Lines[1] : '');
        string lastLine = lines.size() > 2 ? Lines[2] : '';
     	for(Integer i = 3; i < Lines.size(); i++)
     	{
     		lastLine += ' ' + Lines[i];
     	}
     	rVal.add(lastLine.trim());
     	
     	return rVal;
     }
    
}