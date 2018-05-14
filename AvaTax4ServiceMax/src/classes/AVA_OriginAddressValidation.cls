////////////////////////////////////////////////////////////////////////////////
// Implementation of driver class for Validate Origin Address button handler
// on AvalaraConfig page.  See AVA_OriginAddressValidation.page
// for this one, we point directly to ValidationBase, no middle class
// needed, since Avalara__c object is part of data for base anyway
////////////////////////////////////////////////////////////////////////////////
global with sharing class AVA_OriginAddressValidation
extends AVA_AddressValidationBase
{
    //Constructor for use in automation tax calc
    public AVA_OriginAddressValidation(ApexPages.StandardController controller) 
    {
        avaConfig = AVA_Utilities.FetchCurrentSettings(apCurPage);
    }
    //Constructor for use current page it and fetch current user's config page data
    public AVA_OriginAddressValidation(Id currentPage)
    {
        apCurPage = currentPage;
        avaConfig = AVA_Utilities.FetchCurrentSettings(currentPage);
    }
    // Fech Origin address data from current active setting
    global override void FetchOriginalAddress()
    {
        // parse multi-line OriginStreet__c Entry
        if(null != avaConfig[0].Origin_Street__c)
        {
            List<String> Lines = avaConfig[0].Origin_Street__c.split('\r\n');
        
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
       
        Original.City = avaConfig[0].Origin_City__c;
        Original.Region = avaConfig[0].Origin_State__c;
        Original.PostalCode = avaConfig[0].Origin_Postal_Code__c;
        Original.Country = avaConfig[0].Country__c;
    }
    
    //Update origin address in latchupdate and update data of SF data
    global override PageReference UpdateAddress()
    {
        if(avaConfig.size() > 0)    // 0 means we are testing
        {
            update avaConfig[0];
        //    avaConfig[0].Last_Validated__c = datetime.now().format();
         //   Utilities.LatchedUpdate(avaConfig[0]);
        }
        return RedirectPage();
    }
   //fetch validate address from avalara api and update those in sf 
    global override void SetUpdatedAccountAddress(AVA_AddressSvc.ValidAddress addressValidationResult)
    {
        avaConfig[0].Origin_Street__c = addressValidationResult.Line1;
        String strt;
        if(addressValidationResult.Line2 != null)
        {
            strt = addressValidationResult.Line2.trim();
            if(strt.length() > 0)
            {
                avaConfig[0].Origin_Street__c += '\r\n' + strt;
            }
        }
        if(addressValidationResult.Line3 != null)
        {
            strt = addressValidationResult.Line3.trim();
            if(strt.length() > 0)
            {
                avaConfig[0].Origin_Street__c += '\r\n' + strt;
            }
        }
        avaConfig[0].Origin_County__c = addressValidationResult.County;
        avaConfig[0].Origin_City__c = addressValidationResult.City;
        avaConfig[0].Origin_State__c = addressValidationResult.Region;
        avaConfig[0].Origin_Postal_Code__c = addressValidationResult.PostalCode; 
        avaConfig[0].Country__c = addressValidationResult.Country;       
    }
}