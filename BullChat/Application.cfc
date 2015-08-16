<cfscript>

component
	output = "false"
	hint = "I define the application settings and event handlers."
	{


	// Define the application settings.
	this.name = hash( getCurrentTemplatePath() );
	this.applicationTimeout = createTimeSpan( 0, 0, 10, 0 );
	this.sessionManagement = false;

	// Get the current directory and the root directory so that we can
	// set up the mappings to our components.
	this.appDirectory = getDirectoryFromPath( getCurrentTemplatePath() );
	this.projectDirectory = ( this.appDirectory & "../../" );

	// Map to our Lib folder so we can access our project components.
	this.mappings[ "/lib" ] = ( this.projectDirectory & "lib/" );

	// Map to our Vendor folder so we can access 3rd-party components.
	this.mappings[ "/vendor" ] = ( this.projectDirectory & "vendor/" );


	// I initialize the request.
	public boolean function onRequestStart(){

		// Store the credentials for the Pusher App API.
		// *********************************************************
		// THESE ARE DEMO CREDENTIALS AND SHOULD NOT BE USED IN YOUR
		// PRODUCTION APP; THEY ARE FOR SANDBOX USE AND HAVE HARD
		// LIMITS ON CONNECTIONS AND MESSAGES. SWAP THESE OUT WHEN
		// YOU IMPLEMENT THIS LIBRARY.
		// *********************************************************
		request.pusherAppID = "1577";
		request.pusherKey = "967025141727846f5a79";
		request.pusherSecret = "5a7fd901cdf3e73c18b5";
		// *********************************************************

		// Create an instance of our pusher component using our demo
		// credentials and the Crypto library.
		request.pusher = new lib.Pusher(
			appID = request.pusherAppID,
			appKey = request.pusherKey,
			appSecret = request.pusherSecret,
			crypto = new vendor.crypto.Crypto()
		);

		// Return true so the page can load.
		return( true );

	}


}

</cfscript>

<!--- <cfcomponent name="bullchat">
	<cfset basePath = getDirectoryFromPath(getCurrentTemplatePath())>

	<cfset filepathDelimiter = "\">
	<cfif server.os.name contains 'Mac' OR server.os.name contains 'Linux'>
		<cfset filepathDelimiter = "/">
		<!---<cfset filepathSystem = createObject("java", "java.net.InetAddress").localhost.getCanonicalHostName()>--->
	</cfif>

	<cfset THIS.name				= "bullchat">
	<cfset THIS.clientmanagement	= "Yes">
	<cfset THIS.sessionmanagement	= "Yes">
	<cfset THIS.applicationtimeout	= "#CreateTimeSpan(0,0,25,0)#">
	<cfset THIS.sessiontimeout		= "#CreateTimeSpan(0,0,20,0)#">

	<cfset THIS.SessionManagement 	= true />

 	<!--- <cfset THIS.mappings["/Webcfc"] = "#basePath#_handlers#filepathDelimiter#"> --->

<cfscript>

	// Define the application settings.
	this.name = hash( getCurrentTemplatePath() );
	this.applicationTimeout = createTimeSpan( 0, 0, 10, 0 );
	this.sessionManagement = false;

	// Get the current directory and the root directory so that we can
	// set up the mappings to our components.
	this.appDirectory = getDirectoryFromPath( getCurrentTemplatePath() );
	this.projectDirectory = ( this.appDirectory & "../../" );

	// Map to our webCFC folder so we can access our project components.
	this.mappings[ "/webcfc" ] = ( this.projectDirectory & "_handlers/" );

	// Map to our Lib folder so we can access our project components.
	this.mappings[ "/lib" ] = ( this.projectDirectory & "_handlers/" );

	// Map to our Vendor folder so we can access 3rd-party components.
	this.mappings[ "/vendor" ] = ( this.projectDirectory & "_vendor/" );

</cfscript>

	<cffunction name="onApplicationStart">
		<cfscript>
			Application.datasource.bullchat = 'bullchat'; //default value - this is reset when in dev/dwevelopment environment
			Application.environment 		= 'production';
			Application.customUserAgent		= "fg!g2T3Egt^*";

			Application.domain.ga 			= 'UA-47079499-1';	//update ga code
			Application.domain.name 		= 'bullchat.gr';

			Application.filePath.root		= basePath;
			Application.filePath.delimiter 	= filepathDelimiter;
			application.paths.files			= "#Application.filePath.root#_files#Application.filePath.delimiter#";

			bullchat = 'bullchat';

			domainURL = replace(cgi.SERVER_NAME, 'www.', '');
			if (domainURL EQ '127.0.0.1'  OR domainURL EQ 'localhost' or find('192.168.254', domainURL)) ///OR domainURL EQ 'int.petro21.com'
				{
					Application.datasource.bullchat	= "bullchat";
					Application.environment		= "development";
					Application.title			= 'LOCAL bullchat.gr';
					Application.urls.bullchat	= 'http://#CGI.HTTP_HOST#/bullchat';
					Application.urls.includes	= '';///lkeave blank so that it collect local files for editing testing
					Application.urls.includesSub= '../';
					Application.urls.ga			= '';	//update ga code
					parentPath 					= GetDirectoryFromPath(GetDirectoryFromPath(GetCurrentTemplatePath()).ReplaceFirst( "[\\\/]{1}$", "" ));
					grandParentPath 			= GetDirectoryFromPath(parentPath.ReplaceFirst( "[\\\/]{1}$", "" ));
					application.paths.library	= "#grandParentPath#files#Application.filePath.delimiter#";
				}

			else
				{
					Application.environment		= "production";
					Application.urls.bullchat 	= 'http://www.bullchat.gr';
					Application.urls.includes	= 'http://static.bullchat.gr/';
					Application.urls.includesSub= 'http://static.bullchat.gr/';
					Application.urls.Title 		= 'bullchat.gr';
					Application.urls.ga 		= 'UA-47079499-1';	//update ga code
					application.paths.library	= "G:\files\";


				}

		</cfscript>
	</cffunction>

	<cffunction name="onSessionStart">

	</cffunction>

	<cffunction name="onRequestStart">
		<cfargument type="String" name="targetPage" required=true/>

		<cfinclude template="_initQueries/index.cfm" >

		<cfif StructKeyExists(URL,"resetme") AND URL.resetme>
			<cfset onApplicationStart()>
		</cfif>

		<cfscript>
			// Store the credentials for the Pusher App API.
			// *********************************************************
			// THESE ARE DEMO CREDENTIALS AND SHOULD NOT BE USED IN YOUR
			// PRODUCTION APP; THEY ARE FOR SANDBOX USE AND HAVE HARD
			// LIMITS ON CONNECTIONS AND MESSAGES. SWAP THESE OUT WHEN
			// YOU IMPLEMENT THIS LIBRARY.
			// *********************************************************
			request.pusherAppID = "1577";
			request.pusherKey = "967025141727846f5a79";
			request.pusherSecret = "5a7fd901cdf3e73c18b5";
			// *********************************************************

			// Create an instance of our pusher component using our demo
			// credentials and the Crypto library.
			request.pusher = new lib.Pusher(
				appID = request.pusherAppID,
				appKey = request.pusherKey,
				appSecret = request.pusherSecret,
				crypto = new vendor.crypto.Crypto()
			);

			// Return true so the page can load.
			return( true );
		</cfscript>

	</cffunction>


	<cffunction name="onRequest">
			<cfargument name = "targetPage" type="String" required=true/>
			<cfinclude template=#Arguments.targetPage#>
	</cffunction>


	<cffunction name="onRequestEnd">
		<cfargument type="String" name="targetPage" required=true/>
	</cffunction>


	<cffunction name="onSessionEnd">
		<cfargument name="SessionScope" required="true" type="struct">
		<cfargument name="ApplicationScope" required="true" type="struct">
		<cfset session.portalaccess = "false">
	</cffunction>


	<cffunction name="onApplicationEnd">
		<cfargument name="ApplicationScope" required=true/>
	</cffunction>

	<cffunction name="onError" returntype="void" output="true" access="public">
		<cfargument name="exception" type="any" required="true" />
  		<cfargument name="eventName" type="string" required="true" />

		<cfscript>
			///if in development make dump to screeen
	        //if (Application.environment == "development" ) {
	          writeDump(arguments.exception);
	          //abort;
	        //}
		</cfscript>

	</cffunction>

</cfcomponent>



<!--- component output="false" {

	<cfset basePath = getDirectoryFromPath(getCurrentTemplatePath())>


	<cfset filepathDelimiter = "/">
	<cfif server.os.name contains 'Mac' OR server.os.name contains 'Linux'>
		<cfset filepathDelimiter = "/">
		<!---<cfset filepathSystem = createObject("java", "java.net.InetAddress").localhost.getCanonicalHostName()>--->
	</cfif>

	<cfset THIS.name				= "petro21">
	<cfset THIS.clientmanagement	= "Yes">
	<cfset THIS.sessionmanagement	= "Yes">
	<cfset THIS.applicationtimeout	= "#CreateTimeSpan(0,0,25,0)#">
	<cfset THIS.sessiontimeout		= "#CreateTimeSpan(0,0,20,0)#">

	<cfset THIS.SessionManagement 	= true />
	<!---<cfset THIS.SetClientCookies 	= false />--->
 <!---	<cfset THIS.customtagpaths 		= "#basePath#_components#filepathDelimiter#">--->

 	<cfset THIS.mappings["/Webcfc"] = "#basePath#_handlers#filepathDelimiter#">


	if(Find("127.0.0.1",cgi.HTTP_HOST) OR FindNoCase("localhost",cgi.HTTP_HOST) or find('192.168.254' ,cgi.HTTP_HOST)){
		THIS.environment="development";
        THIS.name		= "bullchat-development";
	}
	else{
		THIS.environment="production";
        THIS.name		= "bullchat";
	}

	basePath = getDirectoryFromPath(getCurrentTemplatePath());

	//determine the filepath delimiter - '/' on Linux or Mac OS X, '\' on Windows
	filepathDelimiter = "/";
    if(server.os.name contains 'Windows')
    	{
			filepathDelimiter = "\";
    	}
	else if(server.os.name contains 'Mac' OR server.os.name contains 'linux')
    	{
			filepathDelimiter = "/";
        }

	THIS.sessionManagement			= "true";
	THIS.applicationtimeout			= CreateTimeSpan(0,2,0,0);
	THIS.sessiontimeout				= createTimeSpan(0,1,0,0);
	THIS.clientManagement			= true;

	THIS.mappings["/modules"]		= "#basepath#_modules#filepathDelimiter#";
	THIS.mappings["/handlers"]		= "#basepath#_handlers#filepathDelimiter#";

	dsnBullChat = "bullchat";
	dsnDB_admin = "DBK_admin";
	// login details for the Databank
	dsnDB.dsn	= "bullchat";
	dsnDB.usr	= "bullchat";
	dsnDB.pwd	= "Vegas451452!";

   /* **************************** APPLICATION METHODS **************************** */

	public boolean function onApplicationStart() {
		parentPath = GetDirectoryFromPath(GetDirectoryFromPath(GetCurrentTemplatePath()).ReplaceFirst( "[\\\/]{1}$", "" ));
		grandParentPath = GetDirectoryFromPath(parentPath.ReplaceFirst( "[\\\/]{1}$", "" ));
		application.filepathDelimiter = filepathDelimiter;

		switch(THIS.environment){
			case "development": //local machine
				application.datasource.bullchat			= "mssql.flinthosts.co.uk:1432";
				break;

			case "production":
				application.datasource.bullchat			= "mssql.flinthosts.co.uk:1432";
				break;
		}

		return true;
	}

	public void function onSessionStart() {
		//session.loggedin=false;
		return;
	}

	public boolean function onRequestStart(required string template) {

		if(structKeyExists(url, 'resetme')) {
			onApplicationStart();
		}

		return true;
	}

	public void function onCFCRequest(required string cfcname, required string method, required string args) {
		return;
	}


	public void function onRequestEnd() {
		return;
	}


	public void function onSessionEnd(struct ApplicationScope,required struct Session) {
		return;
	}


	public void function onApplicationEnd(struct ApplicationScope=structNew()) {
		return;
	}


	public boolean function onMissingTemplate(required string TargetPage) {
		return true;
	}

 	public void function onError(exception,eventname) {

		/*

		//writeDump(arguments.exception.rootcause.message);
		//if( isDefined("ARGUMENTS.exception.RootCause.Message") ) {
			if(arguments.exception.rootcause.message == "SessionTimeout") {
				include "AjaxSessionTime.cfm";
				throw(message=arguments.exception.rootcause.message);
				abort;
			}
			//writelog(file='application', text='my onerror ran: #serializejson(arguments.exception.rootcause.message)#');
		//}else{
		//	writeDump(exception);
		//}

		 */

		writeDump(exception);

		savecontent variable="error_text"{
			WriteOutput("An error occurred: http://#cgi.server_name##cgi.script_name#?#cgi.query_string#");
			WriteOutput("referrer: "& cgi.HTTP_REFERER);
			WriteOutput("Time: " & dateFormat(now(), "short") & timeFormat(now(), "short"));

			writeDump(exception);
			//writeDump(session);
			writeDump(form);
			writeDump(url);
		}


		/*

        if (THIS.environment == "development") {
          	OfficeErrorMailer(arguments.exception);
          	//abort;
        }

        */

		 //writelog(file="myoffice", text=error_text);
		 OfficeErrorMailer(error_text);

	}

   /* **************************** OTHER METHODS **************************** */


	public void function OfficeErrorMailer(vari){

		local.mailerService = new mail();
		local.mailerService.setTo('alexdaskalakis@hotmail.com');
		local.mailerService.setFrom('error@bullchat.gr');
		local.mailerService.setSubject('Error on bullchat.gr ');
		local.mailerService.setType('html');
		local.mailerService.send(body= vari);
	}

} ---> --->