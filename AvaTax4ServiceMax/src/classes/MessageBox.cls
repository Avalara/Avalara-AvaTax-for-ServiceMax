////////////////////////////////////////////////////////////////////////////////
// MessageBox class - driver for "MessageBox" Page
////////////////////////////////////////////////////////////////////////////////
public virtual with sharing class MessageBox
{
    private List<AvaMessage__c> m_loUserMessage;
    public AvaMessage__c m_oUserMessage {get; set;}
    public MessageBox()
    {
        m_loUserMessage = [select  Title__c, MsgLine1__c, MsgLine2__c, MsgLine3__c, MsgLine4__c, MsgLine5__c, ReturnPage__c,
                           Increment__c from AvaMessage__c order by Increment__c];
        
        
        if(m_loUserMessage.size() > 0)
        {
            
            // always use the last element if more than one (should never happen)
            m_oUserMessage = m_loUserMessage[m_loUserMessage.size()-1];
            
        }
        
    }
    
    // button handler for MessageBox OK button.  Deletes all records currently in AvaMessage__c
    // then redirects to the referring page.
    public PageReference DismissPage()
    {
        String retPage = '/' + m_oUserMessage.ReturnPage__c;
        
        //Notes [Start] | Ashish Bakhtar <::> 2017-26-04 : Adding this code as a part of Salesforce Certification Security Issue Fixation | The Insert Code Part will get executed when Delete Permission Check is done | */  
        
        if ( AvaMessage__c.sObjectType.getDescribe().isDeletable())
        {
            
            delete m_oUserMessage;
        }
        //Notes [End] | Ashish Bakhtar <::> 2017-26-04 : Adding this code as a part of Salesforce Certification Security Issue Fixation | The Insert Code Part will get executed when Delete Permission Check is done | */  
        
        
        // also delete any messages with an increment value of > 24 hours ago
        DateTime n = datetime.now().addDays(-1);
        long increment = n.year() * 10000000000000L + n.dayOfYear()*10000000000L + n.hour()*100000000L + 
            n.minute()*1000000L + n.second()*10000L + n.millisecond();
        
        // Redirect the user back to the original page         
        PageReference pageRef = new PageReference(retPage);         
        
        pageRef.setRedirect(true);         
        return pageRef;               
    }
}