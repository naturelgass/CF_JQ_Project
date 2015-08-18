<cfparam name="form.username" default="">
<cfparam name="form.guest" default="">

<cfoutput>
<cfif StructKeyExists(form,"guest")>

	<cfquery datasource="#Application.datasource.bullchat#" name="qryGuestUser">
		SELECT
			[userID]
			,[username]
			,[datetime]
			,[active]
		FROM
			[bc_guests]
		WHERE
			[username] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.username#">
	</cfquery>

	<cfif qryGuestUser.recordcount EQ 0>

		<cfsilent>

		<cfset gustUserID = RandRange(111111, 999999)>
		<cfset datatime = CREATEODBCDATETIME( Now() ) />

		<cfquery datasource="#Application.datasource.bullchat#" name="qryNewUser">
		    INSERT INTO [bc_guests]
		        (
				[userID]
				,[username]
				,[datetime]
				,[active]
		        )
		    VALUES
		        (
		          <cfqueryparam cfsqltype="cf_sql_integer" value="#gustUserID#">
		         ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.username#">
		         ,<cfqueryparam cfsqltype="cf_sql_timestamp" value="#datatime#">
		         ,<cfqueryparam cfsqltype="cf_sql_integer" value="1">
		         )
		</cfquery>

		</cfsilent>#gustUserID#<cfelse>0</cfif>
</cfif>
</cfoutput>