////////////////////////////////////////////////////////////////////////////////
// directly instantiable class To calculate sales tax for Service Quote
// custom versions should derive from this class and may override:
// FetchTaxData -> returns GetTaxRequest
// UpdateTaxData -> Updates the ServiceQuote
// ShouldCalculateTax -> Returns null to indicate should calc tax, or message
//                       explaining why not.
// FetchDestinationAddress -> Called by FetchTaxData -> returns the Dest Address
// FetchOriginAddress -> Called by FetchTaxData -> returns the Origin Address
// Initialize -> called by ctors and does initial query of Service Quote data
//
// no mandatory overrides - an empty derived class would be the same as this
////////////////////////////////////////////////////////////////////////////////

global with sharing virtual class AVA_GetTaxQuote
extends AVA_GetTaxBase 
{
    global List<SVMXC__Quote__c> SQList = null;
    global List<SVMXC__Quote_Line__c> SQDetailList = null;
    global List<Account> listOfAccount = null;
    List<Product2> lineProd = null;
    Map<ID, Product2> ProductListMap = null;
    SET<Id> ProductIds = new SET<Id>();
    
    global AVA_GetTaxQuote(ApexPages.StandardController controller)
    {
        Initialize();
    }
    
    // this constructor is used by triggers and batch calls
    global AVA_GetTaxQuote(Id currentServiceQuotes)
    {
        
        apCurPage = currentServiceQuotes;
        Initialize();   
    }
    
    global AVA_GetTaxQuote()
    {
        
    }
    
    
    
    
    
    //Taking argument of entity use code which is entered in Account page and find the same Entity Use code using query
    //Using query we get Name nad Description from object
    static public Entity_Use_Code__c FetchEntityUseCode(string Exempt_Entity)
    {
        if(null != Exempt_Entity)
        {
            List<Entity_Use_Code__c> loEntityUse = [select Id,Name, Description__c from Entity_Use_Code__c where Id =: Exempt_Entity];
            if(loEntityUse.size() > 0)
                return loEntityUse[0];
        }
        return new Entity_Use_Code__c(Name='',Description__c='');
    }
    
    global virtual void Initialize()
    {
        //Fecthing current page opportunity Data or invoice data
        SQList = [select Id,Name,
                  SVMXC__Contact__c,SVMXC__Company__c,AvaTax_Entity_Use_Code__c,AVA_SMAX__ServiceLocation__c
                  from SVMXC__Quote__c where id =:apCurPage];
        SQDetailList = [select Name, SVMXC__Product__c,Non_Taxable__c , SVMXC__Quantity2__c,SVMXC__Line_Price2__c,SVMXC__Line_Description__c
                        from SVMXC__Quote_Line__c where SVMXC__Quote__c =: SQList[0].Id];
        
        for(Integer i =0;i<SQDetailList.size();i++)
        {
            ProductIds.add(SQDetailList[i].SVMXC__Product__c);
        } 
        
        ProductListMap =new Map<ID, Product2>([select Id, Name, ProductCode,Tax_Code__c, Description from Product2 where ID IN: ProductIds]); 
    }
    
    // 'pre qualification to calc tax' - returns null if tax calc should proceed, or an error message string
    // explaining why tax cannot be calculated.
    global override virtual string ShouldCalcTax()
    {
        
        // if config page tax calculation is not enable, throw error
        if(avaConfig[0].Enable_AvaTax_Tax_Calculation__c == false)
        {
            return 'Tax Calculations are Disabled - Check \'Enable Tax Calculations\' in the TaxServices tab';
        }
        //if config page's service url is not set or null, throw error
        if(avaConfig[0].Service_URL__c == null)
        {
            return 'Please enter service url';
        }
        
        //if opportunity line item is not enterd, throw error
        if(SQDetailList.size() == 0)
        {
            return 'No Line Items Found In This Opportunity - Cannot Calculate Tax';
        }
        
        return null;
    }
    
    global override virtual AVA_TaxSvc.GetTaxRequest FetchTaxData(boolean commitFlag)
    {
        // Create GetTax Request object and set the value in it using getTaxRequest object name
        AVA_TaxSvc.GetTaxRequest getTaxRequest = new AVA_TaxSvc.GetTaxRequest();
        listOfAccount = [select ID, AccountNumber, ShippingStreet, ShippingCity, ShippingState, ShippingPostalCode, ShippingCountry,ExemptEntityType__c,Exemption_Number__c,
                         BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry, Name from Account where Id=:SQList[0].SVMXC__Company__c];
        List<Entity_Use_Code__c> EntityUseList = [select Name,Description__c from Entity_Use_Code__c where ID =: SQList[0].AvaTax_Entity_Use_Code__c];
        List<Entity_Use_Code__c> EntityUseListAccount = [select Name,Description__c from Entity_Use_Code__c where ID =: listOfAccount[0].ExemptEntityType__c];
        string EntityUseCode = null;
        // string EntityUseCode = EntityUseList.size() > 0 ? EntityUseList[0].Name.trim() : EntityUseListAccount[0].Name.trim();
        if(EntityUseList.size() > 0)
        {
            EntityUseCode = EntityUseList[0].Name.trim();
        }
        
        else if(EntityUseListAccount.size() > 0)
        {
            EntityUseCode = EntityUseListAccount[0].Name.trim();
        }
        else
        {
            EntityUseCode ='';
        }
        //Fetch Entity Use code from custom object. Calling static fucntion with passing entered entity use code in Account
        Entity_Use_Code__c entityuserec = AVA_GetTaxQuote.FetchEntityUseCode(listOfAccount[0].ExemptEntityType__c);
        system.debug('commit flag:'+commitFlag);
        getTaxRequest.Commit_x=commitFlag;
        getTaxRequest.DetailLevel = 'Tax';
        getTaxRequest.DocType = 'SalesOrder';
        getTaxRequest.CompanyCode = avaConfig[0].Company_code__c;
        
        
        getTaxRequest.DocDate = Date.Today();  // need to discuss with Wyatt;
        
        getTaxRequest.DocCode = SQList[0].Name.trim();
        if(avaConfig[0].Customer_Code_Field__c == 'Account Number')
        {
            getTaxRequest.CustomerCode = listOfAccount[0].Id;
        }
        else
        {
            if(listOfAccount[0].Name.Length()>=50)
            {
                getTaxRequest.CustomerCode = listOfAccount[0].Name.substring(0,50);
            }
            else
            {
                getTaxRequest.CustomerCode = listOfAccount[0].Name;
            }
        }
        
        if(listOfAccount[0].Exemption_Number__c != Null)
        {
            getTaxRequest.ExemptionNo= listOfAccount[0].Exemption_Number__c;
        }
        
        getTaxRequest.CustomerUsageType = EntityUseCode;
        getTaxRequest.Addresses = new AVA_TaxSvc.ArrayOfBaseAddress();
        getTaxRequest.Addresses.BaseAddress = new AVA_TaxSvc.BaseAddress[1000];
        
        getTaxRequest.Addresses.BaseAddress[0] = FetchOriginAddress();
        
        
        getTaxRequest.OriginCode = getTaxRequest.Addresses.BaseAddress[0].AddressCode;
        
        if (SQList[0].AVA_SMAX__ServiceLocation__c != null)
        {
            getTaxRequest.Addresses.BaseAddress[1] = FetchServiceLocation(SQList[0].AVA_SMAX__ServiceLocation__c);
            
        }
        else
        {
            getTaxRequest.Addresses.BaseAddress[1] = FetchDestinationAddress();
            
        }
        
        getTaxRequest.DestinationCode = getTaxRequest.Addresses.BaseAddress[1].AddressCode;
        
        getTaxRequest.Lines = new AVA_TaxSvc.ArrayOfLine();
        integer numLines = SQDetailList.size();
        
        
        getTaxRequest.Lines.Line = new AVA_TaxSvc.Line[numLines];
        
        for(Integer qli = 0; qli < SQDetailList.size(); qli++)
        {
            
            getTaxRequest.Lines.Line[qli] = new AVA_TaxSvc.Line();
            
            getTaxRequest.Lines.Line[qli].No = qli.format();
            if(ProductListMap.get(SQDetailList[qli].SVMXC__Product__c) !=null)
            {
                getTaxRequest.Lines.Line[qli].Description = ProductListMap.get(SQDetailList[qli].SVMXC__Product__c).Description;
                if( ProductListMap.get(SQDetailList[qli].SVMXC__Product__c).ProductCode!=null){
                    getTaxRequest.Lines.Line[qli].ItemCode = ProductListMap.get(SQDetailList[qli].SVMXC__Product__c).ProductCode.trim();
                }
                else
                {
                    getTaxRequest.Lines.Line[qli].ItemCode = ProductListMap.get(SQDetailList[qli].SVMXC__Product__c).Name;
                    
                }
                
            }
            
            
            if(SQDetailList[qli].SVMXC__Line_Description__c == null)
            {
                
            }
            else
            {
                
                if(ProductListMap.get(SQDetailList[qli].SVMXC__Product__c) !=null)
                {
                    getTaxRequest.Lines.Line[qli].Description = ProductListMap.get(SQDetailList[qli].SVMXC__Product__c).Description;
                    if( ProductListMap.get(SQDetailList[qli].SVMXC__Product__c).ProductCode!=null){
                        getTaxRequest.Lines.Line[qli].ItemCode = ProductListMap.get(SQDetailList[qli].SVMXC__Product__c).ProductCode.trim();
                    }
                    else
                    {
                        getTaxRequest.Lines.Line[qli].ItemCode = ProductListMap.get(SQDetailList[qli].SVMXC__Product__c).Name;
                        
                    }
                }
            }
            getTaxRequest.Lines.Line[qli].Qty = SQDetailList[qli].SVMXC__Quantity2__c > 0.0 ? SQDetailList[qli].SVMXC__Quantity2__c : 1.0;
            getTaxRequest.Lines.Line[qli].Amount =  SQDetailList[qli].SVMXC__Line_Price2__c;
            
            if(SQDetailList[qli].Non_Taxable__c == true)
            {
                getTaxRequest.Lines.Line[qli].TaxCode  = 'NT';
            }
            else if(SQDetailList[qli].SVMXC__Product__c == null)
            {
                getTaxRequest.Lines.Line[qli].TaxCode = '';
            }
            else
            {
                getTaxRequest.Lines.Line[qli].TaxCode = ProductListMap.get(SQDetailList[qli].SVMXC__Product__c).Tax_Code__c;
            }
        }
        
        return getTaxRequest;
    }
    global override virtual void UpdateTaxData(AVA_TaxSvc.GetTaxResult getTaxResult, boolean FinalizeFlag)
    {
        if(getTaxResult.ResultCode == 'Success')
        {
            
            for(Integer tl = 0; tl < SQDetailList.size(); tl++)
                
            {
                Decimal Rate = 0;
                String Details = '';
                SQDetailList[tl].Sales_Tax_Amount__c= getTaxResult.TaxLines.TaxLine[tl].Tax;
                for(Integer td = 0; td < getTaxResult.TaxLines.TaxLine[tl].TaxDetails.TaxDetail.size(); td++)
                {
                    Rate += getTaxResult.TaxLines.TaxLine[tl].TaxDetails.TaxDetail[td].Rate;
                    Details += (getTaxResult.TaxLines.TaxLine[tl].TaxDetails.TaxDetail[td].Rate * 100).stripTrailingZeros().format()+' % ' +
                        ' ' + getTaxResult.TaxLines.TaxLine[tl].TaxDetails.TaxDetail[td].JurisType + 
                        ' ' + getTaxResult.TaxLines.TaxLine[tl].TaxDetails.TaxDetail[td].TaxType + ' Tax (' +
                        getTaxResult.TaxLines.TaxLine[tl].TaxDetails.TaxDetail[td].JurisName + ')\r\n\r\n';
                    system.debug('Rate:'+Rate);
                }
                SQDetailList[tl].Sales_Tax_Rate__c= (Rate * 100).stripTrailingZeros().format() + '%';
                SQDetailList[tl].Sales_Tax_Details__c= Details;
            }
            
            AVA_Utilities.LatchedUpdate(SQDetailList);
        } 
        AVA_Utilities.LatchedUpdate(SQList[0]);
    }
    
    
    global virtual AVA_TaxSvc.BaseAddress FetchDestinationAddress()
    {     
        AVA_TaxSvc.BaseAddress DestinationAddress = new AVA_TaxSvc.BaseAddress();
        DestinationAddress.AddressCode = 'D';
        // for destination use service location by default.  If blank, use Account shipping Address
        // maybe later use Account Billing address as third fallback
        
        if(null != listOfAccount[0].ShippingStreet)
        {
            List<String> Lines = listOfAccount[0].ShippingStreet.split('\r\n');
            
            DestinationAddress.Line1 = Lines[0].trim();
            if(Lines.size() > 1)
            {
                DestinationAddress.Line2 = Lines[1].trim();
            }
            if(Lines.size() > 2)
            {
                DestinationAddress.Line3 = Lines[2].trim();
            }
        }
        DestinationAddress.City = listOfAccount[0].ShippingCity;
        DestinationAddress.Region = listOfAccount[0].ShippingState;
        DestinationAddress.PostalCode = listOfAccount[0].ShippingPostalCode;
        DestinationAddress.Country = listOfAccount[0].ShippingCountry;
        
        
        return DestinationAddress; 
    }
    
    global virtual AVA_TaxSvc.BaseAddress FetchOriginAddress()
    {
        AVA_TaxSvc.BaseAddress OriginAddress = new AVA_TaxSvc.BaseAddress();
        OriginAddress.AddressCode = 'O';
        // parse multi-line street
        if(null != avaConfig[0].Origin_Street__c)
        {
            List<String> Lines = avaConfig[0].Origin_Street__c.split('\r\n');
            
            OriginAddress.Line1 = Lines[0].trim();
            if(Lines.size() > 1)
            {
                OriginAddress.Line2 = Lines[1].trim();
            }
            if(Lines.size() > 2)
            {
                OriginAddress.Line3 = Lines[2].trim();
            }
        }
        OriginAddress.City = avaConfig[0].Origin_City__c;
        OriginAddress.Region = avaConfig[0].Origin_State__c;
        OriginAddress.PostalCode = avaConfig[0].Origin_Postal_Code__c;
        OriginAddress.Country = avaConfig[0].Country__c;
        return OriginAddress;
    }
    
    public virtual AVA_TaxSvc.BaseAddress FetchServiceLocation(Id serviceLocationName)
    {
        AVA_TaxSvc.BaseAddress ServiceLocation = new AVA_TaxSvc.BaseAddress();
        List<SVMXC__Site__c> LineServiceLocation = new List<SVMXC__Site__c>();
        
        LineServiceLocation = [select Name,SVMXC__State__c,SVMXC__Street__c,SVMXC__Zip__c,SVMXC__City__c,SVMXC__Country__c from SVMXC__Site__c where Id =: serviceLocationName];
        
        ServiceLocation.AddressCode = 'D';
        
        ServiceLocation.Line1= LineServiceLocation[0].SVMXC__Street__c;
        ServiceLocation.City = LineServiceLocation[0].SVMXC__City__c;
        ServiceLocation.Region = LineServiceLocation[0].SVMXC__State__c;
        ServiceLocation.PostalCode = LineServiceLocation[0].SVMXC__Zip__c;
        ServiceLocation.Country = LineServiceLocation[0].SVMXC__Country__c ;
        
        return ServiceLocation ;
    }
}