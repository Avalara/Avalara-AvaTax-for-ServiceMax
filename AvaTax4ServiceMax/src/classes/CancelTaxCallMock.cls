@isTest
global class CancelTaxCallMock implements WebServiceMock {
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
        AVA_TaxSvc.CancelTaxResponse_element response_x= new AVA_TaxSvc.CancelTaxResponse_element();
        AVA_TaxSvc.CancelTaxResult CancelTaxResult = new AVA_TaxSvc.CancelTaxResult();
        
        response_x.CancelTaxResult = CancelTaxResult;
        response.put('response_x', response_x); 
   }
  
}