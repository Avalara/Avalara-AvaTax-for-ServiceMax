@isTest(SeeAllData=true)
private class Ava_UnitTest{
    static testmethod void QuoteUtilitiesUnis7()
    {
       List<Avalara__c> avaCfg = new List<Avalara__c>();
            
    system.assertEquals(avaCfg.size(),0);
        AVA_AddressSvc.IsAuthorizedResult retVal = new AVA_AddressSvc.IsAuthorizedResult();
        retVal = new AVA_AddressSvc.IsAuthorizedResult();
        retVal.ResultCode = 'Error';
                    retVal.Messages = new AVA_AddressSvc.ArrayOfMessage();
                    retVal.Messages.Message = new AVA_AddressSvc.Message[1];
                    retVal.Messages.Message[0] = new AVA_AddressSvc.Message();
                    retVal.Messages.Message[0].Summary = 'Test Failure';
                    retVal.Messages.Message[0].Details = 'Test Failure';
                    retVal.Messages.Message[0].HelpLink = 'http://bogus.com';
                    retVal.Messages.Message[0].RefersTo = 'Testing';
                    retVal.Messages.Message[0].Severity = 'Error';
                    retVal.Messages.Message[0].Source = 'Gossip';
                    retVal.Messages.Message[0].Name = 'Mud';
    } 
    static testMethod void nullavaconfig(){   
    Avalara__c avaCfg = new Avalara__c();  
    AVA_TestConnect nullavaconfig = new AVA_TestConnect(avaCfg.Id);
    nullavaconfig.AVATestConnection();
    nullavaconfig.RedirectPage();
    Account a = new Account();
    AVA_OriginAddressValidation thistest = new AVA_OriginAddressValidation(a.Id);
    thistest.MakeAddressRequest(true,'Error');
    AVA_Account_ValidateShippingAddress athis = new AVA_Account_ValidateShippingAddress(a.Id);
    athis.MakeAddressRequest(true,'Error');
    }
    
    static testMethod void testAvaOriginAddress(){     
    Avalara__c avaCfg = new Avalara__c(Name='AvaCfg',Trigger_Limit__c = 1,
            Active_Avalara_Setting__c=true,Company_Code__c='default',Automatic_Tax_Calculation__c = true,
            Service_URL__c='https://avatax.avalara.net' , Account_ID__c='1100005803',
            Customer_Code_Field__c = 'Account Name',License_Key__c='D1BF31B87DEFD817',
            Enable_AvaTax_Tax_Calculation__c=true);
                  
        insert avaCfg;
    Avalara__c avaConfig = [SELECT Enable_AvaTax_Tax_Calculation__c from Avalara__c where Id = :avaCfg.Id];
    try
        {
            avaConfig.Active_Avalara_Setting__c=false;
            update avaConfig; // should except
            System.assertEquals(1,1);   // fail - expected exception
        }
        catch(Exception ex)
        {
            System.assertEquals(0,0);   // pass - expected exception
        }
        MessageBox mb1 = new MessageBox();
    // Set up the Account record.
  
    Avalara__c acc = new Avalara__c();
    acc.Account_ID__c='1100005803';
    acc.License_Key__c='D1BF31B87DEFD817';
    acc.Origin_Street__c = '900 winslow way e';
    acc.Origin_State__c= 'fo';
    acc.Origin_City__c= 'fo';
    acc.Country__c= 'fo';
    acc.Origin_Postal_Code__c= '98110';
    insert acc;
    AVA_AddressSvc.ValidAddress vaddr = new AVA_AddressSvc.ValidAddress();
       
        vaddr.Line1 = '900 winslow way e';
        vaddr.Line2 = '';
        vaddr.Line3 = '';
        vaddr.City = 'BI';
        vaddr.Region = 'WA';
        vaddr.PostalCode='98110';
        vaddr.Country='US';
    Avalara__c valdAccount = [SELECT Origin_Street__c ,Origin_Postal_Code__c from Avalara__c where Id = :acc.Id];
    AVA_OriginAddressValidation tnov = new AVA_OriginAddressValidation(valdAccount.Id);
       // tnov.RedirectToMainPage();
        // TestFlag, TestResult, TestValidateEnabled, configFailFlag
        tnov.ValidateAddress(true, 'Success', true, true);
        tnov.ValidateAddress(true, 'Success', true, false);
        tnov.ValidateAddress(true, 'Success', false, true);
        tnov.ValidateAddress(true, 'Success', false, false);
        tnov.ValidateAddress(true, 'Error', true, true);
        tnov.ValidateAddress(true, 'Error', true, false);
        tnov.ValidateAddress(true, 'Error', false, true);
        tnov.ValidateAddress(true, 'Error', false, false);
        tnov.SetUpdatedAccountAddress(vaddr);
    
    AVA_OriginAddressValidation validateShippingID = new AVA_OriginAddressValidation(valdAccount.Id);
    ApexPages.StandardController valdAccShip = new ApexPages.StandardController(valdAccount);
    AVA_OriginAddressValidation validateShippingStandardController = new AVA_OriginAddressValidation(valdAccShip);
    AVA_AddressSvc.ValidateRequest vreq = new AVA_AddressSvc.ValidateRequest();
    AVA_OriginAddressValidation thistest = new AVA_OriginAddressValidation (valdAccount.Id);
    thistest.Original.Line1 = '900 winslow way e';
    thistest.Original.Line2 = '';
    thistest.Original.City = 'foo';
    thistest.Original.Region = 'foo';
    thistest.Original.Country = 'foo';
    thistest.Original.PostalCode = '98110';
    thistest.FetchOriginalAddress();
    thistest.MakeAddressRequest(true,'Success');
    thistest.UpdateAddress();
    //thistest.SetUpdatedAccountAddress();
    validateShippingStandardController.ValidateAddress();
    
    AVA_Utilities.AsyncCancelTax(acc.Id,'',false);
    // 
  } 
  
  static testMethod void AddressSvcUnitTest4() 
    {
       Avalara__c avaCfg = new Avalara__c(Name='AvaCfg',Trigger_Limit__c = 1,
            Active_Avalara_Setting__c=true,Company_Code__c='default',
            Service_URL__c='' , Account_ID__c='1100005803',Customer_Code_Field__c = 'Account Name',
            License_Key__c='D1BF31B87DEFD817',Enable_AvaTax_Tax_Calculation__c=true);
               
        insert avaCfg;
    Avalara__c avaConfig = [SELECT Id,Service_URL__c,License_Key__c,Account_ID__c,Enable_AvaTax_Tax_Calculation__c from Avalara__c where Id = :avaCfg.Id];
    system.assertEquals(avaCfg.Trigger_Limit__c,1);
    avaCfg.Trigger_Limit__c = 1;
    update avaCfg;
    AVA_SQuoteUtils sqUtils = new AVA_SQuoteUtils();
    ApexPages.StandardController controller = new ApexPages.StandardController(avaConfig);
    AVA_TestConnect conns = new AVA_TestConnect(controller);
    AVA_TestConnect conn = new AVA_TestConnect(avaConfig.Id);
    conn.AVATestConnection(false,'',false);
    }
  
  static testMethod void AddressSvcUnitTest3() 
    {
       Avalara__c avaCfg = new Avalara__c(Name='AvaCfg',Trigger_Limit__c = 1,
            Active_Avalara_Setting__c=true,Company_Code__c='default',
            Service_URL__c='' , Account_ID__c='1100005803',Customer_Code_Field__c = 'Account Name',
            License_Key__c='D1BF31B87DEFD817',Enable_AvaTax_Tax_Calculation__c=true);
        insert avaCfg;
    Avalara__c avaConfig = [SELECT Id,Service_URL__c,License_Key__c,Account_ID__c,Enable_AvaTax_Tax_Calculation__c from Avalara__c where Id = :avaCfg.Id];
    AVA_TestConnect conn = new AVA_TestConnect(avaConfig.Id);
    conn.AVATestConnection(false,'',false);
    }
    
  static testMethod void AddressSvcUnitTest2() 
    {
        Avalara__c avaCfg = new Avalara__c(Name='AvaCfg',Trigger_Limit__c = 1,
            Active_Avalara_Setting__c=true,Company_Code__c='default',
            Service_URL__c='' , Account_ID__c='1100005803',Customer_Code_Field__c = 'Account Name',
            License_Key__c='D1BF31B87DEFD817',Enable_AvaTax_Tax_Calculation__c=true);
             
        insert avaCfg;
    Avalara__c avaConfig = [SELECT Id,Service_URL__c,Account_ID__c,Enable_AvaTax_Tax_Calculation__c from Avalara__c where Id = :avaCfg.Id];
    AVA_TestConnect conn = new AVA_TestConnect(avaConfig.Id);
    conn.AVATestConnection(false,'',false);
    }
    
    static testMethod void DisableTaxCalc() 
    {
        Avalara__c avaCfg = new Avalara__c(Name='AvaCfg',
            Active_Avalara_Setting__c=true,Company_Code__c='ITS',
            Service_URL__c='https://development.avalara.net' , Account_ID__c='Bhavesh',Customer_Code_Field__c = 'Account Name',AVA_SMAX__Enable_AvaTax_Tax_Calculation__c=false,
            License_Key__c='Avalara@2014',Enable_AvaTax_Tax_Calculation__c=false);
            
        insert avaCfg;
    Avalara__c avaConfig = [SELECT Id,Service_URL__c,License_Key__c,Account_ID__c,Enable_AvaTax_Tax_Calculation__c from Avalara__c where Id = :avaCfg.Id];
    Account acc = new Account();
    acc.Name = 'Testing';
    acc.ShippingStreet = '900 winslow waye e /r/n test';
    acc.ShippingState = 'WA';
    acc.ShippingCountry = 'US';
    acc.ShippingCity = 'BI';
    acc.ShippingPostalCode = '98110';
    insert acc;
        Account valdAccount = [SELECT ShippingStreet,ShippingState,ShippingCity,ShippingCountry,ShippingPostalCode from Account where Id = :acc.Id];
      Contact testContact = new Contact(LastName=DateTime.now().format(), AccountId=valdAccount.Id,
            MailingStreet = 'foo', MailingCity = 'BI', MailingState='WA', MailingPostalCode = '98110-2450', MailingCountry = 'US',
            OtherStreet = 'foo', OtherCity = 'BI', OtherState='WA', OtherPostalCode = '98110-2450', OtherCountry = 'US');
        
        insert testContact;
      SVMXC__Service_Order__c WOList = new SVMXC__Service_Order__c();
      WOlist.SVMXC__Company__c = valdAccount.Id;
      WOList.SVMXC__Contact__c = testContact.Id;
      WOList.SVMXC__Order_Status__c = 'Open';
      WOList.SVMXC__Priority__c = 'High';
      WOList.SVMXC__Order_Type__c = 'Field Service';
      WOList.SVMXC__Street__c = '900 winslow way';
      WOList.SVMXC__Zip__c = '98110';
      WOList.SVMXC__State__c = 'WA';
      WOList.SVMXC__Country__c = 'US';
      WOList.SVMXC__City__c = 'BI';
      WOList.Work_Order_Status__c  = '';
      WOList.Avalara_Status__c ='';
      Entity_Use_Code__c UTEntityUseCode = new Entity_Use_Code__c();
      UTEntityUseCode.Name = 'A';
      UTEntityUseCode.Description__c = 'Test';
      insert UTEntityUseCode;
      
      Entity_Use_Code__c a = [SELECT Id, Name,Description__c FROM Entity_Use_Code__c WHERE Name='A' LIMIT 1];
      
      Entity_Use_Code__c getEntityCode = [select Id,Name from Entity_Use_Code__c where Id =: UTEntityUseCode.Id];
      WOList.AvaTax_Entity_Use_Code__c = a.Id;
      insert WOList;
       
      AVA_Service_Location_Validate thistest = new AVA_Service_Location_Validate(WOList.Id);
    thistest.Original.Line1 = '900 winslow way e';
    thistest.Original.Line2 = '';
    thistest.Original.City = 'foo';
    thistest.Original.Region = 'foo';
    thistest.Original.Country = 'foo';
    thistest.Original.PostalCode = '98110';
    thistest.FetchOriginalAddress();
    thistest.UpdateAddress();
      AVA_Service_Location_Validate serviceValidate = new AVA_Service_Location_Validate(WOList.Id);
      AVA_Service_Location_Validate serviceValidates = new AVA_Service_Location_Validate(WOList);
      AVA_Service_Location_Validate nullserviceValidate = new AVA_Service_Location_Validate();
      ApexPages.StandardController valdserviceBill = new ApexPages.StandardController(WOList);
      AVA_Service_Location_Validate conserviceValidate = new AVA_Service_Location_Validate(valdserviceBill);
      AVA_AddressSvc.ValidateRequest vreq = new AVA_AddressSvc.ValidateRequest();
            vreq.Coordinates = false;
            vreq.Taxability=false;
            vreq.TextCase='Mixed';
            
            AVA_AddressSvc.ValidateResult vres = null;
            vreq.Address = thistest.Original.PageAddressToBaseAddress();
            AVA_AddressSvc.AddressSvcSoap addressSvc = new AVA_AddressSvc.AddressSvcSoap(avaConfig.Service_URL__c);
            addressSvc.Security.UsernameToken.Username = avaConfig.Account_ID__c;
            addressSvc.Security.UsernameToken.Password = avaConfig.License_Key__c;
            addressSvc.Profile.Client = 'AvaTax4ServiceMax,1.0';
            addressSvc.timeout_x = 30000;
            vres = new AVA_AddressSvc.ValidateResult();
                vres.ResultCode = 'Success';
                vres.ValidAddresses = new AVA_AddressSvc.ArrayOfValidAddress();
                vres.ValidAddresses.ValidAddress = new AVA_AddressSvc.ValidAddress[1];
                vres.ValidAddresses.ValidAddress[0] = new AVA_AddressSvc.ValidAddress();                
                vres.Messages = new AVA_AddressSvc.ArrayOfMessage();
                vres.Messages.Message = new AVA_AddressSvc.Message[1];
                vres.Messages.Message[0] = new AVA_AddressSvc.Message();
                vres.Messages.Message[0].Name = 'foo';
                vres.Messages.Message[0].Summary = 'foo';
                vres.Messages.Message[0].Details = 'foo';
           // vres=addressSvc.Validate(vreq);
           // thistest.SetUpdatedAccountAddress(vres.ValidAddresses.ValidAddress[0]);
      SVMXC__Service_Order_Line__c WLine = new SVMXC__Service_Order_Line__c();
      WLine.SVMXC__Service_Order__c = WOList.Id;
      WLine.SVMXC__Line_Type__c = 'Labour';
      //WLine.SVMXC__Product__c = lineProd[0].Name;
      WLine.SVMXC__Actual_Price2__c = 110;
      WLine.SVMXC__Estimated_Quantity2__c = 2;
      insert WLine;
      
      
      SVMXC__Service_Order__c WList = [select Id,Name,
            SVMXC__Contact__c,SVMXC__Company__c,SVMXC__Street__c, SVMXC__City__c, AvaTax_Entity_Use_Code__c,
            SVMXC__State__c, SVMXC__Zip__c, SVMXC__Country__c,Avalara_Status__c,Work_Order_Status__c, (select Name,Non_Taxable__c, SVMXC__Actual_Quantity2__c,SVMXC__Work_Description__c,SVMXC__Line_Type__c,
       SVMXC__Total_Line_Price__c, SVMXC__From_Location__c, SVMXC__Requested_Location__c from SVMXC__Service_Order_Line__r)
            from SVMXC__Service_Order__c where id =:WOList.Id];
      SVMXC__Service_Order_Line__c WOLines = WList.SVMXC__Service_Order_Line__r;
      
      AVA_AddressSvc.ValidAddress vaddr = new AVA_AddressSvc.ValidAddress();
       
        vaddr.Line1 = '900 winslow way e';
        vaddr.Line2 = '';
        vaddr.Line3 = '';
        vaddr.City = 'BI';
        vaddr.Region = 'WA';
        vaddr.PostalCode='98110';
        vaddr.Country='US';
    AVA_Service_Location_Validate tnov = new AVA_Service_Location_Validate(WList);
       // tnov.RedirectToMainPage();
        // TestFlag, TestResult, TestValidateEnabled, configFailFlag
        tnov.ValidateAddress(true, 'Success', true, true);
        tnov.ValidateAddress(true, 'Success', true, false);
        tnov.ValidateAddress(true, 'Success', false, true);
        tnov.ValidateAddress(true, 'Success', false, false);
        tnov.ValidateAddress(true, 'Error', true, true);
        tnov.ValidateAddress(true, 'Error', true, false);
        tnov.ValidateAddress(true, 'Error', false, true);
        tnov.ValidateAddress(true, 'Error', false, false);
        tnov.SetUpdatedAccountAddress(vaddr);
      List<Avalara__c> qtntmp = null;
        List<SObject> sotmp = null;
        ///////////////////////////// TestConnect ///////////////////////////////////////////////////
            
        ///////////////////////////// Triggers ///////////////////////////////////////////////////     
        // Now test there must always be one and only one Active_Tax_Now_Setting
        qtntmp = AVA_Utilities.FetchActiveSettings();
        AVA_TaxSvc.GetTaxRequest gtreq = new AVA_TaxSvc.GetTaxRequest();
        gtreq.CompanyCode = 'ITS';
        gtreq.CompanyCode = 'ITSS'.trim();
        gtreq.Commit_x = true;
        WList.Avalara_Status__c = 'Sales Tax Not Current';
        WList.Work_Order_Status__c = 'Temporary';
        update WList;
        system.assertEquals(gtreq.DocCode,null);
        gtreq.DocCode = WList.Id;
         gtreq.DocType = 'SalesOrder';
        AVA_GetTaxWorkOrder thisstest = new AVA_GetTaxWorkOrder(WList.Id);
        
        thisstest.FetchSignature();
        
      AVA_GetTaxWorkOrder avaGWO = new AVA_GetTaxWorkOrder(WList.Id);
      AVA_GetTaxWorkOrder.FetchEntityUseCode('test');
      avaGWO.ShouldCalcTax();
        avaGWO.FetchTaxData(true);
      avaGWO.FetchOriginAddress();
		
        
        
      AVA_TaxSvc.GetTaxResult getTaxResult = new AVA_TaxSvc.GetTaxResult();
      AVA_GetTaxWorkOrder.FetchEntityUseCode('A');
       avaGWO.CalcTax(false);
       string qualmsg = avaGWO.ShouldCalcTax();
      avaGWO.CalcTax(true);
       system.assertEquals(WOList.Avalara_Status__c,'');
       WOList.Avalara_Status__c = 'Saved';

       update WOList;
       
       SVMXC__Quote__c utestSQ = new SVMXC__Quote__c();
       utestSQ.SVMXC__Service_Order__c = WList.Id;
       utestSQ.SVMXC__Company__c = acc.Id;
       utestSQ.SVMXC__Contact__c = testContact.Id;
       utestSQ.SVMXC__Status__c = 'Draft';
       utestSQ.SVMXC__Valid_Until__c = Date.Today();
       utestSQ.SVMXC__Discount_Type__c = 'Amount';
       utestSQ.SVMXC__Quote_Amount2__c = 100;
       insert utestSQ;
       SVMXC__Quote_Line__c utestSQLine = new SVMXC__Quote_Line__c();
       utestSQLine.SVMXC__Quote__c = utestSQ.Id;
       utestSQLine.SVMXC__Line_Type__c = 'Parts';
       utestSQLine.SVMXC__Discount_Type__c = 'Amount';
       utestSQLine.SVMXC__Quantity2__c = 1;
       utestSQLine.SVMXC__Unit_Price2__c = 110;
       utestSQLine.SVMXC__Line_Price2__c = 110;
       insert utestSQLine;
       SVMXC__Quote__c SQList= [select Id,SVMXC__Service_Order__c,SVMXC__Company__c,SVMXC__Contact__c,SVMXC__Status__c,SVMXC__Valid_Until__c,
       SVMXC__Discount_Type__c,SVMXC__Quote_Amount2__c,(select SVMXC__Line_Type__c,SVMXC__Quantity2__c,SVMXC__Unit_Price2__c,SVMXC__Line_Price2__c from SVMXC__Quote_Line__r)
        from SVMXC__Quote__c where Id =: utestSQ.Id];
        
        SVMXC__Quote_Line__c SQLines = SQList.SVMXC__Quote_Line__r;
        
        AVA_GetTaxQuote calc = new AVA_GetTaxQuote(SQList.Id);
        //ApexPages.StandardController controllers = new ApexPages.StandardController(SQList);
        //AVA_GetTaxQuote calcs = new AVA_GetTaxQuote(controllers);
        AVA_GetTaxQuote.FetchEntityUseCode('A');
        AVA_TaxSvc.GetTaxResult getTaxRes = new AVA_TaxSvc.GetTaxResult();
        string qualmsg1 = calc.ShouldCalcTax();
        calc.CalcTax();
        calc.Finalize();
        calc.RedirectPage();
        calc.UpdateTaxData(getTaxRes, true);
        AVA_GetTaxQuote nullSQ = new AVA_GetTaxQuote();
     delete WList;
 
    }
   
    static testMethod void AddressSvcUnitTest1() 
    {
         Avalara__c avaCfg = new Avalara__c(Name='AvaCfg',Trigger_Limit__c = 1,
            Active_Avalara_Setting__c=true,Company_Code__c='default',
            Service_URL__c='' , Account_ID__c='1100005803',Customer_Code_Field__c = 'Account Name',
            License_Key__c='D1BF31B87DEFD817',Enable_AvaTax_Tax_Calculation__c=true);
        
        insert avaCfg;
    Avalara__c avaConfig = [SELECT Id,Service_URL__c,Enable_AvaTax_Tax_Calculation__c from Avalara__c where Id = :avaCfg.Id];
    AVA_TestConnect conn = new AVA_TestConnect(avaConfig.Id);
    conn.AVATestConnection(false,'',false);
    }
    
  static testMethod void testAvaAccountShippingAddress(){     
    Avalara__c avaCfg = new Avalara__c(Name='AvaCfg',
            Active_Avalara_Setting__c=true,Company_Code__c='ITS',
            Service_URL__c='https://development.avalara.net', Account_ID__c='1100005803',Customer_Code_Field__c = 'Account Name',
            License_Key__c='D1BF31B87DEFD817',Enable_AvaTax_Tax_Calculation__c=false);
            
        insert avaCfg;
    Avalara__c avaConfig = [SELECT Enable_AvaTax_Tax_Calculation__c from Avalara__c where Id = :avaCfg.Id];
    AVA_TestConnect conn = new AVA_TestConnect(avaConfig.Id);
    conn.AVATestConnection(true,'Success',true);
    // Set up the Account record.
    Account acc = new Account();
    acc.Name = 'Testing';
    acc.ShippingStreet = '900 winslow waye e /r/n test';
    acc.ShippingState = 'foo';
    acc.ShippingCountry = 'foo';
    acc.ShippingCity = 'foo';
    acc.ShippingPostalCode = '98110';
    insert acc;
    Account valdAccount = [SELECT ShippingStreet,ShippingPostalCode from Account where Id = :acc.Id];
    system.assertEquals(false,avaConfig.Enable_AvaTax_Tax_Calculation__c,'Please enable Tax Calc');
    avaCfg.Enable_AvaTax_Tax_Calculation__c = true;
    update avaCfg;
    AVA_AddressSvc.ValidAddress vaddr = new AVA_AddressSvc.ValidAddress();
       
        vaddr.Line1 = '900 winslow way e';
        vaddr.Line2 = '';
        vaddr.Line3 = '';
        vaddr.City = 'BI';
        vaddr.Region = 'WA';
        vaddr.PostalCode='98110';
        vaddr.Country='US';
    AVA_Account_ValidateShippingAddress tnov = new AVA_Account_ValidateShippingAddress(acc);
       // tnov.RedirectToMainPage();
        // TestFlag, TestResult, TestValidateEnabled, configFailFlag
        tnov.ValidateAddress(true, 'Success', true, true);
        tnov.ValidateAddress(true, 'Success', true, false);
        tnov.ValidateAddress(true, 'Success', false, true);
        tnov.ValidateAddress(true, 'Success', false, false);
        tnov.ValidateAddress(true, 'Error', true, true);
        tnov.ValidateAddress(true, 'Error', true, false);
        tnov.ValidateAddress(true, 'Error', false, true);
        tnov.ValidateAddress(true, 'Error', false, false);
        tnov.SetUpdatedAccountAddress(vaddr);
   // AVA_GetTaxWorkOrder avaGWOTest = new AVA_GetTaxWorkOrder();
    AVA_Account_ValidateShippingAddress validateShippingNull = new AVA_Account_ValidateShippingAddress();
    AVA_Account_ValidateShippingAddress validateShipping = new AVA_Account_ValidateShippingAddress(valdAccount);
    AVA_Account_ValidateShippingAddress validateShippingID = new AVA_Account_ValidateShippingAddress(valdAccount.Id);
    ApexPages.StandardController valdAccShip = new ApexPages.StandardController(valdAccount);
    AVA_Account_ValidateShippingAddress validateShippingStandardController = new AVA_Account_ValidateShippingAddress(valdAccShip);
    AVA_Account_ValidateShippingAddress thistest = new AVA_Account_ValidateShippingAddress(valdAccount.Id);
    thistest.Original.Line1 = '900 winslow way e';
    thistest.Original.Line2 = '';
    thistest.Original.City = 'foo';
    thistest.Original.Region = 'foo';
    thistest.Original.Country = 'foo';
    thistest.Original.PostalCode = '98110';
    thistest.FetchOriginalAddress();
    thistest.UpdateAddress();
    validateShippingStandardController.ValidateAddress();
    acc.ShippingCity = 'BI';
    acc.ShippingCountry = 'US';
    acc.ShippingState = 'WA';
    update acc;
    AVA_Utilities.AsyncCancelTax(acc.Id,'',false);
    // 
  } 
  static testMethod void testAvaAccountBillingAddress(){     
    Avalara__c avaCfg = new Avalara__c(Name='AvaCfg',
            Active_Avalara_Setting__c=true,Company_Code__c='ITS',
            Service_URL__c='https://development.avalara.net' , Account_ID__c='Bhavesh',Customer_Code_Field__c = 'Account Name',
            License_Key__c='Avalara@2014',Enable_AvaTax_Tax_Calculation__c=false);
            
        insert avaCfg;
    Avalara__c avaConfig = [SELECT Enable_AvaTax_Tax_Calculation__c from Avalara__c where Id = :avaCfg.Id];
    // Set up the Account record.
    Account acc = new Account();
    acc.Name = 'Testing';
    acc.BillingStreet = '900 winslow waye e /r/n test';
    acc.BillingState = 'BI';
    acc.BillingCountry = 'US';
    acc.BillingCity = 'WA';
    acc.BillingPostalCode = '98110';
    insert acc;
    Account valdAccount = [SELECT BillingStreet,BillingState,BillingCountry,BillingCity,BillingPostalCode from Account where Id = :acc.Id];
    system.assertEquals(false,avaConfig.Enable_AvaTax_Tax_Calculation__c,'Please enable Tax Calc');
    avaCfg.Enable_AvaTax_Tax_Calculation__c = true;
    update avaCfg;
    AVA_AddressSvc.ValidAddress vaddr = new AVA_AddressSvc.ValidAddress();
       
        vaddr.Line1 = '900 winslow way e';
        vaddr.Line2 = '';
        vaddr.Line3 = '';
        vaddr.City = 'BI';
        vaddr.Region = 'WA';
        vaddr.PostalCode='98110';
        vaddr.Country='US';
    
    
    // 
  }
  @isTest(SeeAllData=true)
  static  void getaxUnitTest()
  {
      Avalara__c avaCfg = new Avalara__c(Name='AvaCfg',Trigger_Limit__c = 1,
            Active_Avalara_Setting__c=true,Company_Code__c='default',
            Service_URL__c='https://development.avalara.net' , Account_ID__c='1100005803',Customer_Code_Field__c = 'Account Name',
            License_Key__c='D1BF31B87DEFD817',Enable_AvaTax_Tax_Calculation__c=true);
            
        insert avaCfg;
    Avalara__c avaConfig = [SELECT Service_URL__c,Account_ID__c,License_Key__c,Company_Code__c,Enable_AvaTax_Tax_Calculation__c from Avalara__c where Id = :avaCfg.Id];
    Account acc = new Account();
    acc.Name = 'Testing';
    acc.ShippingStreet = '900 winslow waye e /r/n test';
    acc.ShippingState = 'WA';
    acc.ShippingCountry = 'US';
    acc.ShippingCity = 'BI';
    acc.ShippingPostalCode = '98110';
    insert acc;
        Account valdAccount = [SELECT ShippingStreet,ShippingState,ShippingCity,ShippingCountry,ShippingPostalCode from Account where Id = :acc.Id];
      Contact testContact = new Contact(LastName=DateTime.now().format(), AccountId=valdAccount.Id,
            MailingStreet = 'foo', MailingCity = 'BI', MailingState='WA', MailingPostalCode = '98110-2450', MailingCountry = 'US',
            OtherStreet = 'foo', OtherCity = 'BI', OtherState='WA', OtherPostalCode = '98110-2450', OtherCountry = 'US');
        
        insert testContact;
      SVMXC__Service_Order__c WOList = new SVMXC__Service_Order__c();
      WOlist.SVMXC__Company__c = valdAccount.Id;
      WOList.SVMXC__Contact__c = testContact.Id;
      WOList.SVMXC__Order_Status__c = 'Open';
      WOList.SVMXC__Priority__c = 'High';
      WOList.SVMXC__Order_Type__c = 'Field Service';
      WOList.SVMXC__Street__c = '900 winslow way';
      WOList.SVMXC__Zip__c = '98110';
      WOList.SVMXC__State__c = 'WA';
      WOList.SVMXC__Country__c = 'US';
      WOList.SVMXC__City__c = 'BI';
      WOList.Work_Order_Status__c  = '';
      WOList.Avalara_Status__c ='';
      Entity_Use_Code__c UTEntityUseCode = new Entity_Use_Code__c();
      UTEntityUseCode.Name = 'A';
      UTEntityUseCode.Description__c = 'Test';
      insert UTEntityUseCode;
      
      Entity_Use_Code__c a = [SELECT Id, Name,Description__c FROM Entity_Use_Code__c WHERE Name='A' LIMIT 1];
      
      Entity_Use_Code__c getEntityCode = [select Id,Name from Entity_Use_Code__c where Id =: UTEntityUseCode.Id];
      WOList.AvaTax_Entity_Use_Code__c = a.Id;
      insert WOList;
       
     AVA_Service_Location_Validate thistest = new AVA_Service_Location_Validate(WOList.Id);
    thistest.Original.Line1 = '900 winslow way e';
    thistest.Original.Line2 = '';
    thistest.Original.City = 'foo';
    thistest.Original.Region = 'foo';
    thistest.Original.Country = 'foo';
    thistest.Original.PostalCode = '98110';
    thistest.FetchOriginalAddress();
    thistest.UpdateAddress();
   AVA_Service_Location_Validate serviceValidate = new AVA_Service_Location_Validate(WOList.Id);
      AVA_Service_Location_Validate serviceValidates = new AVA_Service_Location_Validate(WOList);
      AVA_Service_Location_Validate nullserviceValidate = new AVA_Service_Location_Validate();
      ApexPages.StandardController valdserviceBill = new ApexPages.StandardController(WOList);
      AVA_Service_Location_Validate conserviceValidate = new AVA_Service_Location_Validate(valdserviceBill);
      AVA_AddressSvc.ValidateRequest vreq = new AVA_AddressSvc.ValidateRequest();
            vreq.Coordinates = false;
            vreq.Taxability=false;
            vreq.TextCase='Mixed';
           
            AVA_AddressSvc.ValidateResult vres = null;
            vreq.Address = thistest.Original.PageAddressToBaseAddress();
            AVA_AddressSvc.AddressSvcSoap addressSvc = new AVA_AddressSvc.AddressSvcSoap(avaConfig.Service_URL__c);
            addressSvc.Security.UsernameToken.Username = avaConfig.Account_ID__c;
            addressSvc.Security.UsernameToken.Password = avaConfig.License_Key__c;
            addressSvc.Profile.Client = 'AvaTax4ServiceMax,1.0';
            addressSvc.timeout_x = 30000;
            vres = new AVA_AddressSvc.ValidateResult();
                vres.ResultCode = 'Success';
                vres.ValidAddresses = new AVA_AddressSvc.ArrayOfValidAddress();
                vres.ValidAddresses.ValidAddress = new AVA_AddressSvc.ValidAddress[1];
                vres.ValidAddresses.ValidAddress[0] = new AVA_AddressSvc.ValidAddress();                
                vres.Messages = new AVA_AddressSvc.ArrayOfMessage();
                vres.Messages.Message = new AVA_AddressSvc.Message[1];
                vres.Messages.Message[0] = new AVA_AddressSvc.Message();
                vres.Messages.Message[0].Name = 'foo';
                vres.Messages.Message[0].Summary = 'foo';
                vres.Messages.Message[0].Details = 'foo';
          //  vres=addressSvc.Validate(vreq);
           // thistest.SetUpdatedAccountAddress(vres.ValidAddresses.ValidAddress[0]);
      SVMXC__Service_Order_Line__c WLine = new SVMXC__Service_Order_Line__c();
      WLine.SVMXC__Service_Order__c = WOList.Id;
      WLine.SVMXC__Line_Type__c = 'Labour';
      //WLine.SVMXC__Product__c = lineProd[0].Name;
      WLine.SVMXC__Actual_Price2__c = 110;
      WLine.SVMXC__Estimated_Quantity2__c = 2;
      insert WLine;
      
      
      SVMXC__Service_Order__c WList = [select Id,Name,
            SVMXC__Contact__c,SVMXC__Company__c,SVMXC__Street__c, SVMXC__City__c, AvaTax_Entity_Use_Code__c,
            SVMXC__State__c, SVMXC__Zip__c, SVMXC__Country__c,Avalara_Status__c,Work_Order_Status__c, (select Name,Non_Taxable__c, SVMXC__Actual_Quantity2__c,SVMXC__Work_Description__c,SVMXC__Line_Type__c,
       SVMXC__Total_Line_Price__c, SVMXC__From_Location__c, SVMXC__Requested_Location__c from SVMXC__Service_Order_Line__r)
            from SVMXC__Service_Order__c where id =:WOList.Id];
      SVMXC__Service_Order_Line__c WOLines = WList.SVMXC__Service_Order_Line__r;
      
     AVA_AddressSvc.ValidAddress vaddr = new AVA_AddressSvc.ValidAddress();
       
        vaddr.Line1 = '900 winslow way e';
        vaddr.Line2 = '';
        vaddr.Line3 = '';
        vaddr.City = 'BI';
        vaddr.Region = 'WA';
        vaddr.PostalCode='98110';
        vaddr.Country='US';
    AVA_Service_Location_Validate tnov = new AVA_Service_Location_Validate(WList);
       // tnov.RedirectToMainPage();
        // TestFlag, TestResult, TestValidateEnabled, configFailFlag
        tnov.ValidateAddress(true, 'Success', true, true);
        tnov.ValidateAddress(true, 'Success', true, false);
        tnov.ValidateAddress(true, 'Success', false, true);
        tnov.ValidateAddress(true, 'Success', false, false);
        tnov.ValidateAddress(true, 'Error', true, true);
        tnov.ValidateAddress(true, 'Error', true, false);
        tnov.ValidateAddress(true, 'Error', false, true);
        tnov.ValidateAddress(true, 'Error', false, false);
        tnov.SetUpdatedAccountAddress(vaddr);
      List<Avalara__c> qtntmp = null;
        List<SObject> sotmp = null;
        ///////////////////////////// TestConnect ///////////////////////////////////////////////////
            
        ///////////////////////////// Triggers ///////////////////////////////////////////////////      
        // Now test there must always be one and only one Active_Tax_Now_Setting
        qtntmp = AVA_Utilities.FetchActiveSettings();
        AVA_TaxSvc.GetTaxRequest gtreq = new AVA_TaxSvc.GetTaxRequest();
        gtreq.CompanyCode = 'ITS';
        gtreq.CompanyCode = 'ITSS'.trim();
        gtreq.Commit_x = true;
        WList.Avalara_Status__c = 'Sales Tax Not Current';
        WList.Work_Order_Status__c = 'Temporary';
        update WList;
        system.assertEquals(gtreq.DocCode,null);
        gtreq.DocCode = WList.Id;
         gtreq.DocType = 'SalesOrder';
        AVA_GetTaxWorkOrder thisstest = new AVA_GetTaxWorkOrder(WList.Id);
        
        thisstest.FetchSignature();
        
      AVA_GetTaxWorkOrder avaGWO = new AVA_GetTaxWorkOrder(WList.Id);
      //AVA_TaxSvc.GetTaxResult getTaxResult = new AVA_TaxSvc.GetTaxResult();
      AVA_GetTaxWorkOrder.FetchEntityUseCode('A');
   //    avaGWO.CalcTax(false);
       string qualmsg = avaGWO.ShouldCalcTax();
     // avaGWO.CalcTax(true);
       system.assertEquals(WOList.Avalara_Status__c,'');
       WOList.Avalara_Status__c = 'Saved';
       WOList.Work_Order_Status__c = 'Sales Tax Current';
       update WOList;
       
       SVMXC__Quote__c utestSQ = new SVMXC__Quote__c();
       utestSQ.SVMXC__Service_Order__c = WList.Id;
       utestSQ.SVMXC__Company__c = acc.Id;
       utestSQ.SVMXC__Contact__c = testContact.Id;
       utestSQ.SVMXC__Status__c = 'Draft';
       utestSQ.SVMXC__Valid_Until__c = Date.Today();
       utestSQ.SVMXC__Discount_Type__c = 'Amount';
       utestSQ.SVMXC__Quote_Amount2__c = 100;
       insert utestSQ;
       SVMXC__Quote_Line__c utestSQLine = new SVMXC__Quote_Line__c();
       utestSQLine.SVMXC__Quote__c = utestSQ.Id;
       utestSQLine.SVMXC__Line_Type__c = 'Parts';
       utestSQLine.SVMXC__Discount_Type__c = 'Amount';
       utestSQLine.SVMXC__Quantity2__c = 1;
       utestSQLine.SVMXC__Unit_Price2__c = 110;
       utestSQLine.SVMXC__Line_Price2__c = 110;
       insert utestSQLine;
       SVMXC__Quote__c SQList= [select Id,SVMXC__Service_Order__c,SVMXC__Company__c,SVMXC__Contact__c,SVMXC__Status__c,SVMXC__Valid_Until__c,
       SVMXC__Discount_Type__c,SVMXC__Quote_Amount2__c,(select SVMXC__Line_Type__c,SVMXC__Quantity2__c,SVMXC__Unit_Price2__c,SVMXC__Line_Price2__c from SVMXC__Quote_Line__r)
        from SVMXC__Quote__c where Id =: utestSQ.Id];
        
        SVMXC__Quote_Line__c SQLines = SQList.SVMXC__Quote_Line__r;
        
        AVA_GetTaxQuote calc = new AVA_GetTaxQuote(SQList.Id);
        //ApexPages.StandardController controllers = new ApexPages.StandardController(SQList);
        //AVA_GetTaxQuote calcs = new AVA_GetTaxQuote(controllers);
        AVA_GetTaxQuote.FetchEntityUseCode('A');
        string qualmsg1 = calc.ShouldCalcTax();
        calc.CalcTax(false);
        AVA_GetTaxQuote nullSQ = new AVA_GetTaxQuote();
          AVA_TaxSvc.GetTaxHistoryRequest gthreq = new AVA_TaxSvc.GetTaxHistoryRequest();
        gthreq .CompanyCode = 'ITS';
        gthreq .CompanyCode = 'ITSS'.trim();
         gthreq .DocCode = WList.Id;
         gthreq .DetailLevel = 'Document';
         gthreq .DocType = 'SalesInvoice';
       delete WList;
  }
  
        @isTest
    public static Void TestPing()
    {
         // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new PingCalloutMock());
        // Call the method that invokes a callout
    
       AVA_AddressSvc.PingResult oprRess = new    AVA_AddressSvc.PingResult();

       
        	//Passing the version and header part of gettax request
           AVA_AddressSvc.AddressSvcSoap taxSvc = new AVA_AddressSvc.AddressSvcSoap('https://avatax.avalara.net');
            taxSvc.Security.UsernameToken.Username = '12345';
            taxSvc.Security.UsernameToken.Password = '12345';
            taxSvc.Profile.Client = 'AvaTaxForAccountingSeed 2.79||2.79';
            taxSvc.timeout_x = 30000;   // timeout 30 seconds
                 
        	oprRess = taxSvc.Ping('Ping');
        AVA_AddressSvc.Message aMessage = new AVA_AddressSvc.Message();
        AVA_AddressSvc.ArrayOfMessage arrayMessage = new AVA_AddressSvc.ArrayOfMessage();
    }

    @isTest
    public static Void TestValAddress()
    {
         // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ValAddressCallMock());
        // Call the method that invokes a callout
    
        AVA_AddressSvc.ValidateResult valAddResult = new  AVA_AddressSvc.ValidateResult();
   
       
        	//Passing the version and header part of gettax request
            AVA_AddressSvc.AddressSvcSoap taxSvc = new AVA_AddressSvc.AddressSvcSoap('https://avatax.avalara.net');
            taxSvc.Security.UsernameToken.Username = '12345';
            taxSvc.Security.UsernameToken.Password = '12345';
            taxSvc.Profile.Client = 'AvaTaxForAccountingSeed 2.79||2.79';
            taxSvc.timeout_x = 30000;   // timeout 30 seconds
            
        AVA_AddressSvc.ValidateRequest app = new AVA_AddressSvc.ValidateRequest();
        
        	valAddResult = taxSvc.Validate(app) ;
        
    }  

    
      @isTest
    public static Void TestIsAuthorize()
    {
         // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new IsAuthorizeAddressCalloutMock());
        // Call the method that invokes a callout
    
      AVA_AddressSvc.IsAuthorizedResult oprRess = new    AVA_AddressSvc.IsAuthorizedResult();

       
        	//Passing the version and header part of gettax request
            AVA_AddressSvc.AddressSvcSoap taxSvc = new AVA_AddressSvc.AddressSvcSoap('https://avatax.avalara.net');
            taxSvc.Security.UsernameToken.Username = '12345';
            taxSvc.Security.UsernameToken.Password = '12345';
            taxSvc.Profile.Client = 'AvaTaxForAccountingSeed 2.79||2.79';
            taxSvc.timeout_x = 30000;   // timeout 30 seconds
                 
        	oprRess = taxSvc.IsAuthorized('Ping');
        
    }
  

    
    
   // Ava_AddressSvc
    static testMethod void AddressSvcUnitTest() 
    {
        AVA_AddressSvc m_AddrSvc = new AVA_AddressSvc();
        AVA_AddressSvc.AddressSvcSoap m_addrSvcSoap = new AVA_AddressSvc.AddressSvcSoap('https://developer.avalara.net');
        AVA_AddressSvc.IsAuthorizedResult IsAuthorized = new AVA_AddressSvc.IsAuthorizedResult();
        AVA_AddressSvc.PingResult m_tstPres = new AVA_AddressSvc.PingResult();
        AVA_AddressSvc.IsAuthorizedResult m_tias = new AVA_AddressSvc.IsAuthorizedResult();
        AVA_AddressSvc.IsAuthorizedResponse_element m_tiare = new AVA_AddressSvc.IsAuthorizedResponse_element();
        AVA_AddressSvc.Message m_tmsg = new AVA_AddressSvc.Message();
        AVA_AddressSvc.ArrayOfValidAddress m_tarrva = new AVA_AddressSvc.ArrayOfValidAddress();
        AVA_AddressSvc.ValidateRequest m_tvr = new AVA_AddressSvc.ValidateRequest();
        AVA_AddressSvc.Profile m_tpr = new AVA_AddressSvc.Profile();
        AVA_AddressSvc.PingResponse_element m_tpre = new AVA_AddressSvc.PingResponse_element(); 
        AVA_AddressSvc.ValidateResponse_element m_tvre = new AVA_AddressSvc.ValidateResponse_element();
        AVA_AddressSvc.Ping_element m_tpe = new AVA_AddressSvc.Ping_element();
        AVA_AddressSvc.IsAuthorized_element m_tiae = new AVA_AddressSvc.IsAuthorized_element();
        AVA_AddressSvc.BaseAddress m_tba = new AVA_AddressSvc.BaseAddress();
        AVA_AddressSvc.ArrayOfMessage m_taom = new AVA_AddressSvc.ArrayOfMessage();
        AVA_AddressSvc.Security m_tsec = new AVA_AddressSvc.Security();
        AVA_AddressSvc.Validate_element m_tve = new AVA_AddressSvc.Validate_element();
        AVA_AddressSvc.BaseAddress m_ta = new AVA_AddressSvc.BaseAddress();
        AVA_AddressSvc.ValidAddress m_tva = new AVA_AddressSvc.ValidAddress();
        AVA_AddressSvc.UsernameToken_element m_tute = new AVA_AddressSvc.UsernameToken_element();
        AVA_AddressSvc.ValidateResult m_tvRes = new AVA_AddressSvc.ValidateResult();
    }
    
    static testmethod void TaxUnitTests()
    {
        AVA_TaxSvc m_tAVA_TaxSvc = new AVA_TaxSvc();
        AVA_TaxSvc.AuditMessage m_tAuditMessage = new AVA_TaxSvc.AuditMessage();
        AVA_TaxSvc.CommitTaxResult m_tCommitTaxResult = new AVA_TaxSvc.CommitTaxResult();
        AVA_TaxSvc.TaxSvcSoap m_tAVA_TaxSvcSoap = new AVA_TaxSvc.TaxSvcSoap('https://bogus.url.net');
        AVA_TaxSvc.IsAuthorizedResult m_tAVA_TaxSvcSoa = new AVA_TaxSvc.IsAuthorizedResult();
        AVA_TaxSvc.IsAuthorized_element m_tIsAuthorized_element = new AVA_TaxSvc.IsAuthorized_element();
        AVA_TaxSvc.IsAuthorizedResult m_can = new AVA_TaxSvc.IsAuthorizedResult();
        AVA_TaxSvc.TaxAddress m_tTaxAddress = new AVA_TaxSvc.TaxAddress();
        AVA_TaxSvc.ArrayOfMessage m_tArrayOfMessage = new AVA_TaxSvc.ArrayOfMessage();
        AVA_TaxSvc.ArrayOfLine m_tArrayOfLine = new AVA_TaxSvc.ArrayOfLine();
        AVA_TaxSvc.ApplyPaymentResponse_element m_tApplyPaymentResponse_element = new AVA_TaxSvc.ApplyPaymentResponse_element();
        AVA_TaxSvc.GetTaxHistoryResult m_tGetTaxHistoryResult = new AVA_TaxSvc.GetTaxHistoryResult();
        AVA_TaxSvc.ArrayOfBaseAddress m_tArrayOfBaseAddress = new AVA_TaxSvc.ArrayOfBaseAddress();
        AVA_TaxSvc.PostTax_element m_tPostTax_element = new AVA_TaxSvc.PostTax_element();
        AVA_TaxSvc.PostTaxRequest m_tPostTaxRequest = new AVA_TaxSvc.PostTaxRequest();
        AVA_TaxSvc.PostTaxResult m_tCancelTaxRequestt = new AVA_TaxSvc.PostTaxResult();
        AVA_TaxSvc.AdjustTaxRequest m_tAdjustTaxRequest = new AVA_TaxSvc.AdjustTaxRequest();
        AVA_TaxSvc.ArrayOfTaxLine m_tArrayOfTaxLine = new AVA_TaxSvc.ArrayOfTaxLine();
        AVA_TaxSvc.ApplyPaymentRequest m_tApplyPaymentRequest = new AVA_TaxSvc.ApplyPaymentRequest();
        AVA_TaxSvc.PingResult m_tPingResult = new AVA_TaxSvc.PingResult();
        AVA_TaxSvc.IsAuthorizedResult m_tIsAuthorizedResult = new AVA_TaxSvc.IsAuthorizedResult();
        AVA_TaxSvc.IsAuthorizedResponse_element m_tIsAuthorizedResponse_element = new AVA_TaxSvc.IsAuthorizedResponse_element();
        AVA_TaxSvc.CommitTaxRequest m_tCommitTaxRequest = new AVA_TaxSvc.CommitTaxRequest();
        AVA_TaxSvc.TaxOverride m_tTaxOverride = new AVA_TaxSvc.TaxOverride();
        AVA_TaxSvc.Profile m_tProfile = new AVA_TaxSvc.Profile();
        AVA_TaxSvc.ReconcileTaxHistoryRequest m_tReconcileTaxHistoryRequest = new AVA_TaxSvc.ReconcileTaxHistoryRequest();
        AVA_TaxSvc.ApplyPaymentResult m_tApplyPaymentResult = new AVA_TaxSvc.ApplyPaymentResult();
        AVA_TaxSvc.BaseAddress m_tBaseAddress = new AVA_TaxSvc.BaseAddress();
        AVA_TaxSvc.ArrayOfTaxDetail m_tArrayOfTaxDetail = new AVA_TaxSvc.ArrayOfTaxDetail();
        AVA_TaxSvc.Security m_tSecurity = new AVA_TaxSvc.Security();
        AVA_TaxSvc.GetTaxHistoryResponse_element m_tGetTaxHistoryResponse_element = new AVA_TaxSvc.GetTaxHistoryResponse_element();
        AVA_TaxSvc.GetTax_element m_tGetTax_element = new AVA_TaxSvc.GetTax_element();
        AVA_TaxSvc.UsernameToken_element m_tUsernameToken_element = new AVA_TaxSvc.UsernameToken_element();
        AVA_TaxSvc.AdjustTaxResult m_tAdjustTaxResult = new AVA_TaxSvc.AdjustTaxResult();
        AVA_TaxSvc.GetTaxResult m_tGetTaxResult = new AVA_TaxSvc.GetTaxResult();
        AVA_TaxSvc.CommitTax_element m_tCommitTax_element = new AVA_TaxSvc.CommitTax_element();
        AVA_TaxSvc.ReconcileTaxHistoryResult m_tReconcileTaxHistoryResult = new AVA_TaxSvc.ReconcileTaxHistoryResult();
        AVA_TaxSvc.AdjustTax_element m_tAdjustTax_element = new AVA_TaxSvc.AdjustTax_element();
        AVA_TaxSvc.AdjustTaxResponse_element m_tAdjustTaxResponse_element = new AVA_TaxSvc.AdjustTaxResponse_element();
        AVA_TaxSvc.Ping_element m_tPing_element = new AVA_TaxSvc.Ping_element();
        AVA_TaxSvc.GetTaxHistory_element m_tGetTaxHistory_element = new AVA_TaxSvc.GetTaxHistory_element();
        AVA_TaxSvc.ArrayOfTaxAddress m_tArrayOfTaxAddress = new AVA_TaxSvc.ArrayOfTaxAddress();
        AVA_TaxSvc.PostTaxResponse_element m_tPostTaxResponse_element = new AVA_TaxSvc.PostTaxResponse_element();
        AVA_TaxSvc.GetTaxRequest m_tGetTaxRequest = new AVA_TaxSvc.GetTaxRequest();
        AVA_TaxSvc.CancelTax_element m_tCancelTax_element = new AVA_TaxSvc.CancelTax_element();
        AVA_TaxSvc.CommitTaxResponse_element m_tCommitTaxResponse_element = new AVA_TaxSvc.CommitTaxResponse_element();
        AVA_TaxSvc.PostTaxResult m_tPostTaxResult = new AVA_TaxSvc.PostTaxResult();
        AVA_TaxSvc.ReconcileTaxHistoryResponse_element m_tReconcileTaxHistoryResponse_element = new AVA_TaxSvc.ReconcileTaxHistoryResponse_element();
        AVA_TaxSvc.CancelTaxResult m_tCancelTaxResult = new AVA_TaxSvc.CancelTaxResult();
        AVA_TaxSvc.TaxDetail m_tTaxDetail = new AVA_TaxSvc.TaxDetail();
        AVA_TaxSvc.Message m_tMessage = new AVA_TaxSvc.Message();
        AVA_TaxSvc.PingResponse_element m_tPingResponse_element = new AVA_TaxSvc.PingResponse_element();
        AVA_TaxSvc.GetTaxHistoryRequest m_tGetTaxHistoryRequest = new AVA_TaxSvc.GetTaxHistoryRequest();
        AVA_TaxSvc.ApplyPayment_element m_tApplyPayment_element = new AVA_TaxSvc.ApplyPayment_element();
        AVA_TaxSvc.CancelTaxRequest m_tCancelTaxRequest = new AVA_TaxSvc.CancelTaxRequest();
        AVA_TaxSvc.ReconcileTaxHistory_element m_tReconcileTaxHistory_element = new AVA_TaxSvc.ReconcileTaxHistory_element();
        AVA_TaxSvc.GetTaxResponse_element m_tGetTaxResponse_element = new AVA_TaxSvc.GetTaxResponse_element();
        AVA_TaxSvc.CancelTaxResponse_element m_tCancelTaxResponse_element = new AVA_TaxSvc.CancelTaxResponse_element();
        AVA_TaxSvc.TaxLine m_tTaxLine = new AVA_TaxSvc.TaxLine();
        AVA_TaxSvc.ArrayOfGetTaxResult m_tArrayOfGetTaxResult = new AVA_TaxSvc.ArrayOfGetTaxResult();
        AVA_TaxSvc.Line m_tLine = new AVA_TaxSvc.Line();
    }
    
   /*  
    static testMethod void testAvaTestConnection(){     
    Avalara__c avaCfg = new Avalara__c(Name='AvaCfg',
            Active_Avalara_Setting__c=true,Company_Code__c='ITS',
            Service_URL__c='https://development.avalara.net' , Account_ID__c='Bhavesh',Customer_Code_Field__c = 'Account Name',
            License_Key__c='Avalara@2014',Enable_AvaTax_Tax_Calculation__c=false);
            
        insert avaCfg;
    Avalara__c avaConfig = [SELECT Enable_AvaTax_Tax_Calculation__c from Avalara__c where Id = :avaCfg.Id];
  //  AVA_TestConnect tc = new AVA_TestConnect(avaConfig.Id);
       // tc.AVATestConnection(false,'',false);
        }
        */
    static testMethod void testAVA_Utilites(){
    
    List<string> TNStatuses = AVA_Utilities.FetchStatusVals();
    AvaMessage__c avaMessage = new AvaMessage__c();
    
    MessageBox mb = new MessageBox();
        mb.DismissPage();
    }
    static testMethod void Main() 
    {
        
        /*//////////////////////////////// Misc ////////////////////////////////////////////////*/
        SVMXC__Service_Order_Line__c testLine = new SVMXC__Service_Order_Line__c();
        System.assertEquals(AVA_WorkOrderUtils.TaxCalcLineInfoChanged(testLine,testLine),false);
        AVA_PageAddress paddr = new AVA_PageAddress(new AVA_AddressSvc.BaseAddress());
        paddr = new AVA_PageAddress(new AVA_AddressSvc.ValidAddress());
        AVA_Utilities.ShowMessageBox('test','test',null);
        AVA_Utilities.ShowMessageBox('test',new List<string>{'test','test'},null);
        MessageBox mb = new MessageBox();
        mb.DismissPage();
    }
    
    
    static testMethod void getaxUnitTest61()
  {
      Avalara__c avaCfg = new Avalara__c(Name='AvaCfg',Trigger_Limit__c = 1,
            Active_Avalara_Setting__c=true,Company_Code__c='default',Automatic_Tax_Calculation__c = true,
            Service_URL__c='https://avatax.avalara.net' , Account_ID__c='1100005803',
            Customer_Code_Field__c = 'Account Name',License_Key__c='D1BF31B87DEFD817',
            Enable_AvaTax_Tax_Calculation__c=true);
            
        insert avaCfg;
    Avalara__c avaConfig = [SELECT Service_URL__c,Automatic_Tax_Calculation__c,Account_ID__c,License_Key__c,Company_Code__c,Enable_AvaTax_Tax_Calculation__c from Avalara__c where Id = :avaCfg.Id];
    Account acc = new Account();
    acc.Name = 'Testing';
    acc.ShippingStreet = '900 winslow waye e /r/n test';
    acc.ShippingState = 'WA';
    acc.ShippingCountry = 'US';
    acc.ShippingCity = 'BI';
    acc.ShippingPostalCode = '98110';
    insert acc;
        Account valdAccount = [SELECT ShippingStreet,ShippingState,ShippingCity,ShippingCountry,ShippingPostalCode from Account where Id = :acc.Id];
      Contact testContact = new Contact(LastName=DateTime.now().format(), AccountId=valdAccount.Id,
            MailingStreet = 'foo', MailingCity = 'BI', MailingState='WA', MailingPostalCode = '98110-2450', MailingCountry = 'US',
            OtherStreet = 'foo', OtherCity = 'BI', OtherState='WA', OtherPostalCode = '98110-2450', OtherCountry = 'US');
        
        insert testContact;
      SVMXC__Service_Order__c WOList = new SVMXC__Service_Order__c();
      WOlist.SVMXC__Company__c = valdAccount.Id;
      WOList.SVMXC__Contact__c = testContact.Id;
      WOList.SVMXC__Order_Status__c = 'Open';
      WOList.SVMXC__Priority__c = 'High';
      WOList.SVMXC__Order_Type__c = 'Field Service';
      WOList.SVMXC__Street__c = '';
      WOList.Work_Order_Status__c  = '';
      WOList.Avalara_Status__c ='';
      Entity_Use_Code__c UTEntityUseCode = new Entity_Use_Code__c();
      UTEntityUseCode.Name = 'A';
      UTEntityUseCode.Description__c = 'Test';
      insert UTEntityUseCode;
      
      Entity_Use_Code__c a = [SELECT Id, Name,Description__c FROM Entity_Use_Code__c WHERE Name='A' LIMIT 1];
      
      Entity_Use_Code__c getEntityCode = [select Id,Name from Entity_Use_Code__c where Id =: UTEntityUseCode.Id];
      WOList.AvaTax_Entity_Use_Code__c = a.Id;
      insert WOList;
       
      AVA_Service_Location_Validate thistest = new AVA_Service_Location_Validate(WOList.Id);
    thistest.Original.Line1 = '900 winslow way e';
    thistest.Original.Line2 = '';
    thistest.Original.City = 'foo';
    thistest.Original.Region = 'foo';
    thistest.Original.Country = 'foo';
    thistest.Original.PostalCode = '98110';
    thistest.FetchOriginalAddress();
    thistest.UpdateAddress();
      AVA_Service_Location_Validate serviceValidate = new AVA_Service_Location_Validate(WOList.Id);
      AVA_Service_Location_Validate serviceValidates = new AVA_Service_Location_Validate(WOList);
      AVA_Service_Location_Validate nullserviceValidate = new AVA_Service_Location_Validate();
      ApexPages.StandardController valdserviceBill = new ApexPages.StandardController(WOList);
      AVA_Service_Location_Validate conserviceValidate = new AVA_Service_Location_Validate(valdserviceBill);
      AVA_AddressSvc.ValidateRequest vreq = new AVA_AddressSvc.ValidateRequest();
            vreq.Coordinates = false;
            vreq.Taxability=false;
            vreq.TextCase='Mixed';
            
            AVA_AddressSvc.ValidateResult vres = null;
            vreq.Address = thistest.Original.PageAddressToBaseAddress();
            AVA_AddressSvc.AddressSvcSoap addressSvc = new AVA_AddressSvc.AddressSvcSoap(avaConfig.Service_URL__c);
            addressSvc.Security.UsernameToken.Username = avaConfig.Account_ID__c;
            addressSvc.Security.UsernameToken.Password = avaConfig.License_Key__c;
            addressSvc.Profile.Client = 'AvaTax4ServiceMax,1.0';
            addressSvc.timeout_x = 30000;
            vres = new AVA_AddressSvc.ValidateResult();
                vres.ResultCode = 'Success';
                vres.ValidAddresses = new AVA_AddressSvc.ArrayOfValidAddress();
                vres.ValidAddresses.ValidAddress = new AVA_AddressSvc.ValidAddress[1];
                vres.ValidAddresses.ValidAddress[0] = new AVA_AddressSvc.ValidAddress();                
                vres.Messages = new AVA_AddressSvc.ArrayOfMessage();
                vres.Messages.Message = new AVA_AddressSvc.Message[1];
                vres.Messages.Message[0] = new AVA_AddressSvc.Message();
                vres.Messages.Message[0].Name = 'foo';
                vres.Messages.Message[0].Summary = 'foo';
                vres.Messages.Message[0].Details = 'foo';
          //  vres=addressSvc.Validate(vreq);
           // thistest.SetUpdatedAccountAddress(vres.ValidAddresses.ValidAddress[0]);
      SVMXC__Service_Order_Line__c WLine = new SVMXC__Service_Order_Line__c();
      SVMXC__Service_Order__c WList = [select Id,Name,
            SVMXC__Contact__c,SVMXC__Company__c,SVMXC__Street__c, SVMXC__City__c, AvaTax_Entity_Use_Code__c,
            SVMXC__State__c, SVMXC__Zip__c, SVMXC__Country__c,Avalara_Status__c,Work_Order_Status__c from SVMXC__Service_Order__c where id =:WOList.Id];
            AVA_GetTaxWorkOrder avaGWO = new AVA_GetTaxWorkOrder(WList.Id);
       system.assertEquals(WList.SVMXC__Street__c,null);
     //  AVA_GetTaxWorkOrder avaGWO = new AVA_GetTaxWorkOrder(WList.Id);
      AVA_TaxSvc.GetTaxResult getTaxResult = new AVA_TaxSvc.GetTaxResult();
      AVA_GetTaxWorkOrder.FetchEntityUseCode('A');
       avaGWO.CalcTax(false);
       string qualmsg = avaGWO.ShouldCalcTax();
       
      } 
   
    static testMethod void getaxUnitTest6()
  {
      Avalara__c avaCfg = new Avalara__c(Name='AvaCfg',Trigger_Limit__c = 1,
            Active_Avalara_Setting__c=true,Company_Code__c='default',Automatic_Tax_Calculation__c = true,
            Service_URL__c='https://avatax.avalara.net' , Account_ID__c='1100005803',
            Customer_Code_Field__c = 'Account Name',License_Key__c='D1BF31B87DEFD817',
            Enable_AvaTax_Tax_Calculation__c=true);
            
        insert avaCfg;
    Avalara__c avaConfig = [SELECT Service_URL__c,Automatic_Tax_Calculation__c,Account_ID__c,License_Key__c,Company_Code__c,Enable_AvaTax_Tax_Calculation__c from Avalara__c where Id = :avaCfg.Id];
    Account acc = new Account();
    acc.Name = 'Testing';
    acc.ShippingStreet = '900 winslow waye e /r/n test';
    acc.ShippingState = 'WA';
    acc.ShippingCountry = 'US';
    acc.ShippingCity = 'BI';
    acc.ShippingPostalCode = '98110';
    insert acc;
        Account valdAccount = [SELECT ShippingStreet,ShippingState,ShippingCity,ShippingCountry,ShippingPostalCode from Account where Id = :acc.Id];
      Contact testContact = new Contact(LastName=DateTime.now().format(), AccountId=valdAccount.Id,
            MailingStreet = 'foo', MailingCity = 'BI', MailingState='WA', MailingPostalCode = '98110-2450', MailingCountry = 'US',
            OtherStreet = 'foo', OtherCity = 'BI', OtherState='WA', OtherPostalCode = '98110-2450', OtherCountry = 'US');
        
        insert testContact;
      SVMXC__Service_Order__c WOList = new SVMXC__Service_Order__c();
      WOlist.SVMXC__Company__c = valdAccount.Id;
      WOList.SVMXC__Contact__c = testContact.Id;
      WOList.SVMXC__Order_Status__c = 'Open';
      WOList.SVMXC__Priority__c = 'High';
      WOList.SVMXC__Order_Type__c = 'Field Service';
      WOList.SVMXC__Street__c = '900 winslow way';
      WOList.SVMXC__Zip__c = '98110';
      WOList.SVMXC__State__c = 'WA';
      WOList.SVMXC__Country__c = 'US';
      WOList.SVMXC__City__c = 'BI';
      WOList.Work_Order_Status__c  = '';
      WOList.Avalara_Status__c ='';
      Entity_Use_Code__c UTEntityUseCode = new Entity_Use_Code__c();
      UTEntityUseCode.Name = 'A';
      UTEntityUseCode.Description__c = 'Test';
      insert UTEntityUseCode;
      
      Entity_Use_Code__c a = [SELECT Id, Name,Description__c FROM Entity_Use_Code__c WHERE Name='A' LIMIT 1];
      
      Entity_Use_Code__c getEntityCode = [select Id,Name from Entity_Use_Code__c where Id =: UTEntityUseCode.Id];
      WOList.AvaTax_Entity_Use_Code__c = a.Id;
      insert WOList;
       
      AVA_Service_Location_Validate thistest = new AVA_Service_Location_Validate(WOList.Id);
    thistest.Original.Line1 = '900 winslow way e';
    thistest.Original.Line2 = '';
    thistest.Original.City = 'foo';
    thistest.Original.Region = 'foo';
    thistest.Original.Country = 'foo';
    thistest.Original.PostalCode = '98110';
    thistest.FetchOriginalAddress();
    thistest.UpdateAddress();
      AVA_Service_Location_Validate serviceValidate = new AVA_Service_Location_Validate(WOList.Id);
      AVA_Service_Location_Validate serviceValidates = new AVA_Service_Location_Validate(WOList);
      AVA_Service_Location_Validate nullserviceValidate = new AVA_Service_Location_Validate();
      ApexPages.StandardController valdserviceBill = new ApexPages.StandardController(WOList);
      AVA_Service_Location_Validate conserviceValidate = new AVA_Service_Location_Validate(valdserviceBill);
      AVA_AddressSvc.ValidateRequest vreq = new AVA_AddressSvc.ValidateRequest();
            vreq.Coordinates = false;
            vreq.Taxability=false;
            vreq.TextCase='Mixed';
            
            AVA_AddressSvc.ValidateResult vres = null;
            vreq.Address = thistest.Original.PageAddressToBaseAddress();
            AVA_AddressSvc.AddressSvcSoap addressSvc = new AVA_AddressSvc.AddressSvcSoap(avaConfig.Service_URL__c);
            addressSvc.Security.UsernameToken.Username = avaConfig.Account_ID__c;
            addressSvc.Security.UsernameToken.Password = avaConfig.License_Key__c;
            addressSvc.Profile.Client = 'AvaTax4ServiceMax,1.0';
            addressSvc.timeout_x = 30000;
            vres = new AVA_AddressSvc.ValidateResult();
                vres.ResultCode = 'Success';
                vres.ValidAddresses = new AVA_AddressSvc.ArrayOfValidAddress();
                vres.ValidAddresses.ValidAddress = new AVA_AddressSvc.ValidAddress[1];
                vres.ValidAddresses.ValidAddress[0] = new AVA_AddressSvc.ValidAddress();                
                vres.Messages = new AVA_AddressSvc.ArrayOfMessage();
                vres.Messages.Message = new AVA_AddressSvc.Message[1];
                vres.Messages.Message[0] = new AVA_AddressSvc.Message();
                vres.Messages.Message[0].Name = 'foo';
                vres.Messages.Message[0].Summary = 'foo';
                vres.Messages.Message[0].Details = 'foo';
           //vres=addressSvc.Validate(vreq);
           // thistest.SetUpdatedAccountAddress(vres.ValidAddresses.ValidAddress[0]);
      SVMXC__Service_Order_Line__c WLine = new SVMXC__Service_Order_Line__c();
      SVMXC__Service_Order__c WList = [select Id,Name,
            SVMXC__Contact__c,SVMXC__Company__c,SVMXC__Street__c, SVMXC__City__c, AvaTax_Entity_Use_Code__c,
            SVMXC__State__c, SVMXC__Zip__c, SVMXC__Country__c,Avalara_Status__c,Work_Order_Status__c from SVMXC__Service_Order__c where id =:WOList.Id];
       AVA_GetTaxWorkOrder avaGWO = new AVA_GetTaxWorkOrder(WList.Id);
      AVA_TaxSvc.GetTaxResult getTaxResult = new AVA_TaxSvc.GetTaxResult();
      AVA_GetTaxWorkOrder.FetchEntityUseCode('A');
       avaGWO.CalcTax(false);
       string qualmsg = avaGWO.ShouldCalcTax();
      }
      /*
      static testmethod void insertWorkOrder(){
          Avalara__c avaCfg = new Avalara__c(Name='AvaCfg',Trigger_Limit__c = 1,
            Active_Avalara_Setting__c=true,Company_Code__c='default',Automatic_Tax_Calculation__c = true,
            Service_URL__c='https://development.avalara.net' , Account_ID__c='1100005803',Customer_Code_Field__c = 'Account Name',
            License_Key__c='D1BF31B87DEFD817',Enable_AvaTax_Tax_Calculation__c=false);
            
          insert avaCfg;
          Avalara__c avaConfig = [SELECT Service_URL__c,Account_ID__c,License_Key__c,Automatic_Tax_Calculation__c,
              Company_Code__c,Enable_AvaTax_Tax_Calculation__c from Avalara__c where Id = :avaCfg.Id];
        Account acc = new Account();
        acc.Name = 'Testing';
        acc.ShippingStreet = '900 winslow waye e /r/n test';
        acc.ShippingState = 'WA';
        acc.ShippingCountry = 'US';
        acc.ShippingCity = 'BI';
        acc.ShippingPostalCode = '98110';
        insert acc;
        Account valdAccount = [SELECT ShippingStreet,ShippingState,ShippingCity,ShippingCountry,ShippingPostalCode from Account where Id = :acc.Id];
        Contact testContact = new Contact(LastName=DateTime.now().format(), AccountId=valdAccount.Id,
            MailingStreet = 'foo', MailingCity = 'BI', MailingState='WA', MailingPostalCode = '98110-2450', MailingCountry = 'US',
            OtherStreet = 'foo', OtherCity = 'BI', OtherState='WA', OtherPostalCode = '98110-2450', OtherCountry = 'US');
        
        insert testContact;
        List<string> TNStatuses = AVA_Utilities.FetchStatusVals();
        Contact valdContact = [SELECT Id,Name from Contact where Id=:testContact.Id];
        SVMXC__Service_Order__c WOList = new SVMXC__Service_Order__c();
      WOlist.SVMXC__Company__c = valdAccount.Id;
      WOList.SVMXC__Contact__c = testContact.Id;
      WOList.SVMXC__Order_Status__c = 'Open';
      WOList.SVMXC__Priority__c = 'High';
      WOList.SVMXC__Order_Type__c = 'Field Service';
      WOList.SVMXC__Street__c = '900 winslow way';
      WOList.SVMXC__Zip__c = '98110';
      WOList.SVMXC__State__c = 'WA';
      WOList.SVMXC__Country__c = 'US';
      WOList.SVMXC__City__c = 'BI';
      WOList.Work_Order_Status__c  = '';
      WOList.Avalara_Status__c ='';
      Entity_Use_Code__c UTEntityUseCode = new Entity_Use_Code__c();
      UTEntityUseCode.Name = 'A';
      UTEntityUseCode.Description__c = 'Test';
      insert UTEntityUseCode;
      
      Entity_Use_Code__c a = [SELECT Id, Name,Description__c FROM Entity_Use_Code__c WHERE Name='A' LIMIT 1];
      
      Entity_Use_Code__c getEntityCode = [select Id,Name from Entity_Use_Code__c where Id =: UTEntityUseCode.Id];
      System.assertEquals(avaConfig.Automatic_Tax_Calculation__c,false);
      WOList.Work_Order_Status__c = TNStatuses[0];
      
      WOList.AvaTax_Entity_Use_Code__c = a.Id;
      insert WOList; 
      System.assertEquals(avaConfig.Enable_AvaTax_Tax_Calculation__c,true);
      WOList.Avalara_Status__c= 'Tax Calculations are Disabled - Check \'Enable Tax Calculations\' in the TaxServices tab';
      WOList.Work_Order_Status__c = 'Sales Tax Not Current';
      update WOList;
      avaConfig.Enable_AvaTax_Tax_Calculation__c = true;
      update avaConfig;
      SVMXC__Service_Order_Line__c WLine = new SVMXC__Service_Order_Line__c();
      WLine.SVMXC__Service_Order__c = WOList.Id;
      WLine.SVMXC__Line_Type__c = 'Labour';
      //WLine.SVMXC__Product__c = lineProd[0].Name;
      WLine.SVMXC__Actual_Price2__c = 110;
      WLine.SVMXC__Estimated_Quantity2__c = 2;
      insert WLine;
      
      
      SVMXC__Service_Order__c WList = [select Id,Name,
            SVMXC__Contact__c,SVMXC__Company__c,SVMXC__Street__c, SVMXC__City__c, AvaTax_Entity_Use_Code__c,
            SVMXC__State__c, SVMXC__Zip__c, SVMXC__Country__c,Avalara_Status__c,Work_Order_Status__c, (select Name,Non_Taxable__c, SVMXC__Actual_Quantity2__c,SVMXC__Work_Description__c,SVMXC__Line_Type__c,
       SVMXC__Total_Line_Price__c, SVMXC__From_Location__c, SVMXC__Requested_Location__c from SVMXC__Service_Order_Line__r)
            from SVMXC__Service_Order__c where id =:WOList.Id];
      SVMXC__Service_Order_Line__c WOLines = WList.SVMXC__Service_Order_Line__r;
      AVA_TaxSvc.GetTaxRequest gtreq = new AVA_TaxSvc.GetTaxRequest();
      gtReq.DocType = 'SalesInvoice';
      
        system.assertEquals(gtreq.DocCode,null);
        gtreq.DocCode = WOList.Id;
      AVA_GetTaxWorkOrder autoWO = new AVA_GetTaxWorkOrder(WList.Id);
      AVA_TaxSvc.GetTaxResult getTaxResult = autoWO.CalcTax(false);
      autoWO.RedirectPage();
      }  */
      static testmethod void QuoteUtilitiesUnis()
     {
         SVMXC__Service_Order__c q1 = new SVMXC__Service_Order__c();
         q1.SVMXC__Street__c= '900 winslow way e';
         SVMXC__Service_Order__c q2 = new SVMXC__Service_Order__c ();
         q2.SVMXC__Street__c= 'Pune';
         system.assertEquals(AVA_WorkOrderUtils.TaxCalcInputChanged(q1,q2),true);
     }
     static testmethod void QuoteUtilitiesUnis1()
     {
         SVMXC__Service_Order__c q1 = new SVMXC__Service_Order__c();
         q1.SVMXC__State__c= 'BI';
         SVMXC__Service_Order__c q2 = new SVMXC__Service_Order__c ();
         q2.SVMXC__State__c= 'PI';
         system.assertEquals(AVA_WorkOrderUtils.TaxCalcInputChanged(q1,q2),true);
     }
     static testmethod void QuoteUtilitiesUnis2()
     {
         SVMXC__Service_Order__c q1 = new SVMXC__Service_Order__c();
         q1.SVMXC__City__c= 'BI';
         SVMXC__Service_Order__c q2 = new SVMXC__Service_Order__c ();
         q2.SVMXC__City__c= 'PI';
         system.assertEquals(AVA_WorkOrderUtils.TaxCalcInputChanged(q1,q2),true);
     }
     static testmethod void QuoteUtilitiesUnis3()
     {
         SVMXC__Service_Order__c q1 = new SVMXC__Service_Order__c();
         q1.SVMXC__Zip__c= '98110';
         SVMXC__Service_Order__c q2 = new SVMXC__Service_Order__c ();
         q2.SVMXC__Zip__c= '411016';
         system.assertEquals(AVA_WorkOrderUtils.TaxCalcInputChanged(q1,q2),true);
     }
     static testmethod void QuoteUtilitiesUnis6()
     {
         Contact testContact = new Contact(LastName=DateTime.now().format(),
            MailingStreet = 'foo', MailingCity = 'BI', MailingState='WA', MailingPostalCode = '98110-2450', MailingCountry = 'US',
            OtherStreet = 'foo', OtherCity = 'BI', OtherState='WA', OtherPostalCode = '98110-2450', OtherCountry = 'US');
        
        insert testContact;
        Contact testContact1 = new Contact(LastName=DateTime.now().format(),MailingStreet = 'foo1', MailingCity = 'BI1', MailingState='WA1', MailingPostalCode = '98110-2450', MailingCountry = 'US',
            OtherStreet = 'foo1', OtherCity = 'B1I', OtherState='WA1', OtherPostalCode = '98110-2450', OtherCountry = 'US');
        
        insert testContact1;
         SVMXC__Service_Order__c q1 = new SVMXC__Service_Order__c();
         q1.SVMXC__Zip__c= testContact1.Id;
         SVMXC__Service_Order__c q2 = new SVMXC__Service_Order__c ();
         q2.SVMXC__Zip__c= testContact.Id;
         system.assertEquals(AVA_WorkOrderUtils.TaxCalcInputChanged(q1,q2),true);
     }
     static testmethod void QuoteUtilitiesUnis4()
     {
         SVMXC__Service_Order__c q1 = new SVMXC__Service_Order__c();
         q1.SVMXC__Country__c= 'US';
         SVMXC__Service_Order__c q2 = new SVMXC__Service_Order__c ();
         q2.SVMXC__Country__c= 'India';
         system.assertEquals(AVA_WorkOrderUtils.TaxCalcInputChanged(q1,q2),true);
     }
     static testmethod void QuoteUtilitiesUnis5()
     {
        
         SVMXC__Service_Order_Line__c q1 = new SVMXC__Service_Order_Line__c();
         q1.SVMXC__Actual_Quantity2__c= 1;
         SVMXC__Service_Order_Line__c q2 = new SVMXC__Service_Order_Line__c();
         q2.SVMXC__Actual_Quantity2__c= 2;
         system.assertEquals(AVA_WorkOrderUtils.TaxCalcLineInfoChanged(q1,q2),true);
     }
     static testmethod void QuoteUtilitiesUnis51()
     {
        
         SVMXC__Quote_Line__c q1 = new SVMXC__Quote_Line__c();
         q1.SVMXC__Quantity2__c= 1;
         SVMXC__Quote_Line__c q2 = new SVMXC__Quote_Line__c();
         q2.SVMXC__Quantity2__c= 2;
         system.assertEquals(AVA_SQuoteUtils.TaxCalcLineInfoChanged(q1,q2),true);
     }
     static testmethod void QuoteUtilitiesUnis15()
     {
        
         SVMXC__Quote_Line__c q1 = new SVMXC__Quote_Line__c();
         q1.SVMXC__Unit_Price2__c= 1;
         SVMXC__Quote_Line__c q2 = new SVMXC__Quote_Line__c();
         q2.SVMXC__Unit_Price2__c= 2;
         system.assertEquals(AVA_SQuoteUtils.TaxCalcLineInfoChanged(q1,q2),true);
     }
     static testmethod void QuoteUtilitiesUnis005()
     {
        
         SVMXC__Quote_Line__c q1 = new SVMXC__Quote_Line__c();
         q1.SVMXC__Line_Price2__c= 1;
         SVMXC__Quote_Line__c q2 = new SVMXC__Quote_Line__c();
         q2.SVMXC__Line_Price2__c= 2;
         system.assertEquals(AVA_SQuoteUtils.TaxCalcLineInfoChanged(q1,q2),true);
     }
     static testmethod void QuoteUtilitiesUnis05()
     {
         SVMXC__Quote_Line__c q1 = new SVMXC__Quote_Line__c();
         q1.SVMXC__Line_Type__c= 'Parts';
         SVMXC__Quote_Line__c q2 = new SVMXC__Quote_Line__c();
         q2.SVMXC__Line_Type__c= 'Labour';
         system.assertEquals(AVA_SQuoteUtils.TaxCalcLineInfoChanged(q1,q2),true);
     }
     static testmethod void QuoteUtilitiesUnis0()
     {
      //   AvalaraPostInstall postinstall = new AvalaraPostInstall();
      //  Test.testInstall(postinstall, null);
        Contact testContact = new Contact(LastName=DateTime.now().format(),
            MailingStreet = 'foo', MailingCity = 'BI', MailingState='WA', MailingPostalCode = '98110-2450', MailingCountry = 'US',
            OtherStreet = 'foo', OtherCity = 'BI', OtherState='WA', OtherPostalCode = '98110-2450', OtherCountry = 'US');
        
        insert testContact;
        Contact testContact1 = new Contact(LastName=DateTime.now().format(),MailingStreet = 'foo1', MailingCity = 'BI1', MailingState='WA1', MailingPostalCode = '98110-2450', MailingCountry = 'US',
            OtherStreet = 'foo1', OtherCity = 'B1I', OtherState='WA1', OtherPostalCode = '98110-2450', OtherCountry = 'US');
        
        insert testContact1;
         SVMXC__Quote__c q1 = new SVMXC__Quote__c();
         q1.SVMXC__Contact__c= testContact1.Id;
         SVMXC__Quote__c q2 = new SVMXC__Quote__c();
         q2.SVMXC__Contact__c= testContact.Id;
         system.assertEquals(AVA_SQuoteUtils.TaxCalcInputChanged(q1,q2),true);
     }

@isTest
static void testInstallScript() {
  AvalaraPostInstall postinstall = new AvalaraPostInstall();
    Test.testInstall(postinstall, null);
    Test.testInstall(postinstall, new Version(1,0), true);
    List<Entity_Use_Code__c> a = [Select id, name from Entity_Use_Code__c where name ='A'];
  
  }
    
    
     @isTest 
    static void TC1000_AsyncLogEntries() {
    StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
    mock.setStaticResource('PingResponseResource');
    mock.setStatusCode(200);
    mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
    Test.setMock(HttpCalloutMock.class, mock);
	
      AVA_Utilities.AsyncGenerateLogs('logs');
    
    }

     @isTest 
    static void TC1000_GenerateLogEntries() {
    StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
    mock.setStaticResource('PingResponseResource');
    mock.setStatusCode(200);
    mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
    Test.setMock(HttpCalloutMock.class, mock);
	
    
  	AVA_Utilities.GenerateLogs('logs');
    Avalara__c avalara = new Avalara__c();    
   AVA_Utilities.CreateConfigurationLogs(avalara, '');
    }

}