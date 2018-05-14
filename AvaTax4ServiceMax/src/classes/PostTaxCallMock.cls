@isTest
global class PostTaxCallMock implements WebServiceMock {
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
        AVA_TaxSvc.PostTaxResponse_element response_x= new AVA_TaxSvc.PostTaxResponse_element();
        AVA_TaxSvc.PostTaxResult PostTaxResult = new AVA_TaxSvc.PostTaxResult();
        response_x.PostTaxResult = PostTaxResult;
        response.put('response_x', response_x); 
   }
  
}