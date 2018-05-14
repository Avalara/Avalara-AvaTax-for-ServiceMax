@isTest
global class GetTaxHistoryCalloutMock implements WebServiceMock {
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
        AVA_TaxSvc.GetTaxHistoryResponse_element response_x= new AVA_TaxSvc.GetTaxHistoryResponse_element();
        AVA_TaxSvc.GetTaxHistoryResult GetTaxHistoryResult = new AVA_TaxSvc.GetTaxHistoryResult();
        response_x.GetTaxHistoryResult = GetTaxHistoryResult;
        response.put('response_x', response_x); 
   }
  
}