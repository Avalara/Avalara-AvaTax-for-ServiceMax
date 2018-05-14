public class CalloutClass {
  public static HttpResponse getInfoFromExternalService() {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://webhook.logentries.com/noformat/logs/55811111-adba-46f9-9c21-53f8e5381554');
        req.setMethod('POST');
        Http h = new Http();
        req.setBody('foo');
        HttpResponse res = h.send(req);
        return res;
    }   
}