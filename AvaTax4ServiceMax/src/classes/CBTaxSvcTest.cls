@isTest
    public class CBTaxSvcTest {

    @isTest
    public static Void TestIsAuthorize()
    {
         // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new IsAuthorizeCalloutMock());
        // Call the method that invokes a callout
    
       AVA_TaxSvc.IsAuthorizedResult oprRess = new    AVA_TaxSvc.IsAuthorizedResult();       
        	//Passing the version and header part of gettax request
            AVA_TaxSvc.TaxSvcSoap taxSvc = new AVA_TaxSvc.TaxSvcSoap('https://avatax.avalara.net');
          
            taxSvc.Security.UsernameToken.Username = '12345';
            taxSvc.Security.UsernameToken.Password = '12345';
            taxSvc.Profile.Client = 'AvaTaxForAccountingSeed 2.79||2.79';
            taxSvc.timeout_x = 30000;   // timeout 30 seconds
                 
        	oprRess = taxSvc.IsAuthorized('Ping');
        
    }
  
      
    @isTest
    public static Void TestPing()
    {
         // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new PingTaxCalloutMock());
        // Call the method that invokes a callout
    
       AVA_TaxSvc.PingResult oprRess = new    AVA_TaxSvc.PingResult();

       
        	//Passing the version and header part of gettax request
            AVA_TaxSvc.TaxSvcSoap taxSvc = new AVA_TaxSvc.TaxSvcSoap('https://avatax.avalara.net');
            taxSvc.Security.UsernameToken.Username = '12345';
            taxSvc.Security.UsernameToken.Password = '12345';
            taxSvc.Profile.Client = 'AvaTaxForAccountingSeed 2.79||2.79';
            taxSvc.timeout_x = 30000;   // timeout 30 seconds
                 
        	oprRess = taxSvc.Ping('Ping');
        AVA_TaxSvc.Message aMessage = new AVA_TaxSvc.Message();
        AVA_TaxSvc.ArrayOfMessage arrayMessage = new AVA_TaxSvc.ArrayOfMessage();
    }
        
        
            @isTest
    public static Void TestApplyPayment()
    {
         // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ApplyPaymentCallMock());
        // Call the method that invokes a callout
    
       AVA_TaxSvc.ApplyPaymentResult oprRess = new    AVA_TaxSvc.ApplyPaymentResult();

       
        	//Passing the version and header part of gettax request
            AVA_TaxSvc.TaxSvcSoap taxSvc = new AVA_TaxSvc.TaxSvcSoap('https://avatax.avalara.net');
            taxSvc.Security.UsernameToken.Username = '12345';
            taxSvc.Security.UsernameToken.Password = '12345';
            taxSvc.Profile.Client = 'AvaTaxForAccountingSeed 2.79||2.79';
            taxSvc.timeout_x = 30000;   // timeout 30 seconds
            
        AVA_TaxSvc.ApplyPaymentRequest app = new AVA_TaxSvc.ApplyPaymentRequest();
        
        	oprRess = taxSvc.ApplyPayment(app);
        
    }

            @isTest
    public static Void TestGetTaxHistory()
    {
         // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new GetTaxHistoryCalloutMock());
        // Call the method that invokes a callout
    
       AVA_TaxSvc.GetTaxHistoryResult oprRess = new    AVA_TaxSvc.GetTaxHistoryResult();

       
        	//Passing the version and header part of gettax request
            AVA_TaxSvc.TaxSvcSoap taxSvc = new AVA_TaxSvc.TaxSvcSoap('https://avatax.avalara.net');
            taxSvc.Security.UsernameToken.Username = '12345';
            taxSvc.Security.UsernameToken.Password = '12345';
            taxSvc.Profile.Client = 'AvaTaxForAccountingSeed 2.79||2.79';
            taxSvc.timeout_x = 30000;   // timeout 30 seconds
            
        AVA_TaxSvc.GetTaxHistoryRequest app = new AVA_TaxSvc.GetTaxHistoryRequest();
        
        	oprRess = taxSvc.GetTaxHistory(app);
        
    }  
        
   
        
    @isTest
    public static Void TestPostTax()
    {
         // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new PostTaxCallMock());
        // Call the method that invokes a callout
    
       AVA_TaxSvc.PostTaxResult oprRess = new    AVA_TaxSvc.PostTaxResult();

       
        	//Passing the version and header part of gettax request
            AVA_TaxSvc.TaxSvcSoap taxSvc = new AVA_TaxSvc.TaxSvcSoap('https://avatax.avalara.net');
            taxSvc.Security.UsernameToken.Username = '12345';
            taxSvc.Security.UsernameToken.Password = '12345';
            taxSvc.Profile.Client = 'AvaTaxForAccountingSeed 2.79||2.79';
            taxSvc.timeout_x = 30000;   // timeout 30 seconds
            
        AVA_TaxSvc.PostTaxRequest app = new AVA_TaxSvc.PostTaxRequest();
        
        	oprRess = taxSvc.PostTax(app);
        
    }  
        
        
    @isTest
    public static Void TestReconsileTaxHistory()
    {
         // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ReconsileCallMock());
        // Call the method that invokes a callout
    
       AVA_TaxSvc.ReconcileTaxHistoryResult oprRess = new    AVA_TaxSvc.ReconcileTaxHistoryResult();

       
        	//Passing the version and header part of gettax request
            AVA_TaxSvc.TaxSvcSoap taxSvc = new AVA_TaxSvc.TaxSvcSoap('https://avatax.avalara.net');
            taxSvc.Security = new AVA_TaxSvc.Security();
            taxSvc.Security.UsernameToken.Username = '12345';
            taxSvc.Security.UsernameToken.Password = '12345';
            taxSvc.Profile.Client = 'AvaTaxForAccountingSeed 2.79||2.79';
            taxSvc.timeout_x = 30000;   // timeout 30 seconds
            
        AVA_TaxSvc.ReconcileTaxHistoryRequest app = new AVA_TaxSvc.ReconcileTaxHistoryRequest();
        
        	oprRess = taxSvc.ReconcileTaxHistory(app);
        AVA_TaxSvc.GetTaxResponse_element getTax = new  AVA_TaxSvc.GetTaxResponse_element();
        AVA_TaxSvc.PingResponse_element pingTax = new  AVA_TaxSvc.PingResponse_element();
        AVA_TaxSvc.AdjustTaxResponse_element adjustTax = new  AVA_TaxSvc.AdjustTaxResponse_element();
        AVA_TaxSvc.TaxLine taxLine = new  AVA_TaxSvc.TaxLine();
        AVA_TaxSvc.TaxAddress taxAddress = new  AVA_TaxSvc.TaxAddress();
        AVA_TaxSvc.TaxDetail taxDetail = new  AVA_TaxSvc.TaxDetail();
        AVA_TaxSvc.Message Message = new  AVA_TaxSvc.Message();
        AVA_TaxSvc.AuditMessage AuditMessage = new  AVA_TaxSvc.AuditMessage();
        AVA_TaxSvc.ArrayOfGetTaxResult ArrayOfGetTaxResult = new  AVA_TaxSvc.ArrayOfGetTaxResult();
        AVA_TaxSvc.ArrayOfTaxAddress ArrayOfTaxAddress = new  AVA_TaxSvc.ArrayOfTaxAddress();
        AVA_TaxSvc.ArrayOfTaxDetail ArrayOfTaxDetail = new  AVA_TaxSvc.ArrayOfTaxDetail();
        AVA_TaxSvc.TaxOverride TaxOverride = new  AVA_TaxSvc.TaxOverride();
     	AVA_TaxSvc.PingResult PingResult = new  AVA_TaxSvc.PingResult();
           
    }  
     
                
    @isTest
    public static Void TestComTax()
    {
         // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new CommitTaxCallMock());
        // Call the method that invokes a callout
    
       AVA_TaxSvc.CommitTaxResult oprRess = new    AVA_TaxSvc.CommitTaxResult();

       
        	//Passing the version and header part of gettax request
            AVA_TaxSvc.TaxSvcSoap taxSvc = new AVA_TaxSvc.TaxSvcSoap('https://avatax.avalara.net');
            taxSvc.Security = new AVA_TaxSvc.Security();
            taxSvc.Security.UsernameToken.Username = '12345';
            taxSvc.Security.UsernameToken.Password = '12345';
            taxSvc.Profile.Client = 'AvaTaxForAccountingSeed 2.79||2.79';
            taxSvc.timeout_x = 30000;   // timeout 30 seconds
            
        AVA_TaxSvc.CommitTaxRequest app = new AVA_TaxSvc.CommitTaxRequest();
        
        	oprRess = taxSvc.CommitTax(app);
        
    }  
        
    @isTest
    public static Void TestCancelTax()
    {
         // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new CancelTaxCallMock());
        // Call the method that invokes a callout
    
       AVA_TaxSvc.CancelTaxResult oprRess = new    AVA_TaxSvc.CancelTaxResult();

       
        	//Passing the version and header part of gettax request
            AVA_TaxSvc.TaxSvcSoap taxSvc = new AVA_TaxSvc.TaxSvcSoap('https://avatax.avalara.net');
            taxSvc.Security = new AVA_TaxSvc.Security();
            taxSvc.Security.UsernameToken.Username = '12345';
            taxSvc.Security.UsernameToken.Password = '12345';
            taxSvc.Profile.Client = 'AvaTaxForAccountingSeed 2.79||2.79';
            taxSvc.timeout_x = 30000;   // timeout 30 seconds
            AVA_TaxSvc.CancelTaxRequest request = new AVA_TaxSvc.CancelTaxRequest();
        	
        	oprRess = taxSvc.CancelTax(request);
        
    }

}