@isTest
global class ValAddressCallMock implements WebServiceMock {
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
        AVA_AddressSvc.ValidateResponse_element response_x = new   AVA_AddressSvc.ValidateResponse_element();
      AVA_AddressSvc.ValidateResult valAddResult = new  AVA_AddressSvc.ValidateResult();
               
        response_x.ValidateResult = valAddResult;
        response.put('response_x', response_x); 
   }
  
}