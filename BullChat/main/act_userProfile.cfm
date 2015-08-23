<cfquery datasource="#application.datasource.bullchat#" name="qryClientProfile">
	SELECT *
	FROM [guest_users]
	WHERE [clientID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>