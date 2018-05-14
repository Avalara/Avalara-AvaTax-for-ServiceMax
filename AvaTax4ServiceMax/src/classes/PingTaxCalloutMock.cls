@isTest
global class PingTaxCalloutMock implements WebServiceMock {
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
        AVA_TaxSvc.PingResponse_element response_x= new AVA_TaxSvc.PingResponse_element();
        AVA_TaxSvc.PingResult IsAuthorizedResult = new AVA_TaxSvc.PingResult();
        response_x.PingResult = IsAuthorizedResult;
        response.put('response_x', response_x); 
   }
  
}