<configuration version="2">
  <grid id="workOrderSettings" autorefresh="false" refreshtime="7" sortColumn="Name" sortOrder="DESC" columnIndex="0" filterColumn="Name" woHoverColor="0" defaultView="" woSelectionColor="16711731" resetTime="false" unassignWO="false">
    <selectedcolumns>
      <column name="Name" width="145.78841309823676"/>
      <column name="SVMXC__Company__c" width="141.26784214945425"/>
      <column name="SVMXC__Contact__c" width="126.575986565911"/>
      <column name="SVMXC__Case__c" width="94.93198992443318"/>
      <column name="SVMXC__Priority__c" width="57.63727959697732"/>
      <column name="SVMXC__Order_Status__c" width="79.10999160369435"/>
      <column name="SVMXC__Order_Type__c" width="120.92527287993283"/>
      <column name="SVMXC__Dispatch_Status__c" width="94.93198992443318"/>
      <column name="SVMXC__Group_Member__c" width="100"/>
      <column name="SVMXC__City__c" width="81.37027707808564"/>
    </selectedcolumns>
    <rules>
      <rule name="Critical Work Orders" status="TAG168" expression="" color="16750848">
        <row property="SVMXC__Priority__c" type="" fieldType="picklist" compare="matches" value="Critical"/>
      </rule>
      <rule name="High Priority Work Orders" status="TAG168" expression="" color="16737996">
        <row property="SVMXC__Priority__c" type="" fieldType="picklist" compare="matches" value="High"/>
      </rule>
      <rule name="Medium Priority Work Orders" status="TAG168" expression="" color="16776960">
        <row property="SVMXC__Priority__c" type="" fieldType="picklist" compare="matches" value="Medium"/>
      </rule>
    </rules>
  </grid>
  <grid id="technicianSettings" view="territory" map="true" mapDefaultZoomLevel="7" mapDefaultLat="34.079962" mapDefaultLng="-118.23761" loglevel="WARN" noOfDays="0" condition="before" refreshEventsOnChange="false" retainDateOnShowRoute="true" autoCalculateEndDate="true" eventRowColor="11723263" driveColor="39372" overheadColor="16750848" defaultEventColor="13421568" defaultWOEventColor="16776960" relatedEventColor="10066329" viewAllEventsForToday="false" toolTipShowDelay="0" toolTipHideDelay="3000" pinMapActionBar="true" showFieldUpdates="false" showTimeIndicator="true" timeIndicatorColor="255" autoSyncServiceDuration="false" dataTipOnClick="true">
    <selectedcolumns>
      <column name="Name" width="160"/>
    </selectedcolumns>
    <rules>
      <rule name="Call" status="TAG168" expression="" color="16750848">
        <row property="Subject" type="EVENT" fieldType="combobox" compare="matches" value="Call"/>
      </rule>
      <rule name="Email" status="TAG168" expression="" color="65280">
        <row property="Subject" type="EVENT" fieldType="combobox" compare="matches" value="Email"/>
      </rule>
      <rule name="Meeting" status="TAG168" expression="" color="255">
        <row property="Subject" type="EVENT" fieldType="combobox" compare="matches" value="Meeting"/>
      </rule>
      <rule name="Send Letter/Quote" status="TAG168" expression="" color="65535">
        <row property="Subject" type="EVENT" fieldType="combobox" compare="matches" value="Send Letter/Quote"/>
      </rule>
      <rule name="Other" status="TAG168" expression="" color="16711935">
        <row property="Subject" type="EVENT" fieldType="combobox" compare="matches" value="Other"/>
      </rule>
    </rules>
    <team favourite="">
      <sequence>{}</sequence>
    </team>
    <territory favourite="">
      <sequence>{}</sequence>
    </territory>
    <advncedTechSearch>
      <skills show="true" includeForSearch="true"/>
      <productExpertise show="true" includeForSearch="true"/>
      <eligibility show="true" includeForSearch="true"/>
      <prefTech show="true" includeForSearch="true"/>
    </advncedTechSearch>
  </grid>
  <grid id="keywordSettings">
    <selectedcolumns>
      <column name="SVMXC__Case__c" width="0"/>
      <column name="SVMXC__City__c" width="0"/>
      <column name="SVMXC__Component__c" width="0"/>
      <column name="SVMXC__Order_Status__c" width="0"/>
      <column name="SVMXC__Order_Type__c" width="0"/>
      <column name="SVMXC__State__c" width="0"/>
      <column name="SVMXC__Zip__c" width="0"/>
    </selectedcolumns>
  </grid>
  <grid id="teamKeywordSettings" matchcriteria="any">
    <selectedcolumns>
      <column name="SVMXC__City__c" width="0"/>
      <column name="SVMXC__Country__c" width="0"/>
    </selectedcolumns>
  </grid>
  <grid id="techKeywordSettings" matchcriteria="any">
    <selectedcolumns>
      <column name="SVMXC__City__c" width="0"/>
      <column name="EXPERTISE" width="0"/>
      <column name="Name" width="0"/>
      <column name="PRODUCT" width="0"/>
    </selectedcolumns>
  </grid>
  <appDimensions>
    <dc width="1080"/>
	<map width="269"/>
  </appDimensions>
</configuration>