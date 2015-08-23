<cfquery datasource="#application.datasource.bullchat#" name="qryClientProfile">
	SELECT *
	FROM [guest_users]
	WHERE [clientID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.publisherid#">
</cfquery>

<cfoutput>
[ { "clientID" : "#form.clientID#",
	"publisherid" : "#form.publisherid#",
	"username" : "#form.username#",
	"timestamp" : "#form.timestamp#",
	"message" : "#form.message#",
	"msgtype" : "#form.msgtype#",
	"toclientid" : "#form.toclientid#",
	"image" : "#Application.urls.profilePics##qryClientProfile.image#"
 } ]</cfoutput>