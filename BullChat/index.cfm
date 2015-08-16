<cfoutput>Hello World</cfoutput>
<cfdump var="#application#">

<cfquery datasource="#application.datasource.bullchat#" name="bullchat_users">
SELECT *
  FROM
	[bc_users]
</cfquery>

<cfdump var="#bullchat_users#">