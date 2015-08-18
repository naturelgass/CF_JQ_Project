<cfparam name="url.uid" default="0">

<cfquery datasource="#Application.datasource.bullchat#" name="qryUser">
	SELECT
		[userID]
		,[username]
		,[datetime]
		,[active]
	FROM
		[bc_guests]
	WHERE
		[userID] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#url.uid#">
</cfquery>

<cfquery datasource="#Application.datasource.bullchat#" name="qryActiveUsers">
	SELECT
		[userID]
		,[username]
		,[datetime]
		,[active]
	FROM
		[bc_guests]
	WHERE
		[active] = <cfqueryparam cfsqltype="cf_sql_integer" value="1">
</cfquery>

<cfscript>
	session.userID = qryUser.userID;
	session.username = qryUser.username;
	session.datetime = qryUser.datetime;
	session.active = qryUser.active;
	session.toUserID = 0;
</cfscript>