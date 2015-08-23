<cfparam name = "form.username" default="">
<cfparam name = "form.description" default="">
<cfparam name = "form.address" default="">
<cfparam name = "form.longitude" default="">
<cfparam name = "form.latitude" default="">
<cfparam name = "form.country" default="">
<cfparam name = "form.region" default="">
<cfparam name = "form.city" default="">
<cfparam name = "form.ip" default="">
<cfif form.username NEQ "">

	<cfif form.fileToUpload NEQ "">
		<cffile action="upload" fileField="form.fileToUpload" destination="#Application.path.root#\profilePics" nameconflict="makeunique" />
		<cfset session.tempImage = cffile.serverFileName & "." & cffile.serverFileExt>
		<cfset session.tempImageExt = cffile.serverFileExt>
	</cfif>

	<cfscript>
		session.username = form.username;
		session.description = form.description;
		session.address = form.address;
		session.longitude = form.longitude;
		session.latitude = form.latitude;
		session.country = form.country;
		session.region = form.region;
		session.city = form.city;
	</cfscript>

	<cfoutput>1</cfoutput>

</cfif>