public class AvalaraPostInstall implements InstallHandler 
{
    public void onInstall(InstallContext context)
    {
        if(context.previousVersion() == null)   // first install - create a new Avalara Config Record
        {
            
            List<Entity_Use_Code__c> initialCodes = new List<Entity_Use_Code__c>
            {
                new Entity_Use_Code__c(Description__c='Non-resident (Canada)', Name ='R'),
                    new Entity_Use_Code__c(Description__c='Commercial Fishery (Canada)', Name ='Q'),
                    new Entity_Use_Code__c(Description__c='Commercial aquaculture (Canada)', Name ='P'),
                    new Entity_Use_Code__c(Description__c='Other (requires Exempt Reason Desc) (both)', Name ='L'),
                    new Entity_Use_Code__c(Description__c='Direct mail (United States)', Name ='K'),
                    new Entity_Use_Code__c(Description__c='Direct pay permit (United States)', Name ='J'),
                    new Entity_Use_Code__c(Description__c='Industrial production / manufacturer (both)', Name ='I'),
                    new Entity_Use_Code__c(Description__c='Commercial agricultural production (both)', Name ='H'),
                    new Entity_Use_Code__c(Description__c='Resale (both)', Name ='G'),
                    new Entity_Use_Code__c(Description__c='Religious or educational org (both)', Name ='F'),
                    new Entity_Use_Code__c(Description__c='Charitable or benevolent org (both)', Name ='E'),
                    new Entity_Use_Code__c(Description__c='Foreign diplomat (both)', Name ='D'),
                    new Entity_Use_Code__c(Description__c='Tribe / Status Indian / Indian Band (both)', Name ='C'),
                    new Entity_Use_Code__c(Description__c='State government (United States)', Name ='B'),
                    new Entity_Use_Code__c(Description__c='Federal government (United States)',Name='A')
                    };
                        insert initialCodes;
            
        }
        
        
    }
}