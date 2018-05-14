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
// AddressSvc is not instantiated directly, and is really in effect more 
// of a namespace than a class.
////////////////////////////////////////////////////////////////////////////////
public with sharing class AddressSvc {
////////////////////////////////////////////////////////////////////////////////
// AddressSvcSoap is the mother class.  All APIs of the AddressSvc "namespace"
// are methods of AddressSvcSoap.
////////////////////////////////////////////////////////////////////////////////
    public class AddressSvcSoap {
        public String endpoint_x;
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x {get; set;}
        public AddressSvc.Profile Profile;
        public AddressSvc.Security Security;
        public boolean apiSuccessflag = true;	// only meaningful if testFlag == true 
        private String Profile_hns = 'Profile=http://avatax.avalara.com/services';
        private String Security_hns = 'Security=http://avatax.avalara.com/services';
        private String[] ns_map_type_info = new String[]{'http://avatax.avalara.com/services', 'CBAddressSvc'};
        public AddressSvcSoap(String SvcURL)
        {
            endpoint_x = SvcURL + '/address/addresssvc.asmx/altsec';
            Profile = new AddressSvc.Profile();
            Security = new AddressSvc.Security();
        }
        
        public AddressSvc.IsAuthorizedResult IsAuthorized(String Operations) {
            AddressSvc.IsAuthorized_element request_x = new AddressSvc.IsAuthorized_element();
            AddressSvc.IsAuthorizedResponse_element response_x;
            request_x.Operations = Operations;
            Map<String, AddressSvc.IsAuthorizedResponse_element> response_map_x = new Map<String, AddressSvc.IsAuthorizedResponse_element>();
            response_map_x.put('response_x', response_x);
            AddressSvc.IsAuthorizedResult retVal = null;
            if(!Test.IsRunningTest()) 
            {
            	WebServiceCallout.invoke(this, request_x, response_map_x, new String[]{endpoint_x,'http://avatax.avalara.com/services/IsAuthorized','http://avatax.avalara.com/services','IsAuthorized','http://avatax.avalara.com/services','IsAuthorizedResponse','AddressSvc.IsAuthorizedResponse_element'});
           		response_x = response_map_x.get('response_x');
           		retVal = response_x.IsAuthorizedResult;
            }
            else
            { 
	           	retVal = new AddressSvc.IsAuthorizedResult();
	            if(apiSuccessflag == true)
	            {
	            	retVal.ResultCode = 'Success';
	            } 
	            else
	            {
	            	retVal.ResultCode = 'Error';
	            	retVal.Messages = new AddressSvc.ArrayOfMessage();
	            	retVal.Messages.Message = new AddressSvc.Message[1];
	            	retVal.Messages.Message[0] = new AddressSvc.Message();
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
        

        public AddressSvc.ValidateResult Validate(AddressSvc.ValidateRequest ValidateRequest) {
            AddressSvc.Validate_element request_x = new AddressSvc.Validate_element();
            AddressSvc.ValidateResponse_element response_x;
            request_x.ValidateRequest = ValidateRequest;
            Map<String, AddressSvc.ValidateResponse_element> response_map_x = new Map<String, AddressSvc.ValidateResponse_element>();
            response_map_x.put('response_x', response_x);
	        AddressSvc.ValidateResult retVal = null;
            if(!Test.IsRunningTest()) 
            {
	            WebServiceCallout.invoke(
	            	this,
	            	request_x,
	            	response_map_x,
	            	new String[]{
	            		endpoint_x,
	            		'http://avatax.avalara.com/services/Validate',
	            		'http://avatax.avalara.com/services','Validate',
	            		'http://avatax.avalara.com/services',
	            		'ValidateResponse',
	            		'AddressSvc.ValidateResponse_element'
	            	}
	            );
	            response_x = response_map_x.get('response_x');
	            retVal = response_x.ValidateResult;
            }
            else
            { 
  	           	retVal = new AddressSvc.ValidateResult();
	            if(apiSuccessFlag == true)
	            {
	            	retVal.ResultCode = 'Success';
	            	retVal.ValidAddresses = new AddressSvc.ArrayOfValidAddress();
	            	retVal.ValidAddresses.ValidAddress = new AddressSvc.ValidAddress[1];
	            	retVal.ValidAddresses.ValidAddress[0] = new AddressSvc.ValidAddress();
			        retVal.ValidAddresses.ValidAddress[0].Line1 = ValidateRequest.Address.Line1;
			        retVal.ValidAddresses.ValidAddress[0].Line2 = ValidateRequest.Address.Line2;
			        retVal.ValidAddresses.ValidAddress[0].Line3 = ValidateRequest.Address.Line3;
			        retVal.ValidAddresses.ValidAddress[0].City = ValidateRequest.Address.City;
			        retVal.ValidAddresses.ValidAddress[0].Region = ValidateRequest.Address.Region;
			        retVal.ValidAddresses.ValidAddress[0].PostalCode = ValidateRequest.Address.PostalCode;
			        retVal.ValidAddresses.ValidAddress[0].Country = ValidateRequest.Address.Country;
			        retVal.ValidAddresses.ValidAddress[0].Line4 = '';
			        retVal.ValidAddresses.ValidAddress[0].County = '';
			        retVal.ValidAddresses.ValidAddress[0].Latitude = '0.00';
			        retVal.ValidAddresses.ValidAddress[0].Longitude = '0.00';
	            } 
	            else
	            {
	            	retVal.ResultCode = 'Error';
	            	retVal.Messages = new AddressSvc.ArrayOfMessage();
	            	retVal.Messages.Message = new AddressSvc.Message[1];
	            	retVal.Messages.Message[0] = new AddressSvc.Message();
           	        retVal.Messages.Message[0].Summary = 'Validate Failure per test flag';
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
        
        public AddressSvc.PingResult Ping(String Message) {
            AddressSvc.Ping_element request_x = new AddressSvc.Ping_element();
            AddressSvc.PingResponse_element response_x;
            request_x.Message = Message;
            Map<String, AddressSvc.PingResponse_element> response_map_x = new Map<String, AddressSvc.PingResponse_element>();
            response_map_x.put('response_x', response_x);
            AddressSvc.PingResult retVal = null;
            if(!Test.IsRunningTest()) 
            {
	            WebServiceCallout.invoke(this,request_x,response_map_x,new String[]{endpoint_x,'http://avatax.avalara.com/services/Ping','http://avatax.avalara.com/services','Ping','http://avatax.avalara.com/services','PingResponse','AddressSvc.PingResponse_element'});
	            response_x = response_map_x.get('response_x');
	            retVal = response_x.PingResult;
            }
            else
            {
            	retVal = new AddressSvc.PingResult();
	            if(apiSuccessFlag == true)
	            {
	            	retVal.ResultCode = 'Success';
	            } 
	            else
	            {
	            	retVal.ResultCode = 'Error';
	            	retVal.Messages = new AddressSvc.ArrayOfMessage();
	            	retVal.Messages.Message = new AddressSvc.Message[1];
	            	retVal.Messages.Message[0] = new AddressSvc.Message();
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
    public class ValidateRequest {
        public AddressSvc.BaseAddress Address;
        public String TextCase = 'Default';
        public Boolean Coordinates = false;
        public Boolean Taxability = false;
        public Date Date_x;
        private String[] Address_type_info = new String[]{'Address','http://avatax.avalara.com/services','BaseAddress','0','1','false'};
        private String[] TextCase_type_info = new String[]{'TextCase','http://avatax.avalara.com/services','TextCase','1','1','false'};
        private String[] Coordinates_type_info = new String[]{'Coordinates','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] Taxability_type_info = new String[]{'Taxability','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] Date_x_type_info = new String[]{'Date','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Address','TextCase','Coordinates','Taxability'};
    }

////////////////////////////////////////////////////////////////////////////////
// API call Result Classes - API calls return instantiations of these
////////////////////////////////////////////////////////////////////////////////
    public class PingResult {
        public String Version;
        public String TransactionId;
        public String ResultCode = 'Exception';
        public AddressSvc.ArrayOfMessage Messages;
        private String[] Version_type_info = new String[]{'Version','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] TransactionId_type_info = new String[]{'TransactionId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ResultCode_type_info = new String[]{'ResultCode','http://avatax.avalara.com/services','SeverityLevel','1','1','false'};
        private String[] Messages_type_info = new String[]{'Messages','http://avatax.avalara.com/services','ArrayOfMessage','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Version','TransactionId','ResultCode','Messages'};
    }
    public class IsAuthorizedResult {
        public String Operations;
        public DateTime Expires = DateTime.Now() - 1;
        public String TransactionId;
        public String ResultCode = 'Exception';
        public AddressSvc.ArrayOfMessage Messages;
        private String[] Operations_type_info = new String[]{'Operations','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Expires_type_info = new String[]{'Expires','http://www.w3.org/2001/XMLSchema','dateTime','1','1','false'};
        private String[] TransactionId_type_info = new String[]{'TransactionId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ResultCode_type_info = new String[]{'ResultCode','http://avatax.avalara.com/services','SeverityLevel','1','1','false'};
        private String[] Messages_type_info = new String[]{'Messages','http://avatax.avalara.com/services','ArrayOfMessage','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Operations','Expires','TransactionId','ResultCode','Messages'};
    }
    public class ValidateResult {
        public AddressSvc.ArrayOfValidAddress ValidAddresses;
        public Boolean Taxable = false;
        public String TransactionId;
        public String ResultCode = 'Exception';
        public AddressSvc.ArrayOfMessage Messages;
        private String[] ValidAddresses_type_info = new String[]{'ValidAddresses','http://avatax.avalara.com/services','ArrayOfValidAddress','0','1','false'};
        private String[] Taxable_type_info = new String[]{'Taxable','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] TransactionId_type_info = new String[]{'TransactionId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ResultCode_type_info = new String[]{'ResultCode','http://avatax.avalara.com/services','SeverityLevel','1','1','false'};
        private String[] Messages_type_info = new String[]{'Messages','http://avatax.avalara.com/services','ArrayOfMessage','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'ValidAddresses','Taxable','Version','TransactionId','ResultCode','Messages'};
    }
////////////////////////////////////////////////////////////////////////////////
// Secondary Data Structures - all directly instantiable.  Most are referenced
// as embedded members of a request or result object
////////////////////////////////////////////////////////////////////////////////
    public class Message {
        public String Summary;
        public String Details;
        public String HelpLink;
        public String RefersTo;
        public String Severity = 'Exception';
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
    public class ArrayOfValidAddress {
        public AddressSvc.ValidAddress[] ValidAddress;
        private String[] ValidAddress_type_info = new String[]{'ValidAddress','http://avatax.avalara.com/services','ValidAddress','0','-1','true'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'ValidAddress'};
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

    public class ArrayOfMessage {
        public AddressSvc.Message[] Message;
        private String[] Message_type_info = new String[]{'Message','http://avatax.avalara.com/services','Message','0','-1','true'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Message'};
    }

    public class Security {
        public AddressSvc.UsernameToken_element UsernameToken = new AddressSvc.UsernameToken_element();
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

    public class BaseAddress {
        public String AddressCode;
        public String Line1;
        public String Line2;
        public String Line3;
        public String City;
        public String Region;
        public String PostalCode;
        public String Country;
        public Integer TaxRegionId=0;
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
    public class ValidAddress {
        public String AddressCode;
        public String Line1;
        public String Line2;
        public String Line3;
        public String City;
        public String Region;
        public String PostalCode;
        public String Country;
        public Integer TaxRegionId = 0;
        public String Line4;
        public String County;
        public String FipsCode;
        public String CarrierRoute;
        public String PostNet;
        public String AddressType;
        public String Latitude;
        public String Longitude;
        public String ValidateStatus;
        public String GeocodeType;
        private String[] AddressCode_type_info = new String[]{'AddressCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Line1_type_info = new String[]{'Line1','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Line2_type_info = new String[]{'Line2','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Line3_type_info = new String[]{'Line3','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] City_type_info = new String[]{'City','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Region_type_info = new String[]{'Region','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] PostalCode_type_info = new String[]{'PostalCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Country_type_info = new String[]{'Country','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] TaxRegionId_type_info = new String[]{'TaxRegionId','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] Line4_type_info = new String[]{'Line4','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] County_type_info = new String[]{'County','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] FipsCode_type_info = new String[]{'FipsCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] CarrierRoute_type_info = new String[]{'CarrierRoute','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] PostNet_type_info = new String[]{'PostNet','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] AddressType_type_info = new String[]{'AddressType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Latitude_type_info = new String[]{'Latitude','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Longitude_type_info = new String[]{'Longitude','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ValidateStatus_type_info = new String[]{'ValidateStatus','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] GeocodeType_type_info = new String[]{'GeocodeType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Line4','County','FipsCode','CarrierRoute','PostNet','AddressType','Latitude','Longitude','AddressCode','Line1','Line2','Line3','City','Region','PostalCode','Country','TaxRegionId'};
    }
////////////////////////////////////////////////////////////////////////////////
// helper classes - visible to other classes within CBAddressSvc, 
// but not to the end user
////////////////////////////////////////////////////////////////////////////////
    public class IsAuthorizedResponse_element {
        public AddressSvc.IsAuthorizedResult IsAuthorizedResult;
        private String[] IsAuthorizedResult_type_info = new String[]{'IsAuthorizedResult','http://avatax.avalara.com/services','IsAuthorizedResult','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'IsAuthorizedResult'};
    }
    public class PingResponse_element {
        public AddressSvc.PingResult PingResult;
        private String[] PingResult_type_info = new String[]{'PingResult','http://avatax.avalara.com/services','PingResult','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'PingResult'};
    }
    public class Ping_element {
        public String Message;
        private String[] Message_type_info = new String[]{'Message','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Message'};
    }
    public class ValidateResponse_element {
        public AddressSvc.ValidateResult ValidateResult;
        private String[] ValidateResult_type_info = new String[]{'ValidateResult','http://avatax.avalara.com/services','ValidateResult','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'ValidateResult'};
    }
    public class IsAuthorized_element {
        public String Operations;
        private String[] Operations_type_info = new String[]{'Operations','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Operations'};
    }
    public class Validate_element {
        public AddressSvc.ValidateRequest ValidateRequest;
        private String[] ValidateRequest_type_info = new String[]{'ValidateRequest','http://avatax.avalara.com/services','ValidateRequest','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'ValidateRequest'};
    }
}