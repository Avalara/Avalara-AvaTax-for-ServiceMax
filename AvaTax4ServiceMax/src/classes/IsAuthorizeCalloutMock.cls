@isTest
global class IsAuthorizeCalloutMock implements WebServiceMock {
  global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
        // start - specify the response you want to send
        AVA_TaxSvc.IsAuthorizedResponse_element response_x= new AVA_TaxSvc.IsAuthorizedResponse_element();
        AVA_TaxSvc.IsAuthorizedResult IsAuthorizedResult = new AVA_TaxSvc.IsAuthorizedResult();
        IsAuthorizedResult.Operations = '';
        IsAuthorizedResult.ResultCode = 'Success';
        response_x.IsAuthorizedResult = IsAuthorizedResult;
        response.put('response_x', response_x); 
   }
  
}