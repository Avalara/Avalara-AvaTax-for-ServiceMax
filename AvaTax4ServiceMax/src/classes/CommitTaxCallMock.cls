@isTest
global class CommitTaxCallMock implements WebServiceMock {
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
        AVA_TaxSvc.CommitTaxResponse_element response_x= new AVA_TaxSvc.CommitTaxResponse_element();
        AVA_TaxSvc.CommitTaxResult ReconcileTaxHistoryResult = new AVA_TaxSvc.CommitTaxResult();
        response_x.CommitTaxResult = ReconcileTaxHistoryResult;
        response.put('response_x', response_x); 
   }
  
}