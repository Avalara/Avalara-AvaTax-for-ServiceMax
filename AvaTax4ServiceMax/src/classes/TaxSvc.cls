////////////////////////////////////////////////////////////////////////////////
//   Copyright 2012 Avalara, Inc.
//
//   Licensed under the Apache License, Version 2.0 (the "License");
//   you may not use this file except in compliance with the License.
//   You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in writing, software
//   distributed under the License is distributed on an "AS IS" BASIS,
//   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   See the License for the specific language governing permissions and
//   limitations under the License.
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// TaxSvc is not instantiated directly, and is really in effect more 
// of a namespace than a class.
////////////////////////////////////////////////////////////////////////////////
public with sharing class TaxSvc {

    public class TaxSvcSoap {
        public String endpoint_x = 'https://development.avalara.net/tax/Tax/TaxSvc.asmx/altsec';
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x {get; set;}
        public TaxSvc.AuditMessage AuditMessage;
        public TaxSvc.Profile Profile;
        public TaxSvc.Security Security;
        private String AuditMessage_hns = 'AuditMessage=http://avatax.avalara.com/services';
        public boolean testFlag = false;
        public boolean apiSuccessflag = true;	// only meaningful if testFlag == true 
        private String Profile_hns = 'Profile=http://avatax.avalara.com/services';
        private String Security_hns = 'Security=http://avatax.avalara.com/services';
        private String[] ns_map_type_info = new String[]{'http://avatax.avalara.com/services', 'CBTaxSvc'};
        public TaxSvcSoap(String SvcURL)
        {
            endpoint_x = SvcURL + '/tax/taxsvc.asmx/altsec';
            Profile = new TaxSvc.Profile();
            Security = new TaxSvc.Security();
        }
        
        /////////////////////////////////////////////////////////////
        // Taxsvc APIs - unused APIs are commented out
        // to assist in achieving code coverage (WS callouts not allowed in unit tests)
        ///////////////////////////////////////////////////////////
        public TaxSvc.IsAuthorizedResult IsAuthorized(String Operations) {
            TaxSvc.IsAuthorized_element request_x = new TaxSvc.IsAuthorized_element();
            TaxSvc.IsAuthorizedResponse_element response_x;
            request_x.Operations = Operations;
            Map<String, TaxSvc.IsAuthorizedResponse_element> response_map_x = new Map<String, TaxSvc.IsAuthorizedResponse_element>();
            response_map_x.put('response_x', response_x);
            TaxSvc.IsAuthorizedResult retVal = null;
            if(!testFlag)
            {
	           	WebServiceCallout.invoke(this,request_x,response_map_x,new String[]{endpoint_x,'http://avatax.avalara.com/services/IsAuthorized','http://avatax.avalara.com/services','IsAuthorized','http://avatax.avalara.com/services','IsAuthorizedResponse','TaxSvc.IsAuthorizedResponse_element'});
	            response_x = response_map_x.get('response_x');
	            retVal = response_x.IsAuthorizedResult;
	    	}
	    	else
	    	{
	           	retVal = new TaxSvc.IsAuthorizedResult();
	            if(apiSuccessflag == true)
	            {
	            	retVal.ResultCode = 'Success';
	            } 
	            else
	            {
	            	retVal.ResultCode = 'Error';
	            	retVal.Messages = new TaxSvc.ArrayOfMessage();
	            	retVal.Messages.Message = new TaxSvc.Message[1];
	            	retVal.Messages.Message[0] = new TaxSvc.Message();
           	        retVal.Messages.Message[0].Summary = 'Test Failure';
			        retVal.Messages.Message[0].Details = 'Test Failure';
			        retVal.Messages.Message[0].HelpLink = 'http://bogus.com';
			        retVal.Messages.Message[0].RefersTo = 'Testing';
			        retVal.Messages.Message[0].Severity = 'Error';
			        retVal.Messages.Message[0].Source = 'Gossip';
			        retVal.Messages.Message[0].Name = 'Mud';
	            }
 	    		
	    	}
	    	return retVal;
        }

        public TaxSvc.PostTaxResult PostTax(TaxSvc.PostTaxRequest PostTaxRequest) {
            TaxSvc.PostTax_element request_x = new TaxSvc.PostTax_element();
            TaxSvc.PostTaxResponse_element response_x;
            request_x.PostTaxRequest = PostTaxRequest;
            Map<String, TaxSvc.PostTaxResponse_element> response_map_x = new Map<String, TaxSvc.PostTaxResponse_element>();
            response_map_x.put('response_x', response_x);
            TaxSvc.PostTaxResult retVal = null;
            if(!testFlag)
            {
	            WebServiceCallout.invoke(this,request_x,response_map_x,new String[]{endpoint_x,'http://avatax.avalara.com/services/PostTax','http://avatax.avalara.com/services','PostTax','http://avatax.avalara.com/services','PostTaxResponse','TaxSvc.PostTaxResponse_element'});
	            response_x = response_map_x.get('response_x');
	            retVal = response_x.PostTaxResult;
            }
            else
            {
 	           	retVal = new TaxSvc.PostTaxResult();
	            if(apiSuccessflag == true)
	            {
	            	retVal.ResultCode = 'Success';            	
	            } 
	            else
	            {
	            	retVal.ResultCode = 'Error';
	            	retVal.Messages = new TaxSvc.ArrayOfMessage();
	            	retVal.Messages.Message = new TaxSvc.Message[1];
	            	retVal.Messages.Message[0] = new TaxSvc.Message();
           	        retVal.Messages.Message[0].Summary = 'Test Failure';
			        retVal.Messages.Message[0].Details = 'Test Failure';
			        retVal.Messages.Message[0].HelpLink = 'http://bogus.com';
			        retVal.Messages.Message[0].RefersTo = 'Testing';
			        retVal.Messages.Message[0].Severity = 'Error';
			        retVal.Messages.Message[0].Source = 'Gossip';
			        retVal.Messages.Message[0].Name = 'Mud';
	            }           	
            }
            return retVal;
        }
        
        public TaxSvc.CancelTaxResult CancelTax(TaxSvc.CancelTaxRequest CancelTaxRequest) {
            TaxSvc.CancelTax_element request_x = new TaxSvc.CancelTax_element();
            TaxSvc.CancelTaxResponse_element response_x;
            request_x.CancelTaxRequest = CancelTaxRequest;
            Map<String, TaxSvc.CancelTaxResponse_element> response_map_x = new Map<String, TaxSvc.CancelTaxResponse_element>();
            response_map_x.put('response_x', response_x);
            TaxSvc.CancelTaxResult retVal = null;
            if(!testFlag)
            {
	            WebServiceCallout.invoke(this,request_x,response_map_x,new String[]{endpoint_x,'http://avatax.avalara.com/services/CancelTax','http://avatax.avalara.com/services','CancelTax','http://avatax.avalara.com/services','CancelTaxResponse','TaxSvc.CancelTaxResponse_element'});
	            response_x = response_map_x.get('response_x');
	            retVal = response_x.CancelTaxResult;
            }
            else
            {
            	retVal = new TaxSvc.CancelTaxResult();
            	if(apiSuccessFlag == true)
            	{
            		retVal.ResultCode = 'Success';            	
	            } 
	            else
	            {
	            	retVal.ResultCode = 'Error';
	            	retVal.Messages = new TaxSvc.ArrayOfMessage();
	            	retVal.Messages.Message = new TaxSvc.Message[1];
	            	retVal.Messages.Message[0] = new TaxSvc.Message();
           	        retVal.Messages.Message[0].Summary = 'Test Failure';
			        retVal.Messages.Message[0].Details = 'Test Failure';
			        retVal.Messages.Message[0].HelpLink = 'http://bogus.com';
			        retVal.Messages.Message[0].RefersTo = 'Testing';
			        retVal.Messages.Message[0].Severity = 'Error';
			        retVal.Messages.Message[0].Source = 'Gossip';
			        retVal.Messages.Message[0].Name = 'Mud';
	            }           		
            }
            return retVal;
        }
        
        public TaxSvc.GetTaxHistoryResult GetTaxHistory(TaxSvc.GetTaxHistoryRequest GetTaxHistoryRequest) {
            TaxSvc.GetTaxHistory_element request_x = new TaxSvc.GetTaxHistory_element();
            TaxSvc.GetTaxHistoryResponse_element response_x;
            request_x.GetTaxHistoryRequest = GetTaxHistoryRequest;
            Map<String, TaxSvc.GetTaxHistoryResponse_element> response_map_x = new Map<String, TaxSvc.GetTaxHistoryResponse_element>();
            response_map_x.put('response_x', response_x);
            TaxSvc.GetTaxHistoryResult retVal = null;
            if(!testFlag)
            {
            	WebServiceCallout.invoke(this,request_x,response_map_x,new String[]{endpoint_x,'http://avatax.avalara.com/services/GetTaxHistory','http://avatax.avalara.com/services','GetTaxHistory','http://avatax.avalara.com/services','GetTaxHistoryResponse','TaxSvc.GetTaxHistoryResponse_element'});
            	response_x = response_map_x.get('response_x');
            	retVal = response_x.GetTaxHistoryResult;
            }
            else
            {
            	retVal = new TaxSvc.GetTaxHistoryResult();
            	if(apiSuccessFlag == true)
            	{
            		retVal.ResultCode = 'Success';            	
	            } 
	            else
	            {
	            	retVal.ResultCode = 'Error';
	            	retVal.Messages = new TaxSvc.ArrayOfMessage();
	            	retVal.Messages.Message = new TaxSvc.Message[1];
	            	retVal.Messages.Message[0] = new TaxSvc.Message();
           	        retVal.Messages.Message[0].Summary = 'Test Failure';
			        retVal.Messages.Message[0].Details = 'Test Failure';
			        retVal.Messages.Message[0].HelpLink = 'http://bogus.com';
			        retVal.Messages.Message[0].RefersTo = 'Testing';
			        retVal.Messages.Message[0].Severity = 'Error';
			        retVal.Messages.Message[0].Source = 'Gossip';
			        retVal.Messages.Message[0].Name = 'Mud';
	            }           		
            }
            return retVal;
        }
        
        public TaxSvc.PingResult Ping(String Message) {
            TaxSvc.Ping_element request_x = new TaxSvc.Ping_element();
            TaxSvc.PingResponse_element response_x;
            request_x.Message = Message;
            Map<String, TaxSvc.PingResponse_element> response_map_x = new Map<String, TaxSvc.PingResponse_element>();
            response_map_x.put('response_x', response_x);
            TaxSvc.PingResult retVal = null;
            if(!testFlag)
            {
	            WebServiceCallout.invoke(this,request_x,response_map_x,new String[]{endpoint_x,'http://avatax.avalara.com/services/Ping','http://avatax.avalara.com/services','Ping','http://avatax.avalara.com/services','PingResponse','TaxSvc.PingResponse_element'});
	            response_x = response_map_x.get('response_x');
	            retVal = response_x.PingResult;
            }
            else
            {
            	retVal = new TaxSvc.PingResult();
	            if(apiSuccessflag == true)
	            {
	            	retVal.ResultCode = 'Success';
	            } 
	            else
	            {
	            	retVal.ResultCode = 'Error';
	            	retVal.Messages = new TaxSvc.ArrayOfMessage();
	            	retVal.Messages.Message = new TaxSvc.Message[1];
	            	retVal.Messages.Message[0] = new TaxSvc.Message();
           	        retVal.Messages.Message[0].Summary = 'Test Failure';
			        retVal.Messages.Message[0].Details = 'Test Failure';
			        retVal.Messages.Message[0].HelpLink = 'http://bogus.com';
			        retVal.Messages.Message[0].RefersTo = 'Testing';
			        retVal.Messages.Message[0].Severity = 'Error';
			        retVal.Messages.Message[0].Source = 'Gossip';
			        retVal.Messages.Message[0].Name = 'Mud';
	            }
            }
            return retVal;
        }
        
        public TaxSvc.ApplyPaymentResult ApplyPayment(TaxSvc.ApplyPaymentRequest ApplyPaymentRequest) {
            TaxSvc.ApplyPayment_element request_x = new TaxSvc.ApplyPayment_element();
            TaxSvc.ApplyPaymentResponse_element response_x;
            request_x.ApplyPaymentRequest = ApplyPaymentRequest;
            Map<String, TaxSvc.ApplyPaymentResponse_element> response_map_x = new Map<String, TaxSvc.ApplyPaymentResponse_element>();
            response_map_x.put('response_x', response_x);
            TaxSvc.ApplyPaymentResult retVal = null;
            if(!testFlag)
            {
            	WebServiceCallout.invoke(this,request_x,response_map_x,new String[]{endpoint_x,'http://avatax.avalara.com/services/ApplyPayment','http://avatax.avalara.com/services','ApplyPayment','http://avatax.avalara.com/services','ApplyPaymentResponse','TaxSvc.ApplyPaymentResponse_element'});
            	response_x = response_map_x.get('response_x');
            	retVal = response_x.ApplyPaymentResult;
            }
            else
            {
            	retVal = new TaxSvc.ApplyPaymentResult();
            }
            return retVal;
        }
        
        public TaxSvc.GetTaxResult GetTax(TaxSvc.GetTaxRequest GetTaxRequest) {
            TaxSvc.GetTax_element request_x = new TaxSvc.GetTax_element();
            TaxSvc.GetTaxResponse_element response_x;
            request_x.GetTaxRequest = GetTaxRequest;
            Map<String, TaxSvc.GetTaxResponse_element> response_map_x = new Map<String, TaxSvc.GetTaxResponse_element>();
            response_map_x.put('response_x', response_x);
            TaxSvc.GetTaxResult retVal = null;
            if(!testFlag)
            {
	            WebServiceCallout.invoke(this,request_x,response_map_x,new String[]{endpoint_x,'http://avatax.avalara.com/services/GetTax','http://avatax.avalara.com/services','GetTax','http://avatax.avalara.com/services','GetTaxResponse','TaxSvc.GetTaxResponse_element'});
            	response_x = response_map_x.get('response_x');
            	retVal = response_x.GetTaxResult;
            }
            else
            {
            	retVal = new TaxSvc.GetTaxResult();
            	if(apiSuccessFlag = true)
            	{
			        retVal.ResultCode = 'Success';
        			retVal.DocType = 'SalesOrder';
        			retVal.DocCode = 'Doc123';
        			retVal.DocDate = Date.Today();
        			retVal.DocStatus = 'Temporary';
            	}
            	else
            	{
	            	retVal.ResultCode = 'Error';
	            	retVal.Messages = new TaxSvc.ArrayOfMessage();
	            	retVal.Messages.Message = new TaxSvc.Message[1];
	            	retVal.Messages.Message[0] = new TaxSvc.Message();
           	        retVal.Messages.Message[0].Summary = 'Test Failure';
			        retVal.Messages.Message[0].Details = 'Test Failure';
			        retVal.Messages.Message[0].HelpLink = 'http://bogus.com';
			        retVal.Messages.Message[0].RefersTo = 'Testing';
			        retVal.Messages.Message[0].Severity = 'Error';
			        retVal.Messages.Message[0].Source = 'Gossip';
			        retVal.Messages.Message[0].Name = 'Mud';
            	}            	
            }
            return retVal;
        }
        
        public TaxSvc.AdjustTaxResult AdjustTax(TaxSvc.AdjustTaxRequest AdjustTaxRequest) {
            TaxSvc.AdjustTax_element request_x = new TaxSvc.AdjustTax_element();
            TaxSvc.AdjustTaxResponse_element response_x;
            request_x.AdjustTaxRequest = AdjustTaxRequest;
            Map<String, TaxSvc.AdjustTaxResponse_element> response_map_x = new Map<String, TaxSvc.AdjustTaxResponse_element>();
            response_map_x.put('response_x', response_x);
            TaxSvc.AdjustTaxResult retVal = null;
            if(!testFlag)
            {
            	WebServiceCallout.invoke(this,request_x,response_map_x,new String[]{endpoint_x,'http://avatax.avalara.com/services/AdjustTax','http://avatax.avalara.com/services','AdjustTax','http://avatax.avalara.com/services','AdjustTaxResponse','TaxSvc.AdjustTaxResponse_element'});
            	response_x = response_map_x.get('response_x');
            	retVal = response_x.AdjustTaxResult;
            }
            else
            {
            	retVal = new AdjustTaxResult();
            	if(apiSuccessFlag = true)
            	{
			        retVal.ResultCode = 'Success';
        			retVal.DocType = 'SalesOrder';
        			retVal.DocCode = 'Doc123';
        			retVal.DocDate = Date.Today();
        			retVal.DocStatus = 'Temporary';
            	}
            	else
            	{
	            	retVal.ResultCode = 'Error';
	            	retVal.Messages = new TaxSvc.ArrayOfMessage();
	            	retVal.Messages.Message = new TaxSvc.Message[1];
	            	retVal.Messages.Message[0] = new TaxSvc.Message();
           	        retVal.Messages.Message[0].Summary = 'Test Failure';
			        retVal.Messages.Message[0].Details = 'Test Failure';
			        retVal.Messages.Message[0].HelpLink = 'http://bogus.com';
			        retVal.Messages.Message[0].RefersTo = 'Testing';
			        retVal.Messages.Message[0].Severity = 'Error';
			        retVal.Messages.Message[0].Source = 'Gossip';
			        retVal.Messages.Message[0].Name = 'Mud';
            	}            	
            	
            }
            return retVal;
        }
        
        public TaxSvc.ReconcileTaxHistoryResult ReconcileTaxHistory(TaxSvc.ReconcileTaxHistoryRequest ReconcileTaxHistoryRequest) {
            TaxSvc.ReconcileTaxHistory_element request_x = new TaxSvc.ReconcileTaxHistory_element();
            TaxSvc.ReconcileTaxHistoryResponse_element response_x;
            request_x.ReconcileTaxHistoryRequest = ReconcileTaxHistoryRequest;
            Map<String, TaxSvc.ReconcileTaxHistoryResponse_element> response_map_x = new Map<String, TaxSvc.ReconcileTaxHistoryResponse_element>();
            response_map_x.put('response_x', response_x);
            TaxSvc.ReconcileTaxHistoryResult retVal = null;
            if(!testFlag)
            {
            	WebServiceCallout.invoke(this,request_x,response_map_x,new String[]{endpoint_x,'http://avatax.avalara.com/services/ReconcileTaxHistory','http://avatax.avalara.com/services','ReconcileTaxHistory','http://avatax.avalara.com/services','ReconcileTaxHistoryResponse','TaxSvc.ReconcileTaxHistoryResponse_element'});
            	response_x = response_map_x.get('response_x');
            	retVal = response_x.ReconcileTaxHistoryResult;
            }
            else
            {
            	retVal = new TaxSvc.ReconcileTaxHistoryResult();
            	if(apiSuccessFlag == true)
            	{
            		retVal.ResultCode = 'Success';
            		retVal.RecordCount = 0;
            	}
            	else
            	{
 	            	retVal.ResultCode = 'Error';
	            	retVal.Messages = new TaxSvc.ArrayOfMessage();
	            	retVal.Messages.Message = new TaxSvc.Message[1];
	            	retVal.Messages.Message[0] = new TaxSvc.Message();
           	        retVal.Messages.Message[0].Summary = 'Test Failure';
			        retVal.Messages.Message[0].Details = 'Test Failure';
			        retVal.Messages.Message[0].HelpLink = 'http://bogus.com';
			        retVal.Messages.Message[0].RefersTo = 'Testing';
			        retVal.Messages.Message[0].Severity = 'Error';
			        retVal.Messages.Message[0].Source = 'Gossip';
			        retVal.Messages.Message[0].Name = 'Mud';           		
            	}
            }
            return retVal;
        }
        
        public TaxSvc.CommitTaxResult CommitTax(TaxSvc.CommitTaxRequest CommitTaxRequest) {
            TaxSvc.CommitTax_element request_x = new TaxSvc.CommitTax_element();
            TaxSvc.CommitTaxResponse_element response_x;
            request_x.CommitTaxRequest = CommitTaxRequest;
            Map<String, TaxSvc.CommitTaxResponse_element> response_map_x = new Map<String, TaxSvc.CommitTaxResponse_element>();
            response_map_x.put('response_x', response_x);
            TaxSvc.CommitTaxResult retVal = null;
            if(!testFlag)
            {
	            WebServiceCallout.invoke(this,request_x,response_map_x,new String[]{endpoint_x,'http://avatax.avalara.com/services/CommitTax','http://avatax.avalara.com/services','CommitTax','http://avatax.avalara.com/services','CommitTaxResponse','TaxSvc.CommitTaxResponse_element'});
	            response_x = response_map_x.get('response_x');
	            retVal = response_x.CommitTaxResult;
            }
            else
            {
            	retVal = new TaxSvc.CommitTaxResult();           	
	            if(apiSuccessflag == true)
	            {
	            	retVal.ResultCode = 'Success';
	            }
	            else
	            { 
	            	retVal.ResultCode = 'Error';
		           	retVal.Messages = new TaxSvc.ArrayOfMessage();
		           	retVal.Messages.Message = new TaxSvc.Message[1];
		           	retVal.Messages.Message[0] = new TaxSvc.Message();
	                retVal.Messages.Message[0].Summary = 'Test Failure';
			        retVal.Messages.Message[0].Details = 'Test Failure';
			        retVal.Messages.Message[0].HelpLink = 'http://bogus.com';
			        retVal.Messages.Message[0].RefersTo = 'Testing';
				    retVal.Messages.Message[0].Severity = 'Error';
				    retVal.Messages.Message[0].Source = 'Gossip';
				    retVal.Messages.Message[0].Name = 'Mud';
	            }
            }
            return retVal;
        }
        
    }

////////////////////////////////////////////////////////////////////////////////
// API call Request Classes - instantiations passed as arguments to API calls
////////////////////////////////////////////////////////////////////////////////
    public class PostTaxRequest {
        public String CompanyCode;
        public String DocType = 'SalesOrder';
        public String DocCode;
        public Date DocDate = Date.Today();
        public Decimal TotalAmount = 0.0;
        public Decimal TotalTax = 0.0;
        public Boolean Commit_x = false;
        public String NewDocCode;
        public Integer HashCode;
        private String[] CompanyCode_type_info = new String[]{'CompanyCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] DocType_type_info = new String[]{'DocType','http://avatax.avalara.com/services','DocumentType','1','1','false'};
        private String[] DocCode_type_info = new String[]{'DocCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] DocDate_type_info = new String[]{'DocDate','http://www.w3.org/2001/XMLSchema','date','1','1','false'};
        private String[] TotalAmount_type_info = new String[]{'TotalAmount','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] TotalTax_type_info = new String[]{'TotalTax','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] Commit_x_type_info = new String[]{'Commit','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] NewDocCode_type_info = new String[]{'NewDocCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] HashCode_type_info = new String[]{'HashCode','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'CompanyCode','DocType','DocCode','DocDate','TotalAmount','TotalTax','Commit_x','NewDocCode'};
    }
    public class AdjustTaxRequest {
        public Integer AdjustmentReason = 0;
        public String AdjustmentDescription;
        public TaxSvc.GetTaxRequest GetTaxRequest;
        private String[] AdjustmentReason_type_info = new String[]{'AdjustmentReason','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] AdjustmentDescription_type_info = new String[]{'AdjustmentDescription','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] GetTaxRequest_type_info = new String[]{'GetTaxRequest','http://avatax.avalara.com/services','GetTaxRequest','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'AdjustmentReason','AdjustmentDescription','GetTaxRequest'};
    }
    public class ApplyPaymentRequest {
        public String CompanyCode;
        public String DocType = 'SalesOrder';
        public String DocCode;
        public Date PaymentDate = Date.Today();
        private String[] CompanyCode_type_info = new String[]{'CompanyCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] DocType_type_info = new String[]{'DocType','http://avatax.avalara.com/services','DocumentType','1','1','false'};
        private String[] DocCode_type_info = new String[]{'DocCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] PaymentDate_type_info = new String[]{'PaymentDate','http://www.w3.org/2001/XMLSchema','date','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'CompanyCode','DocType','DocCode','PaymentDate'};
    }
    public class CommitTaxRequest {
        public String CompanyCode;
        public String DocType = 'SalesOrder';
        public String DocCode;
        public String NewDocCode;
        private String[] CompanyCode_type_info = new String[]{'CompanyCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] DocType_type_info = new String[]{'DocType','http://avatax.avalara.com/services','DocumentType','1','1','false'};
        private String[] DocCode_type_info = new String[]{'DocCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] NewDocCode_type_info = new String[]{'NewDocCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'CompanyCode','DocType','DocCode','NewDocCode'};
    }
    public class ReconcileTaxHistoryRequest {
        public String CompanyCode;
        public Boolean Reconciled = false;
        public Date StartDate = Date.Today();
        public Date EndDate = Date.Today();
        public String DocStatus = 'Temporary';
        public String DocType = 'SalesOrder';
        public String LastDocCode = '0';
        public Integer PageSize = 10;
        private String[] CompanyCode_type_info = new String[]{'CompanyCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Reconciled_type_info = new String[]{'Reconciled','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] StartDate_type_info = new String[]{'StartDate','http://www.w3.org/2001/XMLSchema','date','1','1','false'};
        private String[] EndDate_type_info = new String[]{'EndDate','http://www.w3.org/2001/XMLSchema','date','1','1','false'};
        private String[] DocStatus_type_info = new String[]{'DocStatus','http://avatax.avalara.com/services','DocStatus','1','1','false'};
        private String[] DocType_type_info = new String[]{'DocType','http://avatax.avalara.com/services','DocumentType','1','1','false'};
        private String[] LastDocCode_type_info = new String[]{'LastDocCode','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] PageSize_type_info = new String[]{'PageSize','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'CompanyCode','Reconciled','StartDate','EndDate','DocStatus','DocType','LastDocCode','PageSize'};
    }
    public class GetTaxRequest {
        public String CompanyCode;
        public String DocType = 'SalesOrder';
        public String DocCode;
        public Date DocDate = Date.Today();
        public String SalespersonCode;
        public String CustomerCode;
        public String CustomerUsageType;
        public Decimal Discount = 0.0;
        public String PurchaseOrderNo;
        public String ExemptionNo;
        public String OriginCode;
        public String DestinationCode;
        public TaxSvc.ArrayOfBaseAddress Addresses;
        public TaxSvc.ArrayOfLine Lines;
        public String DetailLevel = 'Document';
        public String ReferenceCode;
        public String LocationCode;
        public Boolean Commit_x = false;
        public String BatchCode;
        public TaxSvc.TaxOverride TaxOverride;
        public String CurrencyCode;
        public String ServiceMode = 'Automatic';
        public Date PaymentDate = Date.Today();
        public Decimal ExchangeRate = 1.0;
        public Date ExchangeRateEffDate = Date.Today();
        public Integer HashCode;
        private String[] HashCode_type_info = new String[]{'HashCode','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] CompanyCode_type_info = new String[]{'CompanyCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] DocType_type_info = new String[]{'DocType','http://avatax.avalara.com/services','DocumentType','1','1','false'};
        private String[] DocCode_type_info = new String[]{'DocCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] DocDate_type_info = new String[]{'DocDate','http://www.w3.org/2001/XMLSchema','date','1','1','false'};
        private String[] SalespersonCode_type_info = new String[]{'SalespersonCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] CustomerCode_type_info = new String[]{'CustomerCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] CustomerUsageType_type_info = new String[]{'CustomerUsageType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Discount_type_info = new String[]{'Discount','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] PurchaseOrderNo_type_info = new String[]{'PurchaseOrderNo','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ExemptionNo_type_info = new String[]{'ExemptionNo','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] OriginCode_type_info = new String[]{'OriginCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] DestinationCode_type_info = new String[]{'DestinationCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Addresses_type_info = new String[]{'Addresses','http://avatax.avalara.com/services','ArrayOfBaseAddress','0','1','false'};
        private String[] Lines_type_info = new String[]{'Lines','http://avatax.avalara.com/services','ArrayOfLine','0','1','false'};
        private String[] DetailLevel_type_info = new String[]{'DetailLevel','http://avatax.avalara.com/services','DetailLevel','1','1','false'};
        private String[] ReferenceCode_type_info = new String[]{'ReferenceCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] LocationCode_type_info = new String[]{'LocationCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Commit_x_type_info = new String[]{'Commit','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] BatchCode_type_info = new String[]{'BatchCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] TaxOverride_type_info = new String[]{'TaxOverride','http://avatax.avalara.com/services','TaxOverride','0','1','false'};
        private String[] CurrencyCode_type_info = new String[]{'CurrencyCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ServiceMode_type_info = new String[]{'ServiceMode','http://avatax.avalara.com/services','ServiceMode','1','1','false'};
        private String[] PaymentDate_type_info = new String[]{'PaymentDate','http://www.w3.org/2001/XMLSchema','date','1','1','false'};
        private String[] ExchangeRate_type_info = new String[]{'ExchangeRate','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] ExchangeRateEffDate_type_info = new String[]{'ExchangeRateEffDate','http://www.w3.org/2001/XMLSchema','date','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'CompanyCode','DocType','DocCode','DocDate','SalespersonCode','CustomerCode','CustomerUsageType','Discount','PurchaseOrderNo','ExemptionNo','OriginCode','DestinationCode','Addresses','Lines','DetailLevel','ReferenceCode','LocationCode','Commit_x','BatchCode','TaxOverride','CurrencyCode','ServiceMode','PaymentDate','ExchangeRate','ExchangeRateEffDate'};
    }
    public class GetTaxHistoryRequest {
        public String CompanyCode;
        public String DocType = 'SalesOrder';
        public String DocCode;
        public String DetailLevel = 'Document';
        private String[] CompanyCode_type_info = new String[]{'CompanyCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] DocType_type_info = new String[]{'DocType','http://avatax.avalara.com/services','DocumentType','1','1','false'};
        private String[] DocCode_type_info = new String[]{'DocCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] DetailLevel_type_info = new String[]{'DetailLevel','http://avatax.avalara.com/services','DetailLevel','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'CompanyCode','DocType','DocCode','DetailLevel'};
    }
    public class CancelTaxRequest {
        public String CompanyCode;
        public String DocType = 'SalesOrder';
        public String DocCode;
        public String CancelCode = 'Unspecified';
        private String[] CompanyCode_type_info = new String[]{'CompanyCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] DocType_type_info = new String[]{'DocType','http://avatax.avalara.com/services','DocumentType','1','1','false'};
        private String[] DocCode_type_info = new String[]{'DocCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] CancelCode_type_info = new String[]{'CancelCode','http://avatax.avalara.com/services','CancelCode','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'CompanyCode','DocType','DocCode','CancelCode'};
    }
////////////////////////////////////////////////////////////////////////////////
// API call Result Classes - API calls return instantiations of these
////////////////////////////////////////////////////////////////////////////////
    public class CommitTaxResult {
        public String DocId;
        public String TransactionId;
        public String ResultCode = 'Error';
        public TaxSvc.ArrayOfMessage Messages;
        private String[] DocId_type_info = new String[]{'DocId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] TransactionId_type_info = new String[]{'TransactionId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ResultCode_type_info = new String[]{'ResultCode','http://avatax.avalara.com/services','SeverityLevel','1','1','false'};
        private String[] Messages_type_info = new String[]{'Messages','http://avatax.avalara.com/services','ArrayOfMessage','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'TransactionId','ResultCode','Messages'};
    }
    public class GetTaxHistoryResult {
        public TaxSvc.GetTaxRequest GetTaxRequest;
        public TaxSvc.GetTaxResult GetTaxResult;
        public String TransactionId;
        public String ResultCode = 'Error';
        public TaxSvc.ArrayOfMessage Messages;
        private String[] GetTaxRequest_type_info = new String[]{'GetTaxRequest','http://avatax.avalara.com/services','GetTaxRequest','0','1','false'};
        private String[] GetTaxResult_type_info = new String[]{'GetTaxResult','http://avatax.avalara.com/services','GetTaxResult','0','1','false'};
        private String[] TransactionId_type_info = new String[]{'TransactionId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ResultCode_type_info = new String[]{'ResultCode','http://avatax.avalara.com/services','SeverityLevel','1','1','false'};
        private String[] Messages_type_info = new String[]{'Messages','http://avatax.avalara.com/services','ArrayOfMessage','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'GetTaxRequest','GetTaxResult','TransactionId','ResultCode','Messages'};
    }
    public class PingResult {
        public String Version;
        private String[] Version_type_info = new String[]{'Version','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        public String TransactionId;
        public String ResultCode = 'Error';
        public TaxSvc.ArrayOfMessage Messages;
        private String[] TransactionId_type_info = new String[]{'TransactionId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ResultCode_type_info = new String[]{'ResultCode','http://avatax.avalara.com/services','SeverityLevel','1','1','false'};
        private String[] Messages_type_info = new String[]{'Messages','http://avatax.avalara.com/services','ArrayOfMessage','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Version','TransactionId','ResultCode','Messages'};
    }
    public class IsAuthorizedResult {
        public String Operations;
        public DateTime Expires = Date.Today() - 1;
        public String TransactionId;
        public String ResultCode = 'Error';
        public TaxSvc.ArrayOfMessage Messages;
        private String[] Operations_type_info = new String[]{'Operations','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Expires_type_info = new String[]{'Expires','http://www.w3.org/2001/XMLSchema','dateTime','1','1','false'};
        private String[] TransactionId_type_info = new String[]{'TransactionId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ResultCode_type_info = new String[]{'ResultCode','http://avatax.avalara.com/services','SeverityLevel','1','1','false'};
        private String[] Messages_type_info = new String[]{'Messages','http://avatax.avalara.com/services','ArrayOfMessage','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Operations','Expires','TransactionId','ResultCode','Messages'};
    }
    public class ApplyPaymentResult {
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{};
    }
    public class AdjustTaxResult {
        public String DocId;
        public Integer HashCode;
        public String DocType = 'SalesOrder';
        public String DocCode;
        public Date DocDate = Date.Today();
        public String DocStatus = 'Temporary';
        public Boolean Reconciled = false;
        public DateTime Timestamp = DateTime.Now();
        public Decimal TotalAmount = 0.0;
        public Decimal TotalDiscount = 0.0;
        public Decimal TotalExemption = 0.0;
        public Decimal TotalTaxable = 0.0;
        public Decimal TotalTax = 0.0;
        public Decimal TotalTaxCalculated = 0.0;
        public TaxSvc.ArrayOfTaxLine TaxLines;
        public TaxSvc.ArrayOfTaxAddress TaxAddresses;
        public Boolean Locked = false;
        public Integer AdjustmentReason = 0;
        public String AdjustmentDescription;
        public Integer Version = 0;
        public Date TaxDate = Date.Today();
        public TaxSvc.ArrayOfTaxDetail TaxSummary;
        public String TransactionId;
        public String ResultCode = 'Error';
        public TaxSvc.ArrayOfMessage Messages;
        public Boolean VolatileTaxRates = false;
        private String[] DocId_type_info = new String[]{'DocId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] HashCode_type_info = new String[]{'HashCode','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] DocType_type_info = new String[]{'DocType','http://avatax.avalara.com/services','DocumentType','1','1','false'};
        private String[] DocCode_type_info = new String[]{'DocCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] DocDate_type_info = new String[]{'DocDate','http://www.w3.org/2001/XMLSchema','date','1','1','false'};
        private String[] DocStatus_type_info = new String[]{'DocStatus','http://avatax.avalara.com/services','DocStatus','1','1','false'};
        private String[] Reconciled_type_info = new String[]{'Reconciled','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] Timestamp_type_info = new String[]{'Timestamp','http://www.w3.org/2001/XMLSchema','dateTime','1','1','false'};
        private String[] TotalAmount_type_info = new String[]{'TotalAmount','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] TotalDiscount_type_info = new String[]{'TotalDiscount','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] TotalExemption_type_info = new String[]{'TotalExemption','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] TotalTaxable_type_info = new String[]{'TotalTaxable','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] TotalTax_type_info = new String[]{'TotalTax','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] TotalTaxCalculated_type_info = new String[]{'TotalTaxCalculated','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] TaxLines_type_info = new String[]{'TaxLines','http://avatax.avalara.com/services','ArrayOfTaxLine','0','1','false'};
        private String[] TaxAddresses_type_info = new String[]{'TaxAddresses','http://avatax.avalara.com/services','ArrayOfTaxAddress','0','1','false'};
        private String[] Locked_type_info = new String[]{'Locked','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] AdjustmentReason_type_info = new String[]{'AdjustmentReason','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] AdjustmentDescription_type_info = new String[]{'AdjustmentDescription','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Version_type_info = new String[]{'Version','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] TaxDate_type_info = new String[]{'TaxDate','http://www.w3.org/2001/XMLSchema','date','1','1','false'};
        private String[] TaxSummary_type_info = new String[]{'TaxSummary','http://avatax.avalara.com/services','ArrayOfTaxDetail','0','1','false'};
        private String[] TransactionId_type_info = new String[]{'TransactionId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ResultCode_type_info = new String[]{'ResultCode','http://avatax.avalara.com/services','SeverityLevel','1','1','false'};
        private String[] Messages_type_info = new String[]{'Messages','http://avatax.avalara.com/services','ArrayOfMessage','0','1','false'};
        private String[] VolatileTaxRates_type_info = new String[]{'VolatileTaxRates','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'DocId','HashCode','DocType','DocCode','DocDate',
            'DocStatus','Reconciled','Timestamp','TotalAmount','TotalDiscount','TotalExemption',
            'TotalTaxable','TotalTax','TotalTaxCalculated','TaxLines','TaxAddresses','Locked','AdjustmentReason',
            'AdjustmentDescription','Version','TaxDate','TaxSummary','TransactionId','ResultCode','Messages'};
    }
    public class GetTaxResult {
        public String DocId;
        public String TransactionId;
        public String ResultCode;
        public TaxSvc.ArrayOfMessage Messages;
        public String DocType = 'SalesOrder';
        public String DocCode;
        public Date DocDate = Date.Today();
        public String DocStatus = 'Temporary';
        public Boolean Reconciled = false;
        public DateTime Timestamp = DateTime.Now();
        public Decimal TotalAmount = 0.0;
        public Decimal TotalDiscount = 0.0;
        public Decimal TotalExemption = 0.0;
        public Decimal TotalTaxable = 0.0;
        public Decimal TotalTax = 0.0;
        public Decimal TotalTaxCalculated = 0.0;
        public Integer HashCode;
        public TaxSvc.ArrayOfTaxLine TaxLines;
        public TaxSvc.ArrayOfTaxAddress TaxAddresses;
        public Boolean Locked = false;
        public Integer AdjustmentReason = 0;
        public String AdjustmentDescription;
        public Integer Version = 0;
        public Date TaxDate = Date.Today();
        public TaxSvc.ArrayOfTaxDetail TaxSummary;
        public Boolean VolatileTaxRates = false;
        private String[] DocId_type_info = new String[]{'DocId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] TransactionId_type_info = new String[]{'TransactionId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ResultCode_type_info = new String[]{'ResultCode','http://avatax.avalara.com/services','SeverityLevel','1','1','false'};
        private String[] Messages_type_info = new String[]{'Messages','http://avatax.avalara.com/services','ArrayOfMessage','0','1','false'};
        private String[] DocType_type_info = new String[]{'DocType','http://avatax.avalara.com/services','DocumentType','1','1','false'};
        private String[] DocCode_type_info = new String[]{'DocCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] DocDate_type_info = new String[]{'DocDate','http://www.w3.org/2001/XMLSchema','date','1','1','false'};
        private String[] DocStatus_type_info = new String[]{'DocStatus','http://avatax.avalara.com/services','DocStatus','1','1','false'};
        private String[] Reconciled_type_info = new String[]{'Reconciled','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] Timestamp_type_info = new String[]{'Timestamp','http://www.w3.org/2001/XMLSchema','dateTime','1','1','false'};
        private String[] TotalAmount_type_info = new String[]{'TotalAmount','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] TotalDiscount_type_info = new String[]{'TotalDiscount','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] TotalExemption_type_info = new String[]{'TotalExemption','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] TotalTaxable_type_info = new String[]{'TotalTaxable','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] TotalTax_type_info = new String[]{'TotalTax','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] TotalTaxCalculated_type_info = new String[]{'TotalTaxCalculated','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] HashCode_type_info = new String[]{'HashCode','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] TaxLines_type_info = new String[]{'TaxLines','http://avatax.avalara.com/services','ArrayOfTaxLine','0','1','false'};
        private String[] TaxAddresses_type_info = new String[]{'TaxAddresses','http://avatax.avalara.com/services','ArrayOfTaxAddress','0','1','false'};
        private String[] Locked_type_info = new String[]{'Locked','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] AdjustmentReason_type_info = new String[]{'AdjustmentReason','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] AdjustmentDescription_type_info = new String[]{'AdjustmentDescription','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Version_type_info = new String[]{'Version','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] TaxDate_type_info = new String[]{'TaxDate','http://www.w3.org/2001/XMLSchema','date','1','1','false'};
        private String[] TaxSummary_type_info = new String[]{'TaxSummary','http://avatax.avalara.com/services','ArrayOfTaxDetail','0','1','false'};
        private String[] VolatileTaxRates_type_info = new String[]{'VolatileTaxRates','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'TransactionId','ResultCode','Messages','DocType','DocCode','DocDate','DocStatus','Reconciled','Timestamp','TotalAmount','TotalDiscount','TotalExemption','TotalTaxable','TotalTax','TotalTaxCalculated','TaxLines','TaxAddresses','Locked','AdjustmentReason','AdjustmentDescription','Version','TaxDate','TaxSummary'};
    }
    public class ReconcileTaxHistoryResult {
        public Integer RecordCount;
        public TaxSvc.ArrayOfGetTaxResult GetTaxResults;
        public String LastDocCode;
        public String TransactionId;
        public String ResultCode = 'Error';
        public TaxSvc.ArrayOfMessage Messages;
        private String[] RecordCount_type_info = new String[]{'RecordCount','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        private String[] GetTaxResults_type_info = new String[]{'GetTaxResults','http://avatax.avalara.com/services','ArrayOfGetTaxResult','0','1','false'};
        private String[] LastDocCode_type_info = new String[]{'LastDocCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] TransactionId_type_info = new String[]{'TransactionId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ResultCode_type_info = new String[]{'ResultCode','http://avatax.avalara.com/services','SeverityLevel','1','1','false'};
        private String[] Messages_type_info = new String[]{'Messages','http://avatax.avalara.com/services','ArrayOfMessage','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'RecordCount','GetTaxResults','LastDocCode','TransactionId','ResultCode','Messages'};
    }
    public class PostTaxResult {
        public String DocId;
        public String TransactionId;
        public String ResultCode = 'Error';
        public TaxSvc.ArrayOfMessage Messages;
        private String[] DocId_type_info = new String[]{'DocId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] TransactionId_type_info = new String[]{'TransactionId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ResultCode_type_info = new String[]{'ResultCode','http://avatax.avalara.com/services','SeverityLevel','1','1','false'};
        private String[] Messages_type_info = new String[]{'Messages','http://avatax.avalara.com/services','ArrayOfMessage','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'TransactionId','ResultCode','Messages'};
    }
    public class CancelTaxResult {
        public String DocId;
        public String TransactionId;
        public String ResultCode = 'Error';
        public TaxSvc.ArrayOfMessage Messages;
        private String[] DocId_type_info = new String[]{'DocId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] TransactionId_type_info = new String[]{'TransactionId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ResultCode_type_info = new String[]{'ResultCode','http://avatax.avalara.com/services','SeverityLevel','1','1','false'};
        private String[] Messages_type_info = new String[]{'Messages','http://avatax.avalara.com/services','ArrayOfMessage','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'TransactionId','ResultCode','Messages'};
    }
////////////////////////////////////////////////////////////////////////////////
// Secondary Data Structures - all directly instantiable.  Most are referenced
// as embedded members of a request or result object
////////////////////////////////////////////////////////////////////////////////

    public class AuditMessage {
        public String Message;
        private String[] Message_type_info = new String[]{'Message','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Message'};
    }
    public class TaxAddress {
        public String Address;
        public String AddressCode;
        public Integer BoundaryLevel = 0;
        public String City;
        public String Country;
        public String PostalCode;
        public String Region;
        public Integer TaxRegionId = 0;
        public String JurisCode;
        public String Latitude;
        public String Longitude;
        public String ValidateStatus;
        public String GeocodeType;
        public String DistanceToBoundary;
        private String[] Address_type_info = new String[]{'Address','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] AddressCode_type_info = new String[]{'AddressCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] BoundaryLevel_type_info = new String[]{'BoundaryLevel','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] City_type_info = new String[]{'City','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Country_type_info = new String[]{'Country','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] PostalCode_type_info = new String[]{'PostalCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Region_type_info = new String[]{'Region','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] TaxRegionId_type_info = new String[]{'TaxRegionId','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] JurisCode_type_info = new String[]{'JurisCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Latitude_type_info = new String[]{'Latitude','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Longitude_type_info = new String[]{'Longitude','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ValidateStatus_type_info = new String[]{'ValidateStatus','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] GeocodeType_type_info = new String[]{'GeocodeType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] DistanceToBoundary_type_info = new String[]{'DistanceToBoundary','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Address','AddressCode','BoundaryLevel','City','Country','PostalCode','Region','TaxRegionId','JurisCode'};
    }
    public class ArrayOfMessage {
        public TaxSvc.Message[] Message;
        private String[] Message_type_info = new String[]{'Message','http://avatax.avalara.com/services','Message','0','-1','true'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Message'};
    }
    public class ArrayOfLine {
        public TaxSvc.Line[] Line;
        private String[] Line_type_info = new String[]{'Line','http://avatax.avalara.com/services','Line','0','-1','true'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Line'};
    }
    public class ArrayOfBaseAddress {
        public TaxSvc.BaseAddress[] BaseAddress;
        private String[] BaseAddress_type_info = new String[]{'BaseAddress','http://avatax.avalara.com/services','BaseAddress','0','-1','true'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'BaseAddress'};
    }
    public class ArrayOfTaxLine {
        public TaxSvc.TaxLine[] TaxLine;
        private String[] TaxLine_type_info = new String[]{'TaxLine','http://avatax.avalara.com/services','TaxLine','0','-1','true'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'TaxLine'};
    }
    public class TaxOverride {
        public String TaxOverrideType = 'None';
        public Decimal TaxAmount = 0.0;
        public Date TaxDate = Date.Today();
        public String Reason;
        private String[] TaxOverrideType_type_info = new String[]{'TaxOverrideType','http://avatax.avalara.com/services','TaxOverrideType','1','1','false'};
        private String[] TaxAmount_type_info = new String[]{'TaxAmount','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] TaxDate_type_info = new String[]{'TaxDate','http://www.w3.org/2001/XMLSchema','date','1','1','false'};
        private String[] Reason_type_info = new String[]{'Reason','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'TaxOverrideType','TaxAmount','TaxDate','Reason'};
    }
    public class Profile {
        public String Name = 'Apex2AvalaraSDK.11.2.1.0';
        public String Client;
        public String Adapter = 'Apex2AvalaraSDK.11.2.1.0';
        public String Machine = 'SFCloud';
        private String[] Name_type_info = new String[]{'Name','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Client_type_info = new String[]{'Client','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Adapter_type_info = new String[]{'Adapter','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Machine_type_info = new String[]{'Machine','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Name','Client','Adapter','Machine'};
    }
    public class BaseAddress {
        public String AddressCode;
        public String Line1;
        public String Line2;
        public String Line3;
        public String City;
        public String Region;
        public String PostalCode;
        public String Country;
        public Integer TaxRegionId = 0;
        public String Latitude;
        public String Longitude;
        private String[] AddressCode_type_info = new String[]{'AddressCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Line1_type_info = new String[]{'Line1','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Line2_type_info = new String[]{'Line2','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Line3_type_info = new String[]{'Line3','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] City_type_info = new String[]{'City','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Region_type_info = new String[]{'Region','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] PostalCode_type_info = new String[]{'PostalCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Country_type_info = new String[]{'Country','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] TaxRegionId_type_info = new String[]{'TaxRegionId','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] Latitude_type_info = new String[]{'Latitude','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Longitude_type_info = new String[]{'Longitude','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'AddressCode','Line1','Line2','Line3','City','Region','PostalCode','Country','TaxRegionId'};
    }
    public class ArrayOfTaxDetail {
        public TaxSvc.TaxDetail[] TaxDetail;
        private String[] TaxDetail_type_info = new String[]{'TaxDetail','http://avatax.avalara.com/services','TaxDetail','0','-1','true'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'TaxDetail'};
    }
    public class Security {
        public TaxSvc.UsernameToken_element UsernameToken = new TaxSvc.UsernameToken_element();
        private String[] UsernameToken_type_info = new String[]{'UsernameToken','http://avatax.avalara.com/services','UsernameToken_element','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'UsernameToken'};
    }
    public class UsernameToken_element {
        public String Username {get; set;}
        public String Password {get; set;}
        private String[] Username_type_info = new String[]{'Username','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Password_type_info = new String[]{'Password','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Username','Password'};
    }
    public class ArrayOfTaxAddress {
        public TaxSvc.TaxAddress[] TaxAddress;
        private String[] TaxAddress_type_info = new String[]{'TaxAddress','http://avatax.avalara.com/services','TaxAddress','0','-1','true'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'TaxAddress'};
    }
    public class TaxDetail {
        public String Country;
        public String Region;
        public String JurisType = 'Composite';
        public String JurisCode;
        public String TaxType = 'Sales';
        public Decimal Base = 0.0;
        public Decimal Taxable = 0.0;
        public Decimal Rate = 0.0;
        public Decimal Tax = 0.0;
        public Decimal TaxCalculated = 0.0;
        public Decimal NonTaxable = 0.0;
        public Decimal Exemption = 0.0;
        public String JurisName;
        public String TaxName;
        public Integer TaxAuthorityType = 0;
        public String TaxGroup;
        public String RateType;
        public String StateAssignedNo;
        private String[] Country_type_info = new String[]{'Country','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Region_type_info = new String[]{'Region','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] JurisType_type_info = new String[]{'JurisType','http://avatax.avalara.com/services','JurisdictionType','1','1','false'};
        private String[] JurisCode_type_info = new String[]{'JurisCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] TaxType_type_info = new String[]{'TaxType','http://avatax.avalara.com/services','TaxType','1','1','false'};
        private String[] Base_type_info = new String[]{'Base','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] Taxable_type_info = new String[]{'Taxable','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] Rate_type_info = new String[]{'Rate','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] Tax_type_info = new String[]{'Tax','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] TaxCalculated_type_info = new String[]{'TaxCalculated','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] NonTaxable_type_info = new String[]{'NonTaxable','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] Exemption_type_info = new String[]{'Exemption','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] JurisName_type_info = new String[]{'JurisName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] TaxName_type_info = new String[]{'TaxName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] TaxAuthorityType_type_info = new String[]{'TaxAuthorityType','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] TaxGroup_type_info = new String[]{'TaxGroup','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] RateType_type_info = new String[]{'RateType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] StateAssignedNo_type_info = new String[]{'StateAssignedNo','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Country','Region','JurisType','JurisCode','TaxType','Base','Taxable','Rate','Tax','TaxCalculated','NonTaxable','Exemption','JurisName','TaxName','TaxAuthorityType','TaxGroup','RateType','StateAssignedNo'};
    }
    public class Message {
        public String Summary;
        public String Details;
        public String HelpLink;
        public String RefersTo;
        public String Severity = 'Error';
        public String Source;
        public String Name;
        private String[] Summary_type_info = new String[]{'Summary','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Details_type_info = new String[]{'Details','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] HelpLink_type_info = new String[]{'HelpLink','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] RefersTo_type_info = new String[]{'RefersTo','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Severity_type_info = new String[]{'Severity','http://avatax.avalara.com/services','SeverityLevel','1','1','false'};
        private String[] Source_type_info = new String[]{'Source','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Name_att_info = new String[]{'Name'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Summary','Details','HelpLink','RefersTo','Severity','Source'};
    }
     public class TaxLine {
        public String No;
        public String TaxCode;
        public Boolean Taxability = false;
        public String BoundaryLevel = 'Zip5';
        public Decimal Exemption = 0.0;
        public Decimal Discount = 0.0;
        public Decimal Taxable = 0.0;
        public Decimal Rate = 0.0;
        public Decimal Tax = 0.0;
        public Decimal TaxCalculated = 0.0;
        public TaxSvc.ArrayOfTaxDetail TaxDetails;
        public Integer ExemptCertId = 0;
        public Date TaxDate = Date.Today();
        public Date ReportingDate = Date.Today();
        public String AccountingMethod = 'Accrual';
        public Boolean TaxIncluded;
        private String[] No_type_info = new String[]{'No','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] TaxCode_type_info = new String[]{'TaxCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Taxability_type_info = new String[]{'Taxability','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] BoundaryLevel_type_info = new String[]{'BoundaryLevel','http://avatax.avalara.com/services','BoundaryLevel','1','1','false'};
        private String[] Exemption_type_info = new String[]{'Exemption','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] Discount_type_info = new String[]{'Discount','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] Taxable_type_info = new String[]{'Taxable','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] Rate_type_info = new String[]{'Rate','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] Tax_type_info = new String[]{'Tax','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] TaxCalculated_type_info = new String[]{'TaxCalculated','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] TaxDetails_type_info = new String[]{'TaxDetails','http://avatax.avalara.com/services','ArrayOfTaxDetail','0','1','false'};
        private String[] ExemptCertId_type_info = new String[]{'ExemptCertId','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] TaxDate_type_info = new String[]{'TaxDate','http://www.w3.org/2001/XMLSchema','date','1','1','false'};
        private String[] ReportingDate_type_info = new String[]{'ReportingDate','http://www.w3.org/2001/XMLSchema','date','1','1','false'};
        private String[] AccountingMethod_type_info = new String[]{'AccountingMethod','http://avatax.avalara.com/services','AccountingMethod','1','1','false'};
        private String[] TaxIncluded_type_info = new String[]{'TaxIncluded','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'No','TaxCode','Taxability','BoundaryLevel','Exemption','Discount','Taxable','Rate','Tax','TaxCalculated','TaxDetails','ExemptCertId','TaxDate','ReportingDate','AccountingMethod','TaxIncluded'};
    }
    public class ArrayOfGetTaxResult {
        public TaxSvc.GetTaxResult[] GetTaxResult;
        private String[] GetTaxResult_type_info = new String[]{'GetTaxResult','http://avatax.avalara.com/services','GetTaxResult','0','-1','true'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'GetTaxResult'};
    }
    public class Line {
        public String No;
        public String OriginCode;
        public String DestinationCode;
        public String ItemCode;
        public String TaxCode;
        public Decimal Qty = 1.0;
        public Decimal Amount = 0.0;
        public Boolean Discounted = false;
        public String RevAcct;
        public String Ref1;
        public String Ref2;
        public String ExemptionNo;
        public String CustomerUsageType;
        public String Description;
        public TaxSvc.TaxOverride TaxOverride;
        public Boolean TaxIncluded;
        private String[] No_type_info = new String[]{'No','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] OriginCode_type_info = new String[]{'OriginCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] DestinationCode_type_info = new String[]{'DestinationCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ItemCode_type_info = new String[]{'ItemCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] TaxCode_type_info = new String[]{'TaxCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Qty_type_info = new String[]{'Qty','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] Amount_type_info = new String[]{'Amount','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] Discounted_type_info = new String[]{'Discounted','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] RevAcct_type_info = new String[]{'RevAcct','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Ref1_type_info = new String[]{'Ref1','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Ref2_type_info = new String[]{'Ref2','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ExemptionNo_type_info = new String[]{'ExemptionNo','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] CustomerUsageType_type_info = new String[]{'CustomerUsageType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Description_type_info = new String[]{'Description','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] TaxOverride_type_info = new String[]{'TaxOverride','http://avatax.avalara.com/services','TaxOverride','0','1','false'};
        private String[] TaxIncluded_type_info = new String[]{'TaxIncluded','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'No','OriginCode','DestinationCode','ItemCode','TaxCode','Qty','Amount','Discounted','RevAcct','Ref1','Ref2','ExemptionNo','CustomerUsageType','Description','TaxOverride','TaxIncluded'};
    }

////////////////////////////////////////////////////////////////////////////////
// helper classes - visible to other classes within AddressSvc, 
// but not to the end user
////////////////////////////////////////////////////////////////////////////////
   public class ApplyPaymentResponse_element {
        public TaxSvc.ApplyPaymentResult ApplyPaymentResult;
        private String[] ApplyPaymentResult_type_info = new String[]{'ApplyPaymentResult','http://avatax.avalara.com/services','ApplyPaymentResult','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'ApplyPaymentResult'};
    }
    public class IsAuthorized_element {
        public String Operations;
        private String[] Operations_type_info = new String[]{'Operations','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Operations'};
    }
    public class PostTax_element {
        public TaxSvc.PostTaxRequest PostTaxRequest;
        private String[] PostTaxRequest_type_info = new String[]{'PostTaxRequest','http://avatax.avalara.com/services','PostTaxRequest','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'PostTaxRequest'};
    }
    public class IsAuthorizedResponse_element {
        public TaxSvc.IsAuthorizedResult IsAuthorizedResult;
        private String[] IsAuthorizedResult_type_info = new String[]{'IsAuthorizedResult','http://avatax.avalara.com/services','IsAuthorizedResult','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'IsAuthorizedResult'};
    }
    public class GetTaxHistoryResponse_element {
        public TaxSvc.GetTaxHistoryResult GetTaxHistoryResult;
        private String[] GetTaxHistoryResult_type_info = new String[]{'GetTaxHistoryResult','http://avatax.avalara.com/services','GetTaxHistoryResult','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'GetTaxHistoryResult'};
    }
    public class GetTax_element {
        public TaxSvc.GetTaxRequest GetTaxRequest;
        private String[] GetTaxRequest_type_info = new String[]{'GetTaxRequest','http://avatax.avalara.com/services','GetTaxRequest','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'GetTaxRequest'};
    }
    public class CommitTax_element {
        public TaxSvc.CommitTaxRequest CommitTaxRequest;
        private String[] CommitTaxRequest_type_info = new String[]{'CommitTaxRequest','http://avatax.avalara.com/services','CommitTaxRequest','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'CommitTaxRequest'};
    }
    public class AdjustTax_element {
        public TaxSvc.AdjustTaxRequest AdjustTaxRequest;
        private String[] AdjustTaxRequest_type_info = new String[]{'AdjustTaxRequest','http://avatax.avalara.com/services','AdjustTaxRequest','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'AdjustTaxRequest'};
    }
    public class AdjustTaxResponse_element {
        public TaxSvc.AdjustTaxResult AdjustTaxResult;
        private String[] AdjustTaxResult_type_info = new String[]{'AdjustTaxResult','http://avatax.avalara.com/services','AdjustTaxResult','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'AdjustTaxResult'};
    }
    public class Ping_element {
        public String Message;
        private String[] Message_type_info = new String[]{'Message','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Message'};
    }
    public class GetTaxHistory_element {
        public TaxSvc.GetTaxHistoryRequest GetTaxHistoryRequest;
        private String[] GetTaxHistoryRequest_type_info = new String[]{'GetTaxHistoryRequest','http://avatax.avalara.com/services','GetTaxHistoryRequest','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'GetTaxHistoryRequest'};
    }
    public class PostTaxResponse_element {
        public TaxSvc.PostTaxResult PostTaxResult;
        private String[] PostTaxResult_type_info = new String[]{'PostTaxResult','http://avatax.avalara.com/services','PostTaxResult','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'PostTaxResult'};
    }
    public class CancelTax_element {
        public TaxSvc.CancelTaxRequest CancelTaxRequest;
        private String[] CancelTaxRequest_type_info = new String[]{'CancelTaxRequest','http://avatax.avalara.com/services','CancelTaxRequest','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'CancelTaxRequest'};
    }
    public class CommitTaxResponse_element {
        public TaxSvc.CommitTaxResult CommitTaxResult;
        private String[] CommitTaxResult_type_info = new String[]{'CommitTaxResult','http://avatax.avalara.com/services','CommitTaxResult','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'CommitTaxResult'};
    }
    public class ReconcileTaxHistoryResponse_element {
        public TaxSvc.ReconcileTaxHistoryResult ReconcileTaxHistoryResult;
        private String[] ReconcileTaxHistoryResult_type_info = new String[]{'ReconcileTaxHistoryResult','http://avatax.avalara.com/services','ReconcileTaxHistoryResult','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'ReconcileTaxHistoryResult'};
    }
    public class PingResponse_element {
        public TaxSvc.PingResult PingResult;
        private String[] PingResult_type_info = new String[]{'PingResult','http://avatax.avalara.com/services','PingResult','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'PingResult'};
    }
    public class ApplyPayment_element {
        public TaxSvc.ApplyPaymentRequest ApplyPaymentRequest;
        private String[] ApplyPaymentRequest_type_info = new String[]{'ApplyPaymentRequest','http://avatax.avalara.com/services','ApplyPaymentRequest','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'ApplyPaymentRequest'};
    }
    public class ReconcileTaxHistory_element {
        public TaxSvc.ReconcileTaxHistoryRequest ReconcileTaxHistoryRequest;
        private String[] ReconcileTaxHistoryRequest_type_info = new String[]{'ReconcileTaxHistoryRequest','http://avatax.avalara.com/services','ReconcileTaxHistoryRequest','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'ReconcileTaxHistoryRequest'};
    }
    public class GetTaxResponse_element {
        public TaxSvc.GetTaxResult GetTaxResult;
        private String[] GetTaxResult_type_info = new String[]{'GetTaxResult','http://avatax.avalara.com/services','GetTaxResult','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'GetTaxResult'};
    }
    public class CancelTaxResponse_element {
        public TaxSvc.CancelTaxResult CancelTaxResult;
        private String[] CancelTaxResult_type_info = new String[]{'CancelTaxResult','http://avatax.avalara.com/services','CancelTaxResult','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'CancelTaxResult'};
    }
}