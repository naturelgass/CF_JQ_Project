<cfcomponent name="secure" output="true">

	<cfset filepathDelimiter = "\">
	<cfif server.os.name contains 'Mac' OR server.os.name contains 'Linux'>
		<cfset filepathDelimiter = "/">
	</cfif>

	<cfset this.name = "WebSocketDemo">
	<cfset this.wschannels = [{name="chat"}]>

	<cfset THIS.clientmanagement	= "Yes">
	<cfset THIS.sessionmanagement	= "Yes">
	<cfset THIS.applicationtimeout	= "#CreateTimeSpan(0,0,35,0)#">
	<cfset THIS.sessiontimeout		= "#CreateTimeSpan(0,0,25,0)#">

	<cfset THIS.SessionManagement 	= true />
	<!---<cfset THIS.SetClientCookies 	= false />--->
 	<!---	<cfset THIS.customtagpaths 		= "#basePath#_components#filepathDelimiter#">--->

	<cfscript>
		session.clientID = "";
		session.username = "";
		session.profile = "";
		session.image = "default.png";
		session.address = "";
		session.longitude = "";
		session.latitude = "";
		session.city = "";
		session.region = "";
		session.country = "";
		session.ip = "#CGI.REMOTE_ADDR#";
		session.tempImage = "";
		session.tempImageExt = "";
	</cfscript>

	<cffunction name="onApplicationStart">
		<cfscript>

			application.root = getDirectoryFromPath(getCurrentTemplatePath());
			THIS.mappings["/_handlers"] 	= "#application.root#_handlers#filepathDelimiter#";

			Application.path.root			= getDirectoryFromPath(getCurrentTemplatePath());
			Application.filePath.delimiter 	= "\";
			Application.server.type 		= server.os.name;
			if(server.os.name contains 'Mac' OR server.os.name contains 'linux'){
				Application.filePath.delimiter = "/";
		    }
		    parentPath 					= GetDirectoryFromPath(GetDirectoryFromPath(GetCurrentTemplatePath()).ReplaceFirst( "[\\\/]{1}$", "" ));
			grandParentPath 			= GetDirectoryFromPath(parentPath.ReplaceFirst( "[\\\/]{1}$", "" ));
			application.paths.library	= "#grandParentPath#files#Application.filePath.delimiter#";


		    THIS.mappings["/_handlers"] = "#Application.path.root#_handlers#Application.filePath.delimiter#";

			//datasources
			Application.datasource.bullchat 	= 'bullchat';
			Application.error.domain 	= '@bullchat.com';


			domainURL = replace(cgi.SERVER_NAME, 'www.', '');
			if (domainURL EQ '127.0.0.1'  OR domainURL EQ 'localhost' or find('192.168.254', domainURL))
				{
					Application.environment 	= 'development';
					Application.domain.name 	= 'bullchat.gr';
					Application.urls.bullchat	= 'http://#CGI.HTTP_HOST#/bullchat';
					Application.urls.profilePics = 'http://#CGI.HTTP_HOST#/bullchat/profilePics/';

					parentPath 					= GetDirectoryFromPath(GetDirectoryFromPath(GetCurrentTemplatePath()).ReplaceFirst( "[\\\/]{1}$", "" ));
					grandParentPath 			= GetDirectoryFromPath(parentPath.ReplaceFirst( "[\\\/]{1}$", "" ));
					granGranParentPath 			= GetDirectoryFromPath(grandParentPath.ReplaceFirst( "[\\\/]{1}$", "" ));
					application.paths.library	= "#granGranParentPath#files#Application.filePath.delimiter#";
					application.paths.files		= "#granGranParentPath#bullchat#Application.filePath.delimiter#www_root#Application.filePath.delimiter#_files#Application.filePath.delimiter#";
				}
			else
				{
					Application.environment		= "production";
					Application.domain.name 	= 'www.bullchat.gr';
					application.paths.files		= "#parentPath#bullchat#Application.filePath.delimiter#_files#Application.filePath.delimiter#";
				}

		</cfscript>

	</cffunction>

	<cffunction name="onSessionStart">
	</cffunction>

	<cffunction name="onRequestStart">
		<cfargument type="String" name="targetPage" required=true/>

		<cfif StructKeyExists(URL,"resetme") AND URL.resetme >
			<cfset onApplicationStart()>
		</cfif>
	</cffunction>


	<cffunction name="onRequest">
		<cfargument name="TargetPage" type="String" required=true >
		<cfinclude template="#ARGUMENTS.TargetPage#" />
	</cffunction>



	<cffunction name="onRequestEnd">
		<cfargument type="String" name="targetPage" required=true >

	</cffunction>



	<cffunction name="onSessionEnd">
		<cfargument name="SessionScope" required="true" type="struct">
		<cfargument name="ApplicationScope" type="struct" required="false" default="#StructNew()#"/>
		<cfset session.portalaccess = "false">
		<cfreturn />
	</cffunction>



	<cffunction name="onApplicationEnd">
		<cfargument name="ApplicationScope" required=true/>
	</cffunction>


	<cffunction name="onMissingTemplate"  output="true"><!---returnType="boolean"--->
        <cfargument name="targetpage" type="String" required="true" />

		<cfsavecontent variable="variables.error">
			<cfoutput>
				<h5>an error has occurred on http://#cgi.server_name##cgi.script_name#?#cgi.query_string#</h5>
				<h4>request came from #cgi.HTTP_REFERER#</h4>
	            | pageName: #arguments.targetpage#
            </cfoutput>

			<cfdump var="#arguments#" label="arguments">
			<cfdump var="#cgi#" label="cgi">
			<cfdump var="#url#" label="url">
			<cfdump var="#form#" label="form">
			<cfdump var="#session#" label="session">
			<cfdump var="#Application#" label="Application">
		</cfsavecontent>


		<cfscript>
			errorMailer(variables.error);

			include "errors/act_page_missing.cfm";
		</cfscript>


	</cffunction>


	<cffunction name="onError" returnType="void">
	    <cfargument name="exception" required="true">
		<cfargument name="eventname" type="string" required="true">

	    <!--- Do not process this error. Return out. --->
	    <cfif NOT CompareNoCase( ARGUMENTS.Exception.RootCause.Type, "coldfusion.runtime.AbortException")>
	    	<cfreturn />
		<cfelse>

			<cfscript>

			///if in development make dump to screeen
		    if (Application.environment == "development" ) {
		        writeDump(arguments.exception);
		        //abort;
		    }


			if( isDefined("ARGUMENTS.exception.RootCause.Message") ) {
				if(arguments.exception.rootcause.message == "SessionTimeout") {
					include "AjaxSessionTime.cfm";
					throw(message=arguments.exception.rootcause.message);
				}

			}else{


			}
			</cfscript>

			<cfsavecontent variable="variables.error">
				<cfoutput>
				<h5>an error has occurred on http://#cgi.server_name##cgi.script_name#?#cgi.query_string#</h5>
				<h4>request came from #cgi.HTTP_REFERER#</h4>
	            | EventName: #arguments.eventName#<br>
	            | Detail: #arguments.exception.detail#<br>
	            | Message: #arguments.exception.message#<br>
	            | StackTrace: #arguments.exception.stackTrace#<br>
	            | Type: #arguments.exception.type#<br>
	            | name: #arguments.exception.name#<br>
            	</cfoutput>

				<cfdump var="#arguments#" label="arguments">
				<cfdump var="#cgi#" label="cgi">
				<cfdump var="#url#" label="url">
				<cfdump var="#form#" label="form">
				<cfdump var="#session#" label="session">
				<cfdump var="#Application#" label="Application">
			</cfsavecontent>

			<cfset errorMailer(variables.error)>


			<cfinclude template="errors/act_page_error.cfm" >
		</cfif>
	</cffunction>




	<cffunction name="errorMailer">
		<cfargument name="message" type="string">

		<cfmail
			from="error#Application.error.domain#"
			subject="Error on bullchat #Application.environment# [@ #Now()#]"
			to="alex@glopac.com"
			type="html">
				#arguments.message#
		</cfmail>
	</cffunction>

</cfcomponent>