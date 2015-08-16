<cfoutput>This page is under construction...</cfoutput>

<cfif StructKeyExists(URL,"run")>

	<cfdump var="#application#">

	<cfquery datasource="#application.datasource.bullchat#" name="bullchat_users">
	SELECT *
	  FROM
		[bc_users]
	</cfquery>

	<cfdump var="#bullchat_users#">

</cfif>