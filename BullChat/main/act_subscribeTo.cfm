<cfparam name="form.clientID" default="">

	<cfquery name="guestUser" datasource="#application.datasource.bullchat#">
        INSERT INTO guest_users (
			clientID,
			username,
			image,
			profile,
			address,
			latitude,
			longitude,
			country,
			region,
			city,
			ip,
			status
		) VALUES (
			<cfqueryparam cfsqltype="cf_sql_integer" value="#form.clientID#">,
			<cfqueryparam cfsqltype="cf_sql_varchar" value="#session.username#">,
			<cfqueryparam cfsqltype="cf_sql_varchar" value="default.png">,
			<cfqueryparam cfsqltype="cf_sql_varchar" value="#session.description#">,
			<cfqueryparam cfsqltype="cf_sql_varchar" value="#session.address#">,
			<cfqueryparam cfsqltype="cf_sql_varchar" value="#session.latitude#">,
			<cfqueryparam cfsqltype="cf_sql_varchar" value="#session.longitude#">,
			<cfqueryparam cfsqltype="cf_sql_varchar" value="#session.country#">,
			<cfqueryparam cfsqltype="cf_sql_varchar" value="#session.region#">,
			<cfqueryparam cfsqltype="cf_sql_varchar" value="#session.city#">,
			<cfqueryparam cfsqltype="cf_sql_varchar" value="#session.ip#">,
			<cfqueryparam cfsqltype="cf_sql_integer" value="1">
		) SELECT @@IDENTITY AS userID
	</cfquery>

	<cfif session.tempImage NEQ "">
		<cfset fileName = form.clientID & "_" & dateFormat(now(), "dd-mm-yy_h-mm-ss") & "." & session.tempImageExt>
		<cffile action="rename" source="#Application.path.root#\profilePics\#session.tempImage#" destination="#Application.path.root#\profilePics\#fileName#" />

		<cfquery datasource="#application.datasource.bullchat#" name="qryUpdate">
			UPDATE [guest_users]
	        SET [image] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(filename)#">
			WHERE [clientID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#clientID#">
		</cfquery>
	</cfif>

	<cfdump var="#session#">