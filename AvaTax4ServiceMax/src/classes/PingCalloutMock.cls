@isTest
global class PingCalloutMock implements WebServiceMock {
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
        AVA_AddressSvc.PingResponse_element response_x= new AVA_AddressSvc.PingResponse_element();
        AVA_AddressSvc.PingResult IsAuthorizedResult = new AVA_AddressSvc.PingResult();
        response_x.PingResult = IsAuthorizedResult;
        response.put('response_x', response_x); 
   }
  
}