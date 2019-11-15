<cfif structKeyExists(form,"uname") and form.uname neq "" and structKeyExists(form,"password") and form.password neq "">
	
	<cfif IsValid("string",trim(form.uname))>
		
		<cfquery name="getUser" datasource="#dsn#" >
			SELECT tb.tusername, tb.tpassword
			FROM #schema#.TESTTABLE tb
			WHERE tb.tusername = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="10" null="false" value="#trim(form.uname)#">
		</cfquery>
		
		<cfif getUser.recordCount gt 0>
			<cfif Hash(form.password, "SHA-256") neq trim(getUser.tpassword)>
				Invalid Password.
			<cfelse>
				
				<cfset session.userLoggedIn = "yes">
				ok
				
			</cfif>	
		<cfelse>
			No user found.
		</cfif>

	<cfelse>
		Invalid Username. Please try again.
	</cfif>
	
<cfelse>
	error
</cfif>