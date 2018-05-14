////////////////////////////////////////////////////////////////////////////////
// Implementation of driver class for Validate ShipTo Handler on Account Page
// action is ValidateAddress.  See AVA_Account_ValidateShippingAddress.page
////////////////////////////////////////////////////////////////////////////////
global with sharing virtual class AVA_Account_ValidateShippingAddress
extends AVA_AddressValidationBase
{
    global List<Account> oAccount; // For store account address
    global Id apCurPage {get; set;}  // current page id
    //if customer enable picklist, handled dynamically
    global String stateFieldName = 'ShippingState';
    global String countryFieldName = 'ShippingCountry';
    
    global AVA_Account_ValidateShippingAddress(ApexPages.StandardController controller) 
    {
        //Fetch current page id
        apCurPage = ApexPages.currentPage().getParameters().get('id');
    }
    // using this cunstruction for storing id for auto refresh page and we fetch id and storing it
    global AVA_Account_ValidateShippingAddress(Id currAcct)
    {
        apCurPage = currAcct;
    }
    global AVA_Account_ValidateShippingAddress()
    {
        
    }
    global AVA_Account_ValidateShippingAddress(Account testAccount)
    {
        oAccount = new List<Account>();
        oAccount.Add(testAccount);
        apCurPage = null;
    }
    //Fetch Original Address lines from Salesforce
    global virtual override void FetchOriginalAddress()
    {
        // Fetching value of picklist if picklist is enable  
        if(PickListsEnabled())
        {
            System.debug('PicklistEnabled' + PickListsEnabled());
            stateFieldName = 'ShippingStateCode';
            countryFieldName = 'ShippingCountryCode';
        }
        //Write query for fetch current page value of Address
        String acctQuery = 'select Account.ShippingStreet, Account.ShippingCity, Account.ShippingPostalCode,' +
            stateFieldName + ',' + countryFieldName + ' from Account where Id =:apCurPage';
        
        oAccount = Database.query(acctQuery);
        
        // parse multi-line MailingStreet Entry
        if(null != oAccount[0].ShippingStreet)
        {
            List<String> Lines = oAccount[0].ShippingStreet.split('\r\n');
            
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
        Original.City = oAccount[0].ShippingCity;
        Original.Region = (String)oAccount[0].get(stateFieldName);
        Original.PostalCode = oAccount[0].ShippingPostalCode;
        Original.Country = (String)oAccount[0].get(countryFieldName);
        
    }
    //Redirect in original page after update address and also updating data in Last Validate field
    global override PageReference UpdateAddress()
    {
        if(oAccount[0] != null)
        {
            
            Database.DMLOptions dml = new Database.DMLOptions(); 
            System.debug('Duplicate account has been inserted in Salesforce!');
            
            dml.DuplicateRuleHeader.allowSave = true;
            dml.DuplicateRuleHeader.runAsCurrentUser = true;
            
            Database.SaveResult sr = Database.update(oAccount[0], dml);
            
            
        }
        return RedirectPage();
    }
    //Update Salesforce page using Avalara's validate address
    global override void SetUpdatedAccountAddress(AVA_AddressSvc.ValidAddress ovaValAddr)
    {
        
        oAccount[0].ShippingStreet = ovaValAddr.Line1;
        
        String strt = ovaValAddr.Line2.trim();
        if(strt.length() > 0)
        {
            oAccount[0].ShippingStreet += '\r\n' + strt;
        }
        strt = ovaValAddr.Line3.trim();
        if(strt.length() > 0)
        {
            oAccount[0].ShippingStreet += '\r\n' + strt;
        }
        oAccount[0].ShippingCity = ovaValAddr.City;
        oAccount[0].ShippingPostalCode = ovaValAddr.PostalCode;
        oAccount[0].put(stateFieldName,ovaValAddr.Region);
        oAccount[0].put(countryFieldName,ovaValAddr.Country);
    }
    private boolean PickListsEnabled()
    {
        // if Account Mailing Address is enabled, assume all addresses are enabled
        
        Map<String, Schema.SObjectField> M = Schema.SObjectType.Account.fields.getMap();
        
        return M.containsKey('ShippingStateCode');
    }
}