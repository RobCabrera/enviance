
<cfcomponent displayname="test123app">
	
	<!---Set up the application variables--->
	<cfset THIS.name = "test123app">
	<cfset THIS.ApplicationTimeout = CreateTimeSpan(0,0,30,0)>
	<cfset THIS.SessionManagement = true>
	<cfset THIS.SetClientCookies = false>
	<cfset THIS.ScriptProtect = "all">
	
	
	<cfsetting requesttimeout="30" showdebugoutput="No" enablecfoutputonly="No">
	
	
	<cffunction name="OnApplicationStart" access="public" returntype="boolean" output="no" hint="Fires when the application is first created">
	
		<cfset APPLICATION.DSN = "">
		<cfset APPLICATION.SCHEMA = "">
		<cfreturn true>
		
	</cffunction>

	
	<cffunction name="OnRequest" access="public" returntype="void" output="true" hint="Fires after pre-page processing is complete">
		<cfargument name="TargetPage" type="string" required="yes">
     	
      	<cfset VARIABLES.dsn = APPLICATION.DSN>
        <cfset VARIABLES.schema = APPLICATION.SCHEMA>
        
       	<!--- Include the requested page. It usually defaults to index.cfm--->     
        <cfinclude template="#arguments.TargetPage#">
        
        
       
	</cffunction>
	
	<cffunction name="OnError" access="public" returntype="void" output="true" hint="Fires when an exception occures that is not caught by a try/catch block">

		<!--- Define arguments. --->
		<cfargument name="Exception" type="any" required="true" />

		<cfargument name="EventName" type="string" required="false" default="" />


		<!---
			Dump out the ARGUMENTS scope. Here, we want to see
			how the argument change depending on whether or not
			we have the OnRequest() method.
			For development purposes.
		--->
		<cfif StructKeyExists( THIS, "OnRequest" )>

			<!--- Use label with onrequest. --->
			<cfdump var="#ARGUMENTS#" label="OnError() - WITH OnRequest()" 	/>

		<cfelse>

			<!--- Use label withOUT onrequest. --->
			<cfdump var="#ARGUMENTS#" label="OnError() - WITHOUT OnRequest()" />

		</cfif>

		<!--- Return out. --->
		<cfreturn />
	</cffunction>
</cfcomponent>








