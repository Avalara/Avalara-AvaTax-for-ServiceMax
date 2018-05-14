@isTest
global class ReconsileCallMock implements WebServiceMock {
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
        AVA_TaxSvc.ReconcileTaxHistoryResponse_element response_x= new AVA_TaxSvc.ReconcileTaxHistoryResponse_element();
        AVA_TaxSvc.ReconcileTaxHistoryResult ReconcileTaxHistoryResult = new AVA_TaxSvc.ReconcileTaxHistoryResult();
        response_x.ReconcileTaxHistoryResult = ReconcileTaxHistoryResult;
        response.put('response_x', response_x); 
   }
  
}