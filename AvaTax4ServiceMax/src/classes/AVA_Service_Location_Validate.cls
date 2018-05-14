global with sharing class AVA_Service_Location_Validate
extends AVA_WorkOrder_AddrValidation
{
  private ID m_LocRec = null;
  public List<SVMXC__Service_Order__c> listOfWorkOrder; // For store account address
    public Id apCurPage {get; set;}  // current page id
   
    public AVA_Service_Location_Validate(ApexPages.StandardController controller)
    {
        //Fetch current page id
        apCurPage = ApexPages.currentPage().getParameters().get('id');
    }
     // using this cunstruction for storing id for auto refresh page and we fetch id and storing it
    public AVA_Service_Location_Validate(Id currrentWorkOrder)
    {
        apCurPage = currrentWorkOrder;
    }
    public AVA_Service_Location_Validate()
    {
    
    }
    public AVA_Service_Location_Validate(SVMXC__Service_Order__c testWorkOrder)
    {
        listOfWorkOrder = new List<SVMXC__Service_Order__c>();
        listOfWorkOrder.Add(testWorkOrder);
        apCurPage = null;
    }
    global virtual override void FetchOriginalAddress()
    {
        listOfWorkOrder= [select Name, ID, SVMXC__Street__c, SVMXC__City__c, 
            SVMXC__State__c, SVMXC__Zip__c, SVMXC__Country__c
            from SVMXC__Service_Order__c where ID =:apCurPage];
       
         // parse multi-line MailingStreet Entry
        if(null != listOfWorkOrder[0].SVMXC__Street__c)
        {
            List<String> Lines = listOfWorkOrder[0].SVMXC__Street__c.split('\r\n');
            
            Original.Line1 = Lines[0].trim();
            if(Lines.size() > 1)
            {
                Original.Line2 = Lines[1].trim();
            }
            if(Lines.size() > 2)
            {
                Original.Line3 = Lines[2].trim();
            }
        }
        Original.City = listOfWorkOrder[0].SVMXC__City__c;
        Original.Region = listOfWorkOrder[0].SVMXC__State__c;
        Original.PostalCode = listOfWorkOrder[0].SVMXC__Zip__c;
        Original.Country = listOfWorkOrder[0].SVMXC__Country__c;
    }
     //Redirect in original page after update address and also updating data in Last Validate field
    global override PageReference UpdateAddress()
    {
        if(listOfWorkOrder[0] != null)
        {
            Database.DMLOptions dml = new Database.DMLOptions(); 
           
            dml.DuplicateRuleHeader.allowSave = true;
            dml.DuplicateRuleHeader.runAsCurrentUser = true;
             Database.SaveResult sr = Database.update(listOfWorkOrder[0], dml);
           if (sr.isSuccess()) {
                System.debug('Duplicate account has been inserted in Salesforce!');
            }
        }
        return RedirectPage();
    }
    
     //Update Salesforce page using Avalara's validate address
    global override void SetUpdatedAccountAddress(AVA_AddressSvc.ValidAddress validateAddress)
    {
        
        listOfWorkOrder[0].SVMXC__Street__c= validateAddress.Line1;
        String strt = validateAddress.Line2.trim();
        if(strt.length() > 0)
        {
            listOfWorkOrder[0].SVMXC__Street__c += '\r\n' + strt;
        }
        strt = validateAddress.Line3.trim();
        if(strt.length() > 0)
        {
            listOfWorkOrder[0].SVMXC__Street__c += '\r\n' + strt;
        }
        listOfWorkOrder[0].SVMXC__City__c= validateAddress.City;
        listOfWorkOrder[0].SVMXC__Zip__c= validateAddress.PostalCode;
        listOfWorkOrder[0].SVMXC__State__c = validateAddress.Region;
        listOfWorkOrder[0].SVMXC__Country__c = validateAddress.Country;
    }
    
}