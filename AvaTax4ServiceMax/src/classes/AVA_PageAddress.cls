// generic address class for conversion between BaseAddress, TaxAddress, ValidAddress, etc.
global with sharing class AVA_PageAddress
{
      global String Line1 {get; set;}
      global String Line2 {get; set;}
      global String Line3 {get; set;}
      global String City {get; set;}
      global String Region {get; set;}
      global String PostalCode {get; set;}
      global String Country {get; set;}

      public AVA_PageAddress()
      {
      }
 
      public AVA_PageAddress(AVA_AddressSvc.BaseAddress validatedBaseAddResult)
      {
          Line1 = validatedBaseAddResult.Line1;
          Line2 = validatedBaseAddResult.Line2;
          Line3 = validatedBaseAddResult.Line3;
          City = validatedBaseAddResult.City;
          Region = validatedBaseAddResult.Region;
          PostalCode = validatedBaseAddResult.PostalCode;
          Country = validatedBaseAddResult.Country;
      }

      public AVA_PageAddress(AVA_AddressSvc.ValidAddress validatedResult)
      {
          Line1 = validatedResult.Line1;
          Line2 = validatedResult.Line2;
          Line3 = validatedResult.Line3;
          City = validatedResult.City;
          Region = validatedResult.Region;
          PostalCode = validatedResult.PostalCode;
          Country = validatedResult.Country;
      }
    
      public AVA_AddressSvc.BaseAddress PageAddressToBaseAddress()
      {
        AVA_AddressSvc.BaseAddress validatedReturnResult = new AVA_AddressSvc.BaseAddress();
        validatedReturnResult.Line1 = Line1;
        validatedReturnResult.Line2 = Line2;
        validatedReturnResult.Line3 = Line3;
        validatedReturnResult.City = City;
        validatedReturnResult.Region = Region;
        validatedReturnResult.PostalCode = PostalCode;
        validatedReturnResult.Country = Country;
        return validatedReturnResult;
      }
      
}