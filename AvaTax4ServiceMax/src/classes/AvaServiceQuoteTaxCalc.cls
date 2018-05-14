public with sharing class AvaServiceQuoteTaxCalc 
extends AvaBaseTaxCalc 
{
	public AvaServiceQuoteTaxCalc (ApexPages.StandardController controller)
	{
		m_apCurPage = ApexPages.currentPage();
	}
	
	public AvaServiceQuoteTaxCalc()
	{
		m_apCurPage = ApexPages.currentPage();
	}
	
	void UpdateTaxData(AVA_SVMXC.TaxSvc.GetTaxResult CalcResult)
	{
		List<SVMXC__Quote_Line__c> SQLineList = new List<SVMXC__Quote_Line__c>();
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
			List<SVMXC__Quote_Line__c> curLine = [select Name, AVA_SVMXC__Sales_Tax_Amount__c, AVA_SVMXC__Sales_Tax_Details__c 
				from SVMXC__Quote_Line__c where Name =: CalcResult.TaxLines.TaxLine[tl].No];
			if(curLine.size() == 0)
			{
				throw new AvaStaticUtils.AvaException('Unable to Retrieve Line: ' + CalcResult.TaxLines.TaxLine[tl].No + ' To Update The Tax');
			}
			curLine[0].AVA_SVMXC__Sales_Tax_Amount__c = CalcResult.TaxLines.TaxLine[tl].Tax.setScale(2);
			curLine[0].AVA_SVMXC__Sales_Tax_Details__c = details;
			SQLineList.add(curLine[0]);
		}
		update SQLineList;
	}
	
	// It is assumed that the caller (AvaBaseTaxCalc.CalculateTax) catches all exceptions
	public AVA_SVMXC.TaxSvc.GetTaxRequest FetchTaxData(ID DefaultAvaTaxCompany)
	{
		List<SVMXC__Quote__c> SQList = [select Name, AVA_SVMXC__AvaTaxCompany__c, 
			SVMXC__Company__c, SVMXC__Contact__c, AVA_SVMXC__AvaTax_Entity_Use_Code__c
			from SVMXC__Quote__c where ID =: m_apCurPage.getParameters().get('id')];
		
		if(SQList.size() == 0)	// no records returned
		{
			throw new AvaStaticUtils.AvaException('Tax Calculation Was Unable to Retrieve the Service Quote Data');
		}
		
		m_apCurPage = new PageReference('/' + SQList[0].Id);
		
		List<SVMXC__Quote_Line__c> SQItemList = [select Name, SVMXC__Product__c, SVMXC__Quantity2__c, SVMXC__Line_Price2__c
			from SVMXC__Quote_Line__c where SVMXC__Quote__c =: SQList[0].Id];
		
		Integer NumLines = SQItemList.size();
		
		if(NumLines == 0)// no line items
		{
			throw new AvaStaticUtils.AvaException('Error: Service Quote \'' + SQList[0].Name + '\' does not appear to have any line items...');
		}
		
		List<Account> SQAccountList = [select Name, ID, AccountNumber, AVA_SVMXC__AvaTax_Entity_Use_Code__c,
			ShippingStreet, ShippingCity, ShippingState, ShippingPostalCode, ShippingCountry, 
			BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry 
        	from Account where ID =: SQList[0].SVMXC__Company__c];
        
        if(SQAccountList.size() == 0)
        {
        	throw new AvaStaticUtils.AvaException('Error: Cannot Fetch Account Record - This is Required for Sales Tax Calculation');
        }
        
		List<AVA_SVMXC__AvaTaxEntity_Use_Code__c> EntityUseList = [select AVA_SVMXC__Customer_Usage_Code__c 
			from AVA_SVMXC__AvaTaxEntity_Use_Code__c where ID =: SQList[0].AVA_SVMXC__AvaTax_Entity_Use_Code__c];
		
		if(EntityUseList.size() == 0)	// try Account record for default
		{
			EntityUseList = [select AVA_SVMXC__Customer_Usage_Code__c 
				from AVA_SVMXC__AvaTaxEntity_Use_Code__c where ID =: SQAccountList[0].AVA_SVMXC__AvaTax_Entity_Use_Code__c];
			
		}

		string EntityUseCode = EntityUseList.size() > 0 ? EntityUseList[0].AVA_SVMXC__Customer_Usage_Code__c.trim() : '';
		
		List<AVA_SVMXC__AvaTaxCompany__c> compList = [select Name, AVA_SVMXC__CompanyCode__c, AVA_SVMXC__CompanyAddress__c, 
			AVA_SVMXC__City__c, AVA_SVMXC__Region__c, AVA_SVMXC__PostalCode__c, AVA_SVMXC__Country__c
			from AVA_SVMXC__AvaTaxCompany__c where ID =: SQList[0].AVA_SVMXC__AvaTaxCompany__c ];
		
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
		// Quote therefore always salseorder
		rVal.DocType = 'SalesOrder';
		rVal.DocCode = SQList[0].Name.trim();
		rVal.DetailLevel = 'Tax';
		rVal.DocDate = Date.Today();	// need to discuss with Wyatt
		rVal.CustomerCode = SQAccountList[0].AccountNumber.trim() != '' ? SQAccountList[0].AccountNumber.trim() : SQAccountList[0].Name;
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
        Lines = AvaStaticUtils.parseStreetAddress(SQAccountList[0].ShippingStreet);
        tmpAddr.Line1 = Lines[0];
        tmpAddr.Line2 = Lines[1];
        tmpAddr.Line3 = Lines[2];
        tmpAddr.City = SQAccountList[0].ShippingCity;
        tmpAddr.Region = SQAccountList[0].ShippingState;
        tmpAddr.PostalCode = SQAccountList[0].ShippingPostalCode;
        tmpAddr.Country = SQAccountList[0].ShippingCountry;
        tmpAddr.AddressCode = rVal.DestinationCode;
        BaseAddressMap.put(rVal.DestinationCode, tmpAddr);

        rVal.Lines = new TaxSvc.ArrayOfLine();
        rVal.Lines.Line = new AVA_SVMXC.TaxSvc.Line[NumLines];
        
        for(Integer curLine = 0; curLine < NumLines; curLine++)
        {
        	rVal.Lines.Line[curLine] = new AVA_SVMXC.TaxSvc.Line();

        	rVal.Lines.Line[curLine].No = SQItemList[curLine].Name;
        	List<Product2> lineProd = [select Name, ProductCode, Description from Product2 where ID =: SQItemList[curLine].SVMXC__Product__c];
        	if(lineProd.size() == 0)
        	{
        		throw new AvaStaticUtils.AvaException('Unable to Determine Product for Line ' + SQItemList[curLine].Name );
        	}
        	string icode = lineProd[0].ProductCode != null ? lineProd[0].ProductCode.trim() : '';
        	rVal.Lines.Line[curLine].ItemCode = icode;
        	rVal.Lines.Line[curLine].TaxCode = icode;
        	rVal.Lines.Line[curLine].Description = lineProd[0].Description;
        	rVal.Lines.Line[curLine].Qty = SQItemList[curLine].SVMXC__Quantity2__c > 0.0 ? SQItemList[curLine].SVMXC__Quantity2__c : 1.0;
        	rVal.Lines.Line[curLine].Amount = SQItemList[curLine].SVMXC__Line_Price2__c;
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