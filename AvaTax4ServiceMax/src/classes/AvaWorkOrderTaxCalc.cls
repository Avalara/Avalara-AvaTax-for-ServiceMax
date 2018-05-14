public with sharing class AvaWorkOrderTaxCalc
extends AvaBaseTaxCalc 
{
	public AvaWorkOrderTaxCalc(ApexPages.StandardController controller)
	{
	    m_apCurPage = ApexPages.currentPage();
	}
	
	// It is assumed that the caller (AvaBaseTaxCalc.CalculateTax) catches all exceptions
	void UpdateTaxData(AVA_SVMXC.TaxSvc.GetTaxResult CalcResult)
	{
		List<SVMXC__Service_Order_Line__c> WOLineList = new List<SVMXC__Service_Order_Line__c>();
		for(Integer tl = 0; tl < CalcResult.TaxLines.TaxLine.size(); tl++)
		{
			string details = 'Line: ' + CalcResult.TaxLines.TaxLine[tl].No + ' TaxCode: ' + CalcResult.TaxLines.TaxLine[tl].TaxCode + ' Overall Rate: ' + 
				(CalcResult.TaxLines.TaxLine[tl].Rate * 100.0).setScale(3).toPlainString() + '%\r\nComponent Taxes:';
					
			for(Integer td = 0; td < CalcResult.TaxLines.TaxLine[tl].TaxDetails.TaxDetail.size(); td++)
			{
				details += '\r\n* ' + CalcResult.TaxLines.TaxLine[tl].TaxDetails.TaxDetail[td].JurisName +
					' ' + CalcResult.TaxLines.TaxLine[tl].TaxDetails.TaxDetail[td].JurisType +
					': ' + (CalcResult.TaxLines.TaxLine[tl].TaxDetails.TaxDetail[td].Rate*100.0).setScale(3).toPlainString() + '%';
			}
			List<SVMXC__Service_Order_Line__c> curLine = [select Name, AVA_SVMXC__Sales_Tax_Amount__c, AVA_SVMXC__Sales_Tax_Details__c 
				from SVMXC__Service_Order_Line__c where Name =: CalcResult.TaxLines.TaxLine[tl].No];
			if(curLine.size() == 0)
			{
				throw new AvaStaticUtils.AvaException('Unable to Retrieve Line: ' + CalcResult.TaxLines.TaxLine[tl].No + ' To Update The Tax');
			}
			curLine[0].AVA_SVMXC__Sales_Tax_Amount__c = CalcResult.TaxLines.TaxLine[tl].Tax.setScale(2);
			curLine[0].AVA_SVMXC__Sales_Tax_Details__c = details;
			WOLineList.add(curLine[0]);
		}
		update WOLineList;
	}
	
	// It is assumed that the caller (AvaBaseTaxCalc.CalculateTax) catches all exceptions
	public AVA_SVMXC.TaxSvc.GetTaxRequest FetchTaxData(ID DefaultAvaTaxCompany)
	{
		List<SVMXC__Service_Order__c> WOList = [select Name, AVA_SVMXC__AvaTaxCompany__c, 
			SVMXC__Company__c, SVMXC__Contact__c, AVA_SVMXC__AvaTax_Entity_Use_Code__c,
			AVA_SVMXC__Avalara_Document_Type__c,SVMXC__Street__c, SVMXC__City__c, 
            SVMXC__State__c, SVMXC__Zip__c, SVMXC__Country__c
			from SVMXC__Service_Order__c where ID =: m_apCurPage.getParameters().get('id')];
		
		if(WOList.size() == 0)	// no records returned
		{
			throw new AvaStaticUtils.AvaException('Tax Calculation Was Unable to Retrieve the WorkOrder Data');
		}
		
		m_apCurPage = new PageReference('/' + WOList[0].Id);
		
		List<SVMXC__Service_Order_Line__c> WODetailList = [select Name, SVMXC__Product__c, SVMXC__Actual_Quantity2__c,
			SVMXC__Total_Line_Price__c, SVMXC__From_Location__c, SVMXC__Requested_Location__c
			from SVMXC__Service_Order_Line__c where SVMXC__Service_Order__c =: WOList[0].Id];
		
		Integer NumLines = WODetailList.size();
		
		if(NumLines == 0)// no line items
		{
			throw new AvaStaticUtils.AvaException('Error: WorkOrder \'' + WOList[0].Name + '\' does not appear to have any line items...');
		}
		
		List<Account> WOAccountList = [select Name, ID, AccountNumber, AVA_SVMXC__AvaTax_Entity_Use_Code__c,
			ShippingStreet, ShippingCity, ShippingState, ShippingPostalCode, ShippingCountry, 
			BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry 
        	from Account where ID =: WOList[0].SVMXC__Company__c];
        
        if(WOAccountList.size() == 0)
        {
        	throw new AvaStaticUtils.AvaException('Error: Cannot Fetch Account Record - This is Required for Sales Tax Calculation');
        }
        
		List<Contact> WOContactList = [select Name, Email, Phone from Contact where ID =: WOList[0].SVMXC__Contact__c];
		
		List<AVA_SVMXC__AvaTaxEntity_Use_Code__c> EntityUseList = [select AVA_SVMXC__Customer_Usage_Code__c 
			from AVA_SVMXC__AvaTaxEntity_Use_Code__c where ID =: WOList[0].AVA_SVMXC__AvaTax_Entity_Use_Code__c];

		string EntityUseCode = EntityUseList.size() > 0 ? EntityUseList[0].AVA_SVMXC__Customer_Usage_Code__c.trim() : '';
		
		List<AVA_SVMXC__AvaTaxCompany__c> compList = [select Name, AVA_SVMXC__CompanyCode__c, AVA_SVMXC__CompanyAddress__c, 
			AVA_SVMXC__City__c, AVA_SVMXC__Region__c, AVA_SVMXC__PostalCode__c, AVA_SVMXC__Country__c
			from AVA_SVMXC__AvaTaxCompany__c where ID =: WOList[0].AVA_SVMXC__AvaTaxCompany__c ];
		
		if(compList.size() == 0)	// AvaCompany not specified in WorkOrder - use default
		{
			compList = [select Name, AVA_SVMXC__CompanyCode__c, AVA_SVMXC__CompanyAddress__c, 
			AVA_SVMXC__City__c, AVA_SVMXC__Region__c, AVA_SVMXC__PostalCode__c, AVA_SVMXC__Country__c
			from AVA_SVMXC__AvaTaxCompany__c where ID =: DefaultAvaTaxCompany];
			if(compList.size() == 0)	// no default company
			{
				throw new AvaStaticUtils.AvaException('No AvaTax Company Specified, and Unable to Read Default AvaTaxCompany Record');
			}
		}
	
		AVA_SVMXC.TaxSvc.GetTaxRequest rVal = new AVA_SVMXC.TaxSvc.GetTaxRequest();
		rVal.CompanyCode = compList[0].AVA_SVMXC__CompanyCode__c;
		rVal.DocType = WOList[0].AVA_SVMXC__Avalara_Document_Type__c != null ? WOList[0].AVA_SVMXC__Avalara_Document_Type__c : 'SalesOrder';
		rVal.DocCode = WOList[0].Name.trim();
		rVal.DetailLevel = 'Tax';
		rVal.DocDate = Date.Today();	// need to discuss with Wyatt
		rVal.CustomerCode = WOAccountList[0].AccountNumber.trim() != '' ? WOAccountList[0].AccountNumber.trim() : WOAccountList[0].Name;
		rVal.CustomerUsageType = EntityUseCode;
		rVal.OriginCode = 'ORIGIN';
		rVal.DestinationCode = 'DEST';
		
		rVal.Addresses = new AVA_SVMXC.TaxSvc.ArrayOfBaseAddress();

 		Map<string, AVA_SVMXC.TaxSvc.BaseAddress> BaseAddressMap = new Map<string, AVA_SVMXC.TaxSvc.BaseAddress>();
 		 		       
        List<string> Lines = AvaStaticUtils.parseStreetAddress(compList[0].AVA_SVMXC__CompanyAddress__c);
        AVA_SVMXC.TaxSvc.BaseAddress tmpAddr = new AVA_SVMXC.TaxSvc.BaseAddress();
        
        tmpAddr.Line1 = Lines[0];
        tmpAddr.Line2 = Lines[1];
        tmpAddr.Line3 = Lines[2];
        tmpAddr.City = compList[0].AVA_SVMXC__City__c;
        tmpAddr.Region = compList[0].AVA_SVMXC__Region__c;
        tmpAddr.PostalCode = compList[0].AVA_SVMXC__PostalCode__c;
        tmpAddr.Country = compList[0].AVA_SVMXC__Country__c;
        tmpAddr.AddressCode = rVal.OriginCode;
        BaseAddressMap.put(rVal.OriginCode, tmpAddr);

        tmpAddr = new AVA_SVMXC.TaxSvc.BaseAddress();
        // for destination use service location by default.  If blank, use Account shipping Address
        // maybe later use Account Billing address as third fallback
        if(WOList[0].SVMXC__Street__c != null && WOList[0].SVMXC__Street__c.trim().length() > 0)
        {
	        Lines = AvaStaticUtils.parseStreetAddress(WOList[0].SVMXC__Street__c);
	        tmpAddr.Line1 = Lines[0];
	        tmpAddr.Line2 = Lines[1];
	        tmpAddr.Line3 = Lines[2];
	        tmpAddr.City = WOList[0].SVMXC__City__c;
	        tmpAddr.Region = WOList[0].SVMXC__State__c;
	        tmpAddr.PostalCode = WOList[0].SVMXC__Zip__c;
	        tmpAddr.Country = WOList[0].SVMXC__Country__c;
        }
        else
        {
	        Lines = AvaStaticUtils.parseStreetAddress(WOAccountList[0].ShippingStreet);
	        tmpAddr.Line1 = Lines[0];
	        tmpAddr.Line2 = Lines[1];
	        tmpAddr.Line3 = Lines[2];
	        tmpAddr.City = WOAccountList[0].ShippingCity;
	        tmpAddr.Region = WOAccountList[0].ShippingState;
	        tmpAddr.PostalCode = WOAccountList[0].ShippingPostalCode;
	        tmpAddr.Country = WOAccountList[0].ShippingCountry;
        }
        tmpAddr.AddressCode = rVal.DestinationCode;
        BaseAddressMap.put(rVal.DestinationCode, tmpAddr);

        rVal.Lines = new TaxSvc.ArrayOfLine();
        rVal.Lines.Line = new AVA_SVMXC.TaxSvc.Line[NumLines];
        
        for(Integer curLine = 0; curLine < NumLines; curLine++)
        {
        	rVal.Lines.Line[curLine] = new AVA_SVMXC.TaxSvc.Line();

        	rVal.Lines.Line[curLine].No = WODetailList[curLine].Name;
        	List<Product2> lineProd = [select Name, ProductCode, Description from Product2 where ID =: WODetailList[curLine].SVMXC__Product__c];
        	if(lineProd.size() == 0)
        	{
        		throw new AvaStaticUtils.AvaException('Unable to Determine Product for Line ' + WODetailList[curLine].Name );
        	}
        	string icode = lineProd[0].ProductCode != null ? lineProd[0].ProductCode.trim() : '';
        	rVal.Lines.Line[curLine].ItemCode = icode;
        	rVal.Lines.Line[curLine].TaxCode = icode;
        	rVal.Lines.Line[curLine].Description = lineProd[0].Description;
        	rVal.Lines.Line[curLine].Qty = WODetailList[curLine].SVMXC__Actual_Quantity2__c > 0.0 ? WODetailList[curLine].SVMXC__Actual_Quantity2__c : 1.0;
        	rVal.Lines.Line[curLine].Amount = WODetailList[curLine].SVMXC__Total_Line_Price__c;
        }
        List<AVA_SVMXC.TaxSvc.BaseAddress> BaseAddressList = BaseAddressMap.values();
        rVal.Addresses.BaseAddress = new AVA_SVMXC.TaxSvc.BaseAddress[BaseAddressList.size()];
        for(Integer curAddr = 0; curAddr < BaseAddressMap.size(); curAddr++)
        {
        	rVal.Addresses.BaseAddress[curAddr] = BaseAddressList[curAddr];
        }
		return rVal;
	}
}