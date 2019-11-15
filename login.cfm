	
	<cfif structKeyExists(url,"clear") and url.clear eq "yes">
		<cfset StructClear(session)>
	</cfif>
	
	<style>
		.error{
			display:none;
		}
	</style>		
		<script>
			jQuery(function($){
				
				$("#inputUsername").blur(function(){ 
					
					if ($(this).val() !== "") {
						var isValid = validateInput($(this).val());
						 
						if(isValid && $("#inputPassword").val() !== ""){
							$("#signinbtn").prop("disabled",false);
						}else{
							$("#signinbtn").prop("disabled",true);
						}	
					}else{
						$("#signinbtn").prop("disabled",true);
					}
				});
				
				$("#inputPassword").blur(function(){ 
					
					if ($(this).val() !== "" && $("#inputUsername").val() !== "") {
						
						$("#signinbtn").prop("disabled",false);
							
					}else{
						$("#signinbtn").prop("disabled",true);
					}
				});
				
				
				$("#signinbtn").click(function(){
					
					if($("#inputUsername").val() !== "" && $("#inputPassword").val() !== ""){
						$.ajax({
							type:"POST",
							url: "process-login.cfm",
							data: {uname: $("#inputUsername").val(), password: $("#inputPassword").val()},
							success: function(res){
								
								var isOk = res.trim() == "ok";
								
								if (isOk){
									$(".response").load("index-msg.cfm");
								}else{
									$(".error").html(res).show();
								}
								
								
							}
						});
					}
					
					
				})
					
				
			});
			
			//letters & numbers only for username
			function validateInput(value) {
				
 				var letterNumber = /^[0-9a-zA-Z]+$/;
 				
 				if(value.match(letterNumber)) {
 					return true;
 				}
				
				return false;
  			}
  
		</script>
 

		  
  <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
  <label for="inputEmail" class="sr-only">Email address</label>
  <input type="text" id="inputUsername" class="form-control" placeholder="Username" required="required" autofocus="" maxlength="10">
  <label for="inputPassword" class="sr-only">Password</label>
  <input type="password" id="inputPassword" class="form-control" placeholder="Password" required="required">
  	
  <button class="btn btn-lg btn-primary btn-block" id="signinbtn" type="button" disabled="disabled" >Sign in</button>
  <div class="alert alert-danger error mt-3" role="alert"></div>

