@isTest
global class ApplyPaymentCallMock implements WebServiceMock {
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
        AVA_TaxSvc.ApplyPaymentResponse_element response_x= new AVA_TaxSvc.ApplyPaymentResponse_element();
        AVA_TaxSvc.ApplyPaymentResult ApplyPaymentResult = new AVA_TaxSvc.ApplyPaymentResult();
        response_x.ApplyPaymentResult = ApplyPaymentResult;
        response.put('response_x', response_x); 
   }
  
}