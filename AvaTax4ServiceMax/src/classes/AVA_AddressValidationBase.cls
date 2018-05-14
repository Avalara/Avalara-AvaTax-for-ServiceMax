////////////////////////////////////////////////////////////////////////////////
// Cosmic Base Class for all Address Validation calls
//    abstract class not to be directly instantiated
// Layer #2 will introduce the standard Controller type, (Account, Opportunity, Quote) 
//    so can be called from button handler vf page
// Layer #3 will be the instantiable class which includes 
//    the sql string to query/update the address
////////////////////////////////////////////////////////////////////////////////
global with sharing abstract class AVA_AddressValidationBase
{
    
    global AVA_PageAddress Original {get; set;}
    global AVA_PageAddress Validated {get; set;}
    global Id apCurPage {get; set;}
    global List<Avalara__c> avaConfig;
    
    List<string> MsgLines = new List<string>{'Please Enter UserName ',
        'Username is blank.',
        'You must enter username. It is blank'};
            
            
            //Constructor for fetching current page id and also fetching current active user's configuration data from utilites class
            global AVA_AddressValidationBase() 
        {
            apCurPage = null;
            if(ApexPages.currentPage() != null) // test or trigger
            {
                apCurPage = ApexPages.currentPage().getParameters().get('id');
            }
            this.Original = new AVA_PageAddress();
            this.Validated = new AVA_PageAddress();
            this.avaConfig= AVA_Utilities.FetchActiveSettings();
        }
    //abstract define because we want to call in another class and for that we declair it as abstract.
    global abstract PageReference UpdateAddress();
    global abstract void SetUpdatedAccountAddress(AVA_AddressSvc.ValidAddress v);
    global abstract void FetchOriginalAddress();
    
    //set the gettax request using the salesforce current page id.
    public boolean MakeAddressRequest(boolean TestFlag, String TestResultCode)
    {
        try
        {
            AVA_AddressSvc.ValidateRequest vreq = new AVA_AddressSvc.ValidateRequest();
            vreq.Coordinates = false;
            vreq.Taxability=false;
            if(avaConfig[0].Return_address_in_upper_case__c != true)
            {
                vreq.TextCase='Mixed';
            }
            else
            {
                vreq.TextCase='Upper';
            }
            
            AVA_AddressSvc.ValidateResult vres = null;
            vreq.Address = this.Original.PageAddressToBaseAddress();
            
            AVA_AddressSvc.AddressSvcSoap addressSvc = new AVA_AddressSvc.AddressSvcSoap(avaConfig[0].Service_URL__c);
            addressSvc.Security.UsernameToken.Username = avaConfig[0].Account_ID__c;
            addressSvc.Security.UsernameToken.Password = avaConfig[0].License_Key__c;
            addressSvc.Profile.Client = 'AvaTax4ServiceMax,1.0';
            addressSvc.timeout_x = 30000;   // 30 seconds for timeout
            
            if(TestFlag == false)
            {
                vres=addressSvc.Validate(vreq);
            }
            else
            {
                vres = new AVA_AddressSvc.ValidateResult();
                vres.ResultCode = TestResultCode;
                vres.ValidAddresses = new AVA_AddressSvc.ArrayOfValidAddress();
                vres.ValidAddresses.ValidAddress = new AVA_AddressSvc.ValidAddress[1];
                vres.ValidAddresses.ValidAddress[0] = new AVA_AddressSvc.ValidAddress();                
                vres.Messages = new AVA_AddressSvc.ArrayOfMessage();
                vres.Messages.Message = new AVA_AddressSvc.Message[1];
                vres.Messages.Message[0] = new AVA_AddressSvc.Message();
                vres.Messages.Message[0].Name = 'foo';
                vres.Messages.Message[0].Summary = 'foo';
                vres.Messages.Message[0].Details = 'foo';
                
            }
            if(vres.ResultCode == 'Success')
            {
                SetUpdatedAccountAddress(vres.ValidAddresses.ValidAddress[0]);
                this.Validated.Line1 = vres.ValidAddresses.ValidAddress[0].Line1;
                String strt;
                if(vres.ValidAddresses.ValidAddress[0].Line2 != null)
                {
                    strt = vres.ValidAddresses.ValidAddress[0].Line2.trim();
                    if(strt.length() > 0)
                    {
                        this.Validated.Line2 = strt;
                    }
                }
                if(vres.ValidAddresses.ValidAddress[0].Line3 != null)
                {
                    strt = vres.ValidAddresses.ValidAddress[0].Line3.trim();
                    if(strt.length() > 0)
                    {
                        this.Validated.Line3 = strt;
                    }
                }
                this.Validated.City = vres.ValidAddresses.ValidAddress[0].City;
                this.Validated.Region = vres.ValidAddresses.ValidAddress[0].Region;
                this.Validated.PostalCode = vres.ValidAddresses.ValidAddress[0].PostalCode;
                this.Validated.Country = vres.ValidAddresses.ValidAddress[0].Country;
                return true;
            }
            else
            {
                
                this.Validated = new AVA_PageAddress();
                this.Validated.Line1 = 'Address Validation Result';
                this.Validated.Line2 = 'Address Validation Returned: ' + vres.ResultCode; 
                this.Validated.Line3 = 'Name: ' + vres.Messages.Message[0].Name;
                this.Original.Line1 = 'Summary: ' + vres.Messages.Message[0].Summary;
                this.Original.Line2 = 'Details: ' + vres.Messages.Message[0].Details;
                this.Original.Line3 = '';
                return false;
            }
        }
        catch(Exception ex)
        {
            // for false return Line1 = MessageBox Title,
            // Line2, Line3, City, Region, PostalCode = Line 1 - Line 5 of message
            this.Validated = new AVA_PageAddress();
            this.Validated.Line1 = 'Address Validation Excepted';
            this.Validated.Line2 = '';
            this.Validated.Line3 = ex.getMessage();
            this.Original.Line1 = '';
            this.Original.Line2 = '';
            this.Original.Line3 = '';
            return false;
        }
    }
    
    // must be virtual, as this is added to existing managed package, 
    // not really meant to be overriden
    global virtual PageReference RedirectPage()
    {
        // Redirect the user back to the original page         
        PageReference pageRef = new PageReference('/' + apCurPage);         
        
        pageRef.setRedirect(true);         
        return pageRef;               
    }
    
    // must be virtual, as this is added to existing managed package, 
    // not really meant to be overriden
    global virtual PageReference ValidateAddress()
    {
        return ValidateAddress(false,'',false,false);   // other flags are for unittests...
    }
    
    public PageReference ValidateAddress(boolean TestFlag, String TestResult, 
                                         boolean TestValidateEnabled, boolean configFailFlag)
    {
        try
        {
            if(null == apCurPage && TestFlag == false)
            {
                return null; 
            } 
            
            if(TestFlag == true)
            {
                avaConfig = new List<Avalara__c>();
                Avalara__c tmp = new Avalara__c();
                avaConfig.add(tmp);
                if(configFailFlag == true)
                {
                    avaConfig.add(new Avalara__c());
                }
            }
            
            if(avaConfig.size() != 1)
            {
                List<string> MsgLines = new List<string>{'Expected 1 and only 1 Active Settings Record, but Found ' + avaConfig.size(),
                    ' Active Settings Record(s)','Check The AvalaraTab and be sure there is 1 and only 1',
                    'Avalara record with \'Active Avalara Setting\' checked'};
                        return AVA_Utilities.ShowMessageBox('Error Fetching Avalara Settings', MsgLines, apCurPage);
            }
            
            if(avaConfig[0].Enable_AvaTax_address_validation__c == false)
            {
                List<string> MsgLines = new List<string>{'To Re-Enable Address Validation, Edit Avalara Configuration Record \'' + avaConfig[0].Name + '\'',
                    'And Check \'Enable Address Validation\''};
                        return AVA_Utilities.ShowMessageBox('Address Validation is Disabled For Currently Active Avalara Configuration(\'' + avaConfig[0].Name + '\')', 
                                                            MsgLines, apCurPage);
            }
            FetchOriginalAddress();
            // see base class for MakeAddressRequest
            if(MakeAddressRequest(TestFlag, TestResult))
            {
                if(avaConfig[0].Verify_Validated_Addresses__c)
                {
                    return null;
                }
                return UpdateAddress();
            }
            else
            {
                // for false return oaValidated.Line1 = MessageBox Title,
                // Line2, Line3, = Line 1 - Line 2 and oaOriginal.Line1 - Line3 = Line 3 - Line 5 of message
                List<string> MsgLines = new List<string>{this.Validated.Line2, this.Validated.Line3,
                    this.Original.Line1, this.Original.Line2, this.Original.Line3};
                        return AVA_Utilities.ShowMessageBox(this.Validated.Line2, MsgLines, apCurPage);
            }
        }
        catch( Exception ex ) 
        {
            return AVA_Utilities.ShowMessageBox('Validate Address Encountered An Exception', ex.getMessage(), apCurPage);
        }
    }
}