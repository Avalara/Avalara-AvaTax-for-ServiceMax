////////////////////////////////////////////////////////////////////////////////
// directly instantiable class To calculate sales tax for WorkOrder
// custom versions should derive from this class and may override:
// FetchTaxData -> returns GetTaxRequest
// UpdateTaxData -> Updates the Work Order
// ShouldCalculateTax -> Returns null to indicate should calc tax, or message
//                       explaining why not.
// FetchDestinationAddress -> Called by FetchTaxData -> returns the Dest Address
// FetchOriginAddress -> Called by FetchTaxData -> returns the Origin Address
// Initialize -> called by ctors and does initial query of WorkOrder data
//
// no mandatory overrides - an empty derived class would be the same as this
////////////////////////////////////////////////////////////////////////////////
global with sharing virtual class AVA_GetTaxWorkOrder
extends AVA_GetTaxBase {
    
    global List < SVMXC__Service_Order__c > WOList = null;
    global List < SVMXC__Service_Order_Line__c > WOLineList = null;
    global List < SVMXC__Service_Order_Line__c > WODetailList = null;
    global List < Account > listOfAccounts = null;
    Map<ID, Product2> ProductListMap = null;
    SET<Id> ProductIds = new SET<Id>();
    
    global AVA_GetTaxWorkOrder(ApexPages.StandardController controller) {
        Initialize();
    }
    
    // this constructor is used by triggers and batch calls
    global AVA_GetTaxWorkOrder(Id currOpp) {
        
        apCurPage = currOpp;
        Initialize();
    }
    
    global AVA_GetTaxWorkOrder() {
        Initialize();
    }
    //Taking argument of entity use code which is entered in Account page and find the same Entity Use code using query
    //Using query we get Name nad Description from object
    static public Entity_Use_Code__c FetchEntityUseCode(string Exempt_Entity) {
        if (Exempt_Entity != null) {
            List < Entity_Use_Code__c > loEntityUse = [select Id, Name, Description__c from Entity_Use_Code__c where Id = : Exempt_Entity];
            if (loEntityUse.size() > 0)
                return loEntityUse[0];
        }
        return new Entity_Use_Code__c(Name = '', Description__c = '');
    }
    
    global virtual void Initialize() {
        //Fecthing current page Work Order Data or invoice data
        WOList = [select Id, Name,
                  SVMXC__Contact__c, SVMXC__Company__c, AvaTax_Entity_Use_Code__c, SVMXC__Street__c, SVMXC__City__c,
                  SVMXC__State__c, SVMXC__Zip__c, SVMXC__Country__c, Avalara_Status__c, Work_Order_Status__c, (select Name, SVMXC__Product__c, Non_Taxable__c, SVMXC__Actual_Quantity2__c, SVMXC__Work_Description__c, SVMXC__Line_Type__c,
                                                                                                               SVMXC__Total_Line_Price__c, SVMXC__From_Location__c, SVMXC__Requested_Location__c from SVMXC__Service_Order_Line__r) from SVMXC__Service_Order__c where id = : apCurPage
                 ];
        WODetailList = WOList[0].SVMXC__Service_Order_Line__r;
        
        for(Integer i =0;i<WODetailList.size();i++)
        {
            ProductIds.add(WODetailList[i].SVMXC__Product__c);
        } 
        
        ProductListMap =new Map<ID, Product2>([select Id, Name, ProductCode,Tax_Code__c, Description from Product2 where ID IN: ProductIds]); 
        
        
        
        
    }
    
    
    // 'pre qualification to calc tax' - returns null if tax calc should proceed, or an error message string
    // explaining why tax cannot be calculated.
    global override virtual string ShouldCalcTax() {
        // if config page tax calculation is not enable, throw error
        if (avaConfig[0].Enable_AvaTax_Tax_Calculation__c == false) {
            return 'Tax Calculations are Disabled - Check \'Enable Tax Calculations\' in the Avalara tab';
        }
        //if config page's service url is not set or null, throw error
        if (avaConfig[0].Service_URL__c == null) {
            return 'Please enter service url';
        }
        
        
        //if Work Order line item is not enterd, throw error
        if (WODetailList.size() == 0) {
            return 'No Line Items Found In This Work Order- Cannot Calculate Tax';
        }
        
        if (WOList[0].Avalara_Status__c == 'Committed') {
            return 'Cannot Update - Work Order is Finalized, and One or More of the changes might change the tax amount.';
        }
        
        
        return null;
    }
    
    global override virtual AVA_TaxSvc.GetTaxRequest FetchTaxData(boolean commitFlag) {
        // Create GetTax Request object and set the value in it using gtreq object name
        AVA_TaxSvc.GetTaxRequest gtreq = new AVA_TaxSvc.GetTaxRequest();
        listOfAccounts = [select Id, ShippingStreet, ShippingCity, ShippingState, ShippingPostalCode, ShippingCountry, ExemptEntityType__c, Exemption_Number__c,
                          AccountNumber, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry, Name from Account where Id = : WOList[0].SVMXC__Company__c
                         ];
        List < Entity_Use_Code__c > EntityUseList = [select Name, Description__c from Entity_Use_Code__c where ID = : WOList[0].AvaTax_Entity_Use_Code__c];
        List < Entity_Use_Code__c > EntityUseListAccount = [select Name, Description__c from Entity_Use_Code__c where ID = : listOfAccounts[0].ExemptEntityType__c];
        string EntityUseCode = null;
        
        if (EntityUseList.size() > 0) {
            EntityUseCode = EntityUseList[0].Name.trim();
        } else if (EntityUseListAccount.size() > 0) {
            EntityUseCode = EntityUseListAccount[0].Name.trim();
        } else {
            EntityUseCode = '';
        }
        
        
        List < Avalara__c > avaConfig = AVA_Utilities.FetchActiveSettings();
        
        
        
        //Fetch Entity Use code from custom object. Calling static fucntion with passing entered entity use code in Account
        Entity_Use_Code__c entityuserec = AVA_GetTaxWorkOrder.FetchEntityUseCode(listOfAccounts[0].ExemptEntityType__c);
        gtreq.Commit_x = commitFlag;
        gtreq.DetailLevel = 'Tax';
        if (avaConfig.size() != 0) {
            if (avaConfig[0].AVA_SMAX__Disable_Document_Commit__c == false) {
                gtReq.DocType = 'SalesInvoice';
            } else {
                gtReq.DocType = 'SalesOrder';
            }
        }
        gtreq.CompanyCode = avaConfig[0].Company_code__c;
        
        gtreq.DocDate = Date.Today(); // need to discuss with Wyatt;
        
        gtreq.DocCode = WOList[0].Name.trim();
        if (avaConfig[0].Customer_Code_Field__c == 'Account Number') {
            if (listOfAccounts[0].AccountNumber != null) {
                gtreq.CustomerCode = listOfAccounts[0].AccountNumber;
            } else {
                gtreq.CustomerCode = listOfAccounts[0].Id;
                
            }
        } else {
            if (listOfAccounts[0].Name.Length() >= 50) {
                gtreq.CustomerCode = listOfAccounts[0].Name.substring(0, 50);
            } else {
                gtreq.CustomerCode = listOfAccounts[0].Name;
            }
        }
        if (listOfAccounts[0].Exemption_Number__c != Null) {
            gtreq.ExemptionNo = listOfAccounts[0].Exemption_Number__c;
        }
        
        gtreq.CustomerUsageType = EntityUseCode;
        
        gtreq.Addresses = new AVA_TaxSvc.ArrayOfBaseAddress();
        gtreq.Addresses.BaseAddress = new AVA_TaxSvc.BaseAddress[1000];
        
        gtreq.Addresses.BaseAddress[0] = FetchOriginAddress();
        
        AVA_TaxSvc.BaseAddress oDestinationAddress = new AVA_TaxSvc.BaseAddress();
        
        oDestinationAddress = FetchDestinationAddress();
        
        if((oDestinationAddress.City == null && 
            oDestinationAddress.Region == null &&
            oDestinationAddress.PostalCode == null &&
            oDestinationAddress.Country == null && oDestinationAddress.Line1 == null))
        {
            
            gtreq.Addresses.BaseAddress[1] = null;
        }
        
        else
        {
            gtreq.Addresses.BaseAddress[1] = oDestinationAddress ;
            
        }
        gtreq.OriginCode = gtreq.Addresses.BaseAddress[0].AddressCode;
        if(gtreq.Addresses.BaseAddress[1] !=null)
        {
            gtreq.DestinationCode = gtreq.Addresses.BaseAddress[1].AddressCode;
        }
        
        gtreq.Lines = new AVA_TaxSvc.ArrayOfLine();
        integer numLines = WODetailList.size();
        
        
        gtreq.Lines.Line = new AVA_TaxSvc.Line[numLines];
        
        for (Integer qli = 0; qli < WODetailList.size(); qli++) {
            
            gtreq.Lines.Line[qli] = new AVA_TaxSvc.Line();
            
            
            if (WODetailList[qli].SVMXC__From_Location__c != null) {
                
                gtreq.Addresses.BaseAddress[qli +2] =  FetchServiceOriginAddress(WODetailList[qli].SVMXC__From_Location__c);   
                gtreq.Lines.Line[qli].OriginCode = gtreq.Addresses.BaseAddress[qli+2].AddressCode;
                
               
            }
            
            if (WODetailList[qli].SVMXC__Requested_Location__c != null) {
                
                gtreq.Addresses.BaseAddress[qli +3] =  FetchLineShipToServiceLocation(WODetailList[qli].SVMXC__Requested_Location__c );   
                gtreq.Lines.Line[qli].DestinationCode = gtreq.Addresses.BaseAddress[qli+3].AddressCode;
                
                  
            }
            
            
            
            gtreq.Lines.Line[qli].No = qli.format();
            if (WODetailList[qli].Non_Taxable__c == true) {
                gtreq.Lines.Line[qli].TaxCode = 'NT';
            } else if (WODetailList[qli].SVMXC__Product__c == null) {
                gtreq.Lines.Line[qli].TaxCode = '';
            } else if (ProductListMap.get(WODetailList[qli].SVMXC__Product__c).Tax_Code__c == null) {
                gtreq.Lines.Line[qli].TaxCode = '';
            } else {
                gtreq.Lines.Line[qli].TaxCode = ProductListMap.get(WODetailList[qli].SVMXC__Product__c).Tax_Code__c;
            }
            if (WODetailList[qli].SVMXC__Product__c == null) {
                gtreq.Lines.Line[qli].Description = '';
                gtreq.Lines.Line[qli].ItemCode = WODetailList[qli].SVMXC__Line_Type__c;
            } else {
                gtreq.Lines.Line[qli].Description = ProductListMap.get(WODetailList[qli].SVMXC__Product__c).Description;
                
                if (ProductListMap.get(WODetailList[qli].SVMXC__Product__c).ProductCode != null) {
                    gtreq.Lines.Line[qli].ItemCode = ProductListMap.get(WODetailList[qli].SVMXC__Product__c).ProductCode.trim();
                } else {
                    gtreq.Lines.Line[qli].ItemCode = ProductListMap.get(WODetailList[qli].SVMXC__Product__c).name;
                    
                }
            }
            
            gtreq.Lines.Line[qli].Qty = WODetailList[qli].SVMXC__Actual_Quantity2__c > 0.0 ? WODetailList[qli].SVMXC__Actual_Quantity2__c : 1.0;
            gtreq.Lines.Line[qli].Amount = WODetailList[qli].SVMXC__Total_Line_Price__c;
            
        }
        
        
        return gtreq;
    }
    global override virtual void UpdateTaxData(AVA_TaxSvc.GetTaxResult gtres, boolean FinalizeFlag) {
        
        if (gtres.ResultCode != 'Success') {
            
            WOlist[0].Work_Order_Status__c = avalaraStatuses[2]; // Not Current
            WOlist[0].Avalara_Status__c = gtres.ResultCode + ': ' + gtres.Messages.Message[0].Name;
        } else if (WODetailList.size() == 0 && avaConfig[0].Automatic_Tax_Calculation__c) {
            WOlist[0].Work_Order_Status__c = avalaraStatuses[2]; // Not Current
            WOlist[0].Avalara_Status__c = 'No Line Items Found In This Work Order- Cannot Calculate Tax';
        } else {
            for (Integer tl = 0; tl < WODetailList.size(); tl++)
                
            {
                Decimal Rate = 0;
                String Details = '';
                WODetailList[tl].Sales_Tax_Amount__c = gtres.TaxLines.TaxLine[tl].Tax;
                for (Integer td = 0; td < gtres.TaxLines.TaxLine[tl].TaxDetails.TaxDetail.size(); td++) {
                    Rate += gtres.TaxLines.TaxLine[tl].TaxDetails.TaxDetail[td].Rate;
                    Details += (gtres.TaxLines.TaxLine[tl].TaxDetails.TaxDetail[td].Rate * 100).stripTrailingZeros().format() + ' % ' +
                        ' ' + gtres.TaxLines.TaxLine[tl].TaxDetails.TaxDetail[td].JurisType +
                        ' ' + gtres.TaxLines.TaxLine[tl].TaxDetails.TaxDetail[td].TaxType + ' Tax (' +
                        gtres.TaxLines.TaxLine[tl].TaxDetails.TaxDetail[td].TaxName + ')\r\n\r\n';
                    
                }
                WODetailList[tl].Sales_Tax_Rate__c = (Rate * 100).stripTrailingZeros().format() + '%';
                WODetailList[tl].Sales_Tax_Details__c = Details;
            }
            WOlist[0].Avalara_Status__c = gtRes.DocStatus;
            
            if (WOlist[0].Avalara_Status__c == 'Committed') {
                WOlist[0].Work_Order_Status__c = avalaraStatuses[3]; // Finalized
            } else if (WOlist[0].Avalara_Status__c == 'Saved') {
                WOlist[0].Work_Order_Status__c = avalaraStatuses[1];
            } else if (avaConfig[0].AVA_SMAX__Disable_Document_Commit__c == true) {
                if (WOlist[0].Avalara_Status__c == 'Temporary') {
                    WOlist[0].Work_Order_Status__c = avalaraStatuses[1];
                }
            }
            
            AVA_Utilities.LatchedUpdate(WODetailList);
        } 
        
        AVA_Utilities.LatchedUpdate(WOList[0]);
        
    }
    
    
    global virtual AVA_TaxSvc.BaseAddress FetchDestinationAddress() {
        AVA_TaxSvc.BaseAddress oDestinationAddress = new AVA_TaxSvc.BaseAddress();
        oDestinationAddress.AddressCode = 'D';
        // for destination use service location by default.  If blank, use Account shipping Address
        // maybe later use Account Billing address as third fallback
        if (WOList[0].SVMXC__Street__c != null && WOList[0].SVMXC__Street__c.trim().length() > 0) {
            if (null != WOList[0].SVMXC__Street__c) {
                List < String > Lines = WOList[0].SVMXC__Street__c.split('\r\n');
                oDestinationAddress.Line1 = Lines[0].trim();
                if (Lines.size() > 1) {
                    oDestinationAddress.Line2 = Lines[1].trim();
                }
                if (Lines.size() > 2) {
                    oDestinationAddress.Line3 = Lines[2].trim();
                }
            }
            oDestinationAddress.City = WOList[0].SVMXC__City__c;
            oDestinationAddress.Region = WOList[0].SVMXC__State__c;
            oDestinationAddress.PostalCode = WOList[0].SVMXC__Zip__c;
            oDestinationAddress.Country = WOList[0].SVMXC__Country__c;
        } else {
            if (null != listOfAccounts[0].ShippingStreet) {
                List < String > Lines = listOfAccounts[0].ShippingStreet.split('\r\n');
                
                oDestinationAddress.Line1 = Lines[0].trim();
                if (Lines.size() > 1) {
                    oDestinationAddress.Line2 = Lines[1].trim();
                }
                if (Lines.size() > 2) {
                    oDestinationAddress.Line3 = Lines[2].trim();
                }
            }
            
            oDestinationAddress.City = listOfAccounts[0].ShippingCity;
            oDestinationAddress.Region = listOfAccounts[0].ShippingState;
            oDestinationAddress.PostalCode = listOfAccounts[0].ShippingPostalCode;
            oDestinationAddress.Country = listOfAccounts[0].ShippingCountry;
        }
        
        
        return oDestinationAddress;
        
    }
    
    
    public virtual AVA_TaxSvc.BaseAddress FetchLineShipToServiceLocation(Id serviceLocationName) {
        AVA_TaxSvc.BaseAddress ServiceLocation = new AVA_TaxSvc.BaseAddress();
       
        List < SVMXC__Site__c > LineServiceLocation = new List < SVMXC__Site__c > ();
        
        LineServiceLocation = [select Name, SVMXC__State__c, SVMXC__Street__c, SVMXC__Zip__c, SVMXC__City__c, SVMXC__Country__c from SVMXC__Site__c where Id = : serviceLocationName];
        ServiceLocation.AddressCode = LineServiceLocation[0].Name;
        
        ServiceLocation.Line1 = LineServiceLocation[0].Name;//SVMXC__Street__c;
       
        return ServiceLocation;
    }
    
    global virtual AVA_TaxSvc.BaseAddress FetchServiceOriginAddress(Id serviceLocationName) {
        AVA_TaxSvc.BaseAddress ServiceLocation = new AVA_TaxSvc.BaseAddress();
        List < SVMXC__Site__c > LineServiceLocation = new List < SVMXC__Site__c > ();
        
        LineServiceLocation = [select Name, SVMXC__State__c, SVMXC__Street__c, SVMXC__Zip__c, SVMXC__City__c, SVMXC__Country__c from SVMXC__Site__c where Id = : serviceLocationName];
        
       
        ServiceLocation.AddressCode = LineServiceLocation[0].Name;
        
        ServiceLocation.Line1 = LineServiceLocation[0].Name;//SVMXC__Street__c;
        ServiceLocation.Line2 = '';
        ServiceLocation.Line3 = '';
       
        return ServiceLocation;
    }
    
    
    global virtual AVA_TaxSvc.BaseAddress FetchOriginAddress() {
        AVA_TaxSvc.BaseAddress oOriginAddress = new AVA_TaxSvc.BaseAddress();
        oOriginAddress.AddressCode = 'O';
        // parse multi-line street
        if (null != avaConfig[0].Origin_Street__c) {
            List < String > Lines = avaConfig[0].Origin_Street__c.split('\r\n');
            
            oOriginAddress.Line1 = Lines[0].trim();
            if (Lines.size() > 1) {
                oOriginAddress.Line2 = Lines[1].trim();
            }
            if (Lines.size() > 2) {
                oOriginAddress.Line3 = Lines[2].trim();
            }
        }
        oOriginAddress.City = avaConfig[0].Origin_City__c;
        oOriginAddress.Region = avaConfig[0].Origin_State__c;
        oOriginAddress.PostalCode = avaConfig[0].Origin_Postal_Code__c;
        //Bug : 1588, Country is not pass at admin console
        oOriginAddress.Country = avaConfig[0].Country__c;
        return oOriginAddress;
    }
}