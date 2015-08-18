<cfinclude template="fbx_settings.cfm">

<cfset fusebox = structNew()>

<cfif isDefined('url.fa')>
  <cfset fusebox.fuseaction = url.fa>
<cfelseif isDefined('form.fa')>
  <cfset fusebox.fuseaction = form.fa>
<cfelse>
  <cfset fusebox.fuseaction = defaultFuseAction>
</cfif>

<cfoutput>
	<cfinclude template="fbx_switch.cfm">
</cfoutput>

<!--- <cfoutput>This page is under construction...</cfoutput> --->

<!--- <cfif StructKeyExists(URL,"run")>

	<cfdump var="#application#">

	<cfquery datasource="#application.datasource.bullchat#" name="bullchat_users">
	SELECT *
	  FROM
		[bc_users]
	</cfquery>

	<cfdump var="#bullchat_users#">

</cfif> --->