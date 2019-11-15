<!DOCTYPE html>
<html>
	<head>
		
		<title>Test App 123 - Roberto Cabrera</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<link href="styles.css" rel="stylesheet">
			
		<script>
			jQuery(function($){
				
				$(document).ready(function(){
					
					<cfif structKeyExists(session,"userLoggedIn") and session.userLoggedIn eq "yes">
						
						$(".response").load("index-msg.cfm");
						
					<cfelse>
						
						$(".response").load("login.cfm");
						
					</cfif>	
						
				});
			});
  
		</script>
    
	</head>
	<body class="text-center ">
		<div class="form-signin response"></div>
	</body>
</html>